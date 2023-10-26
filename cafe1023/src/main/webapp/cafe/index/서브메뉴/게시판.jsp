<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.LocalDate"%>
<%
String islogin = (String) session.getAttribute("islogin");
String loginid = (String) session.getAttribute("loginid");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인사말</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<link rel="stylesheet" type="text/css" href="../../css/Header.css">
<link rel="stylesheet" type="text/css" href="../../css/home.css">
<link rel="stylesheet" type="text/css" href="../../css/Footer.css">
<link rel="stylesheet" type="text/css" href="../../css/noti.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/home.js"></script>
<SCRIPT language="javascript">
	function check() {
		with (document.msgsearch) {
			if (sval.value.length == 0) {
				alert("검색어를 입력해 주세요!!");
				sval.focus();
				return false;
			}
			document.msgsearch.submit();
		}
	}
	function rimgchg(p1, p2) {
		if (p2 == 1)
			document.images[p1].src = "image/open.gif";
		else
			document.images[p1].src = "image/arrow.gif";
	}

	function imgchg(p1, p2) {
		if (p2 == 1)
			document.images[p1].src = "image/open.gif";
		else
			document.images[p1].src = "image/close.gif";
	}
</SCRIPT>
</head>
<body>
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
	<div class="nog">
		<a href="#"><img src="../../images/커뮤니티.png" alt="커뮤니티"></a>
	</div>
	<div class="wrpp">
		<div class="wrapper">
			<div class="tabmenu">
				<ul class="tabmenu-wrap">
					<li class="active"><a href="게시판.jsp">자유 게시판</a></li>
					<li><a href="공지사항.jsp">공지사항</a></li>
					<li><a href="행사&교육.jsp">행사&교육</a></li>
				</ul>
			</div>
			<CENTER>
				<FORM method="post" name="msgsearch" action="freeboard_search.jsp">
					<TABLE border=0 width=1200px cellpadding=0 cellspacing=0>
						<TR>
							<TD align=right width="470"><SELECT name=stype style="width: 150px; height: 30px; line-height: 30px">
									<OPTION value=1>이름
									<OPTION value=2>제목
									<OPTION value=3>내용
									<OPTION value=4>이름+제목
									<OPTION value=5>이름+내용
									<OPTION value=6>제목+내용
									<OPTION value=7>이름+제목+내용
							</SELECT></TD>
							<TD width="150" align="left"><INPUT type=text size="17"
								name="sval" style="width: 150px; height: 26px; line-height: 26px"></TD>
							<TD width="150">&nbsp;<a href="#" onClick="check();"
								class="center-td"><img src="image/serach.gif" border="0"
									align='absmiddle'></A></TD>
							<TD align=right valign=bottom width="150" class="center-ln">
								<%
								if (islogin == null) {
								%> <a href="../가입/login.jsp" onclick="alert('로그인해주세요');"><img
									src="image/write.gif" border="0" class="center-td"></a> <%
 								} else {
 								%> <a href="freeboard_write.jsp"><img src="image/write.gif"
									border="0" class="center-td"></a> <%
 								}
 								%>
							</TD>
						</TR>
					</TABLE>
				</FORM>
				<TABLE border=0 width=1200 cellpadding=4 cellspacing=0>
					<tr align="center">
						<td colspan="5" height="1" bgcolor="#1F4F8F"></td>
					</tr>
					<tr align="center" bgcolor="#87E8FF" class="table-center-td">
						<td width="150px" bgcolor="#DFEDFF"><font size="2">번호</font></td>
						<td width="600px" bgcolor="#DFEDFF"><font size="2">제목</font></td>
						<td width="150px" bgcolor="#DFEDFF"><font size="2">등록자</font></td>
						<td width="150px" bgcolor="#DFEDFF"><font size="2">날짜</font></td>
						<td width="150px" bgcolor="#DFEDFF"><font size="2">조회</font></td>
					</tr>
					<tr align="center">
						<td colspan="5" bgcolor="#1F4F8F" height="1"></td>
					</tr>
					<%
					Vector name = new Vector();
					Vector inputdate = new Vector();
					Vector email = new Vector();
					Vector subject = new Vector();
					Vector rcount = new Vector();

					Vector step = new Vector();
					Vector keyid = new Vector();
					int where = 1;

					int totalgroup = 0;
					int maxpages = 2;
					int startpage = 1;
					int endpage = startpage + maxpages - 1;
					int wheregroup = 1;

					if (request.getParameter("go") != null) {
						where = Integer.parseInt(request.getParameter("go"));
						wheregroup = (where - 1) / maxpages + 1;
						startpage = (wheregroup - 1) * maxpages + 1;
						endpage = startpage + maxpages - 1;
					} else if (request.getParameter("gogroup") != null) {
						wheregroup = Integer.parseInt(request.getParameter("gogroup"));
						startpage = (wheregroup - 1) * maxpages + 1;
						where = startpage;
						endpage = startpage + maxpages - 1;
					}
					int nextgroup = wheregroup + 1;
					int priorgroup = wheregroup - 1;

					int nextpage = where + 1;
					int priorpage = where - 1;
					int startrow = 0;
					int endrow = 0;
					int maxrows = 5;
					int totalrows = 0;
					int totalpages = 0;

					int id = 0;

					String em = null;
					Connection con = null;
					Statement st = null;
					ResultSet rs = null;

					try {

						Class.forName("oracle.jdbc.driver.OracleDriver"); //오라클로 변경
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
						st = con.createStatement();
						String sql = "select * from freeboard order by";
						sql = sql + " masterid desc, replynum, step, id";
						rs = st.executeQuery(sql);

						if (!(rs.next())) {
							out.println("게시판에 올린 글이 없습니다");
						} else {
							do {
						keyid.addElement(new Integer(rs.getInt("id")));
						name.addElement(rs.getString("name"));
						email.addElement(rs.getString("email"));

						String idate = rs.getString("inputdate");
						// idate = idate.substring(0,8);
						//  LocalDateTime ldt = rs.getObject("inputdate", LocalDateTime.class );
						//idate = ldt.toString();

						inputdate.addElement(idate);
						//   inputdate.addElement(ldt.toString());

						subject.addElement(rs.getString("subject"));
						rcount.addElement(new Integer(rs.getInt("readcount")));
						step.addElement(new Integer(rs.getInt("step")));
							} while (rs.next());
							totalrows = name.size();
							totalpages = (totalrows - 1) / maxrows + 1;
							startrow = (where - 1) * maxrows;
							endrow = startrow + maxrows - 1;
							if (endrow >= totalrows)
						endrow = totalrows - 1;

							totalgroup = (totalpages - 1) / maxpages + 1;
							if (endpage > totalpages)
						endpage = totalpages;

							for (int j = startrow; j <= endrow; j++) {
						String temp = (String) email.elementAt(j);
						if ((temp == null) || (temp.equals("")))
							em = (String) name.elementAt(j);
						else
							em = "<A href=mailto:" + temp + ">" + name.elementAt(j) + "</A>";

						id = totalrows - j;
						if (j % 2 == 0) {
							out.println(
									"<TR bgcolor='#FFFFFF' onMouseOver=\" bgColor= '#DFEDFF'\" onMouseOut=\"bgColor=''\"  class=center-tr>");
						} else {
							out.println(
									"<TR bgcolor='#F4F4F4' onMouseOver=\" bgColor= '#DFEDFF'\" onMouseOut=\"bgColor='#F4F4F4'\" class=center-tr>");
						}
						out.println("<TD align=center>");
						out.println(id + "</TD>");
						out.println("<TD>");
						int stepi = ((Integer) step.elementAt(j)).intValue();
						int imgcount = j - startrow;
						if (stepi > 0) {
							for (int count = 0; count < stepi; count++)
							out.print("<A href=freeboard_read.jsp?id=");
							out.print(keyid.elementAt(j) + "&page=" + where);
							out.print(" onmouseover=\"rimgchg\"");
							out.print(" onmouseout=\"rimgchg\">");
						} else {
							out.print("<A href=freeboard_read.jsp?id=");
							out.print(keyid.elementAt(j) + "&page=" + where);
							out.print(" onmouseover=\"imgchg\"");
							out.print(" onmouseout=\"imgchg\">");
						}
						out.println(subject.elementAt(j) + "</TD>");
						out.println("<TD align=center>");
						out.println(em + "</TD>");
						out.println("<TD align=center>");
						out.println(inputdate.elementAt(j) + "</TD>");
						out.println(" </TD>");
						out.println("<TD align=center>");
						out.println(rcount.elementAt(j) + "</TD>");
						out.println("</TR>");
							}
							rs.close();
						}
						out.println("</TABLE>");
						st.close();
						con.close();
					} catch (java.sql.SQLException e) {
						out.println(e);
					}
					%>
					<div class="List">
						<%
						if (wheregroup > 1) {
							out.println("[<A href=게시판.jsp?gogroup=1>처음</A>]");
							out.println("[<A href=게시판.jsp?gogroup=" + priorgroup + ">이전</A>]");
						} else {
							out.println("[처음]");
							out.println("[이전]");
						}
						if (name.size() != 0) {
							for (int jj = startpage; jj <= endpage; jj++) {
								if (jj == where)
							out.println("[" + jj + "]");
								else
							out.println("[<A href=게시판.jsp?go=" + jj + ">" + jj + "</A>]");
							}
						}
						if (wheregroup < totalgroup) {
							out.println("[<A href=게시판.jsp?gogroup=" + nextgroup + ">다음</A>]");
							out.println("[<A href=게시판.jsp?gogroup=" + totalgroup + ">마지막</A>]");
						} else {
							out.println("[다음]");
							out.println("[마지막]");
						}
						out.println("전체 글수 :" + totalrows);
						%>
					</div>
				</CENTER>
			</div>
		</div>
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
</body>
</html>