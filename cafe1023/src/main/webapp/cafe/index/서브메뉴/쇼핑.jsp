<%@page import="java.net.URLEncoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %> 


<%
String P_IMG_PATH="../product_board/p_img";
String islogin = (String) session.getAttribute("islogin");
String loginid = (String) session.getAttribute("loginid");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쇼핑</title>
<link rel="stylesheet" type="text/css" href="../../css/shop.css">
<link rel="stylesheet" type="text/css" href="../../css/home.css">
<link rel="stylesheet" type="text/css" href="../../css/Header.css">
<link rel="stylesheet" type="text/css" href="../../css/Footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../../js/home.js"></script>
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
							<li style="width: 200px;" class="active"><a href="쇼핑.jsp"
								onMouseOver='this.innerHTML="SHOP"'
								onMouseOut='this.innerHTML="쇼핑"'>쇼핑</a></li>
							<li style="width: 40px;"><a href="SHOP/장바구니/basket.jsp"
								style="width: 40px; height: 40px; margin: 0 20px;"><img
									src="../../images/장바구니.jpg"></a>
							<li style="width: 200px;"><a href="메뉴판.jsp"
								onMouseOver='this.innerHTML="MENU"'
								onMouseOut='this.innerHTML="메뉴"'>메뉴</a></li>
							<li style="width: 200px;"><a href="게시판.jsp"
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
	<article>
		<div id="banner">
			<img src="../../images/coffee.png" alt="커피">
		</div>
		<h1>판매되는 상품들</h1>
<%		
  String em=null;
  Connection con= null;
  Statement st =null;
  ResultSet rs =null;

  //db 연결
try {
	  
	Class.forName("oracle.jdbc.driver.OracleDriver"); //오라클로 변경

} catch (ClassNotFoundException e ) {
   out.println(e);
}

try{
      String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
      String dbId = "scott";
      String dbPass = "tiger";	
	  
	  con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	  
} catch (SQLException e) {
   out.println(e);
}



Vector num=new Vector();
Vector name=new Vector();
Vector img=new Vector();
Vector price=new Vector();
String htmlText;


try {
	  st = con.createStatement();
	  String sql = "select * from product order by num asc" ;
	  rs = st.executeQuery(sql);

	  if (!(rs.next()))  {
		  //상품이 없을 때 
	  	   out.println("등록된 상품이 없을 때");
	  } else {
		  
		  	htmlText = "<div id='product-list'>";
		  	
	   		do {
	    		num.addElement(new Integer(rs.getInt("num")));
	   			name.addElement(rs.getString("name"));
	    		img.addElement(rs.getString("img"));
	    		price.addElement(rs.getString("price"));	    		
	   		}while(rs.next());
	   		int totalRows = name.size();
	   		
	   		for(int i=0;i<totalRows;i++){
	    		htmlText = htmlText + "<!-- product-card " + num.elementAt(i)  + "-->";
	    		htmlText = htmlText + "<div class='product-card'>";
	    		htmlText = htmlText + "<a href='SHOP/view.jsp?productName="+ num.elementAt(i) +"'>";
	    		htmlText = htmlText + "<div>";
	    		htmlText = htmlText + "<img class='product-img' src='"+P_IMG_PATH+"/"+ img.elementAt(i) + "' alt=''>";
	    		htmlText = htmlText + "</div>";
	    		htmlText = htmlText + "<div class='product-contents'>";
	    		htmlText = htmlText + "<span class='product-name'>"+name.elementAt(i)+"</span><br>";
	    		htmlText = htmlText + "<span class='product-price'>"+price.elementAt(i)+"원</span>";
	    		htmlText = htmlText + "</div></a></div>";
	    		htmlText = htmlText + '\r' + '\n';
	   		}
	   
	   
	   		htmlText = htmlText + "</div>";
	   		out.println(htmlText);
	  } 		
}catch (SQLException e) {
		   out.println(e);
}
%>		
	
		
		
	</article>
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
							target="_blank"> <img src="../../images/sns1.jpg" alt="sns1"></a></li>
						<li><a href="https://cafegalleryalice.modoo.at/"
							target="_blank"> <img src="../../images/sns2.png" alt="sns2"></a></li>
						<li><a href="https://www.instagram.com/galleryalice_cafe/"
							target="_blank"> <img src="../../images/sns3.jpg" alt="sns3"></a></li>
					</div>
				</ul>
			</div>
			<div class="copye">Copyright ⓒ Gallery Alice All rights 20503
				kim</div>
		</div>
	</footer>
</body>
</html>