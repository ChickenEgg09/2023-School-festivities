<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*"%>
<%
String islogin = (String) session.getAttribute("islogin");
String loginid = (String) session.getAttribute("loginid");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="css/read.css">
<link rel="stylesheet" type="text/css" href="../../css/Header.css">
<link rel="stylesheet" type="text/css" href="../../css/Footer.css">
<link href="filegb.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
	<header>
		<div class="top">
			<ul>
				<li>
					<div class="logo">
						<a href="../home.jsp"> 𝓖𝓪𝓵𝓵𝓮𝓻𝔂 𝓐𝓵𝓲𝓬𝓮 </a>
					</div>
				</li>
				<li>
					<nav class="menu" style="width: 1040px;">
						<ul class="navi">
							<li style="width: 200px;"><a href="인사말.jsp"
								onMouseOver='this.innerHTML="ABOUT"'
								onMouseOut='this.innerHTML="인사말"'>인사말</a></li>
							<li style="width: 200px;"><a href="쇼핑.jsp"
								onMouseOver='this.innerHTML="SHOP"'
								onMouseOut='this.innerHTML="쇼핑"'>쇼핑</a></li>
							<li style="width: 40px;"><a href="SHOP/장바구니/basket.jsp"
								style="width: 40px; height: 40px; margin: 0 20px;"><img
									src="../../images/장바구니.jpg"></a>
							<li style="width: 200px;"><a href="메뉴판.jsp"
								onMouseOver='this.innerHTML="MENU"'
								onMouseOut='this.innerHTML="메뉴"'>메뉴</a></li>
							<li style="width: 200px;" class="active"><a href="게시판.jsp"
								onMouseOver='this.innerHTML="COMMUNITY"'
								onMouseOut='this.innerHTML="커뮤니티"'>커뮤니티</a></li>
							<li style="width: 200px;"><a href="오시는 길.jsp"
								onMouseOver='this.innerHTML="WAY TO COME"'
								onMouseOut='this.innerHTML="오시는 길"'>오시는 길</a></li>
						</ul>
					</nav>
				</li>
				<li class="login">
					<%
					if (islogin == null) {
						out.println("<a href='../가입/login.jsp'>로그인/회원가입</a>");
					} else {
						String cmp = "ok";
						if (islogin.compareTo(cmp) == 0) {
							out.println("<a href='../가입/logout.jsp'>로그아웃</a>");
						} else {
							out.println("<a href='../가입/logout.jsp'>로그인/회원가입</a>");
						}
					}
					%>
				</li>
			</ul>
		</div>
	</header>
	<%
	String sql = null;
	Connection con = null;
	PreparedStatement st = null;
	ResultSet rs = null;

	int id = Integer.parseInt(request.getParameter("id"));

	try {

		Class.forName("oracle.jdbc.driver.OracleDriver"); //占쏙옙占쏙옙클占쏙옙 占쏙옙占쏙옙
		//Class.forName("org.gjt.mm.mysql.Driver"); // mysql 
	} catch (ClassNotFoundException e) {
		out.println(e);
	}

	try {
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "scott";
		String dbPass = "tiger";

		con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		// con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fboard?useUnicode=true&characterEncoding=euckr","root","multi");
	} catch (SQLException e) {
		out.println(e);
	}

	try {
		sql = "select * from freeboard where id=? ";
		st = con.prepareStatement(sql);
		st.setInt(1, id);
		rs = st.executeQuery();

		if (!(rs.next())) {
			out.println("해당 내용이 없습니다");
		} else {
			String em = rs.getString("email");
			if ((em != null) && (!(em.equals(""))))
		em = "<A href=mailto:" + em + ">" + rs.getString("name") + "</A>";
			else
		em = rs.getString("name");
			out.println("<table width='1200' cellspacing='0' cellpadding='2'>");
			out.println("<tr>");
			out.println("<td height='22'>&nbsp;</td></tr>");
			out.println("<tr align='center'>");
			out.println("<td height='1' bgcolor='#1F4F8F'></td>");
			out.println("</tr>");
			out.println("<tr align='center' bgcolor='#DFEDFF'>");
			out.println("<td class='button' bgcolor='#DFEDFF'>");
			out.println("<div align='left' class='ez'><font size='2'>" + rs.getString("SUBJECT") + "</div> </td>");
			out.println("</tr>");
			out.println("<tr align='center' bgcolor='#FFFFFF' class='ex'>");
			out.println("<td align='center' bgcolor='#F4F4F4'>");
			out.println("<table width='100%' border='0' cellpadding='0' cellspacing='4' height='1'>");
			out.println("<tr bgcolor='#F4F4F4'>");
			out.println("<td width='13%' height='7'></td>");
			out.println("<td width='51%' height='7'>글쓴이 : " + em + "</td>");
			out.println("<td width='25%' height='7'></td>");
			out.println("<td width='11%' height='7'></td>");
			out.println("</tr>");
			out.println("<tr bgcolor='#F4F4F4'>");
			out.println("<td width='13%'></td>");
			out.println("<td width='51%'>작성일 : " + rs.getString("inputdate") + "</td>");
			out.println("<td width='25%'>조회 : " + (rs.getInt("readcount") + 1) + "</td>");
			out.println("<td width='11%'></td>");
			out.println("</tr>");
			out.println("</table>");
			out.println("</td>");
			out.println("</tr>");
			out.println("<tr align='center'>");
			out.println("<td bgcolor='#1F4F8F' height='1'></td>");
			out.println("</tr>");
			out.println("<tr align='center'>");
			out.println("<td style='padding:10 0 0 0'>");
			out.println("<div align='left'><br>");
			out.println("<font size='3' color='#333333'><PRE>" + rs.getString("content") + "</PRE></div>");
			out.println("<br>");
			out.println("</td>");
			out.println("</tr>");
			out.println("<tr align='center'>");
			out.println("<td class='button' height='1'></td>");
			out.println("</tr>");
			out.println("<tr align='center'>");
			out.println("<td bgcolor='#1F4F8F' height='1'></td>");
			out.println("</tr>");
			out.println("</table>");
	%>
	<table width="1200" border="0" cellpadding="0" cellspacing="5" class="">
		<tr>
			<td align="right" width="450"><A
				href="게시판.jsp?go=<%=request.getParameter("page")%>">
					<img src="image/list.jpg" border=0>
			</a></td>
			<td width="70" align="right"><A
				href="freeboard_rwrite.jsp?id=<%=request.getParameter("id")%>&page=<%=request.getParameter("page")%>">
					<img src="image/reply.jpg" border=0>
			</A></td>
			<td width="70" align="right"><A
				href="freeboard_upd.jsp?id=<%=id%>&page=1"><img
					src="image/edit.jpg" border=0></A></td>
			<td width="70" align="right"><A
				href="freeboard_del.jsp?id=<%=id%>&page=1"><img
					src="image/del.jpg" border=0></A></td>
		</tr>
	</table>
	<%
	sql = "update freeboard set readcount= readcount + 1 where id= ?";
	st = con.prepareStatement(sql);
	st.setInt(1, id);
	st.executeUpdate();
	}
	rs.close();
	st.close();
	con.close();
	} catch (SQLException e) {
	out.println(e);
	}
	%>
	<footer>
		<div class="bottom">
			<div class="btlogo">
				<img src="../../images/ftlogo.png" alt="하단로고">
			</div>
			<div class="copy">
				<ul>
					<li>상호 : Gallery Alice | 대표 : Cute | 주소 : 광명시 경기도 광명시 <br>
						사업자등록번호 : 123-45-67890 | 전화번호 : 전화번호 : 02-1234-1234 | 이메일 :
						qwer1234@naver.com
					</li>
					<div class="sns">
						<li><a
							href="https://www.facebook.com/people/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%95%A8%EB%A6%AC%EC%8A%A4/100069607637396/"
							target="_blank"><img src="../../images/sns1.jpg"
								alt="sns1"></a></li>
						<li><a href="https://cafegalleryalice.modoo.at/"
							target="_blank"><img src="../../images/sns2.png"
								alt="sns2"></a></li>
						<li><a
							href="https://www.instagram.com/galleryalice_cafe/"
							target="_blank"><img src="../../images/sns3.jpg"
								alt="sns3"></a></li>
					</div>
				</ul>
			</div>
			<div class="copye">Copyright ⓒ Gallery Alice All rights
				20503 kim</div>
		</div>
	</footer>
</BODY>
</HTML>