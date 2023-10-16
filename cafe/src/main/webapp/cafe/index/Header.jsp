<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String islogin = (String)session.getAttribute("islogin");	
	String loginid = (String)session.getAttribute("loginid");

//	out.println(islogin);
	
//	out.println(loginid);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery Alice</title>
<link rel="stylesheet" type="text/css" href="../css/Header.css">
</head>
<body>
<header>
        <div class="top">
            <ul>
                <li>
                    <div class="logo">
                        <a href="home.jsp">
                            <img src="../images/logo.png" alt="로고">
                        </a>
                    </div>
                </li>
                <li>
                    <nav class="menu" style="width: 1040px;">
                        <ul class="navi">
                            <li style="width: 200px;"><a href="서브메뉴/인사말.jsp" onMouseOver='this.innerHTML="ABOUT"' onMouseOut='this.innerHTML="인사말"'>인사말</a></li>
                            <li style="width: 200px;"><a href="서브메뉴/쇼핑.jsp" onMouseOver='this.innerHTML="SHOP"' onMouseOut='this.innerHTML="쇼핑"'>쇼핑</a></li>
                            <li style="width: 40px;"><a href="서브메뉴/SHOP/장바구니/basket.jsp" style="width: 40px; height: 40px; margin: 0 20px;"><img src="../images/장바구니.jpg"></a>
                            <li style="width: 200px;"><a href="서브메뉴/메뉴판.jsp" onMouseOver='this.innerHTML="MENU"' onMouseOut='this.innerHTML="메뉴"'>메뉴</a></li>
                            <li style="width: 200px;"><a href="서브메뉴/게시판.jsp" onMouseOver='this.innerHTML="COMMUNITY"' onMouseOut='this.innerHTML="커뮤니티"'>커뮤니티</a></li>
                            <li style="width: 200px;"><a href="서브메뉴/오시는 길.jsp" onMouseOver='this.innerHTML="WAY TO COME"' onMouseOut='this.innerHTML="오시는 길"'>오시는 길</a></li>
                        </ul>
                    </nav>
                </li>
                <li class="login">
                <%
                if(islogin == null) {
               		out.println("<a href='가입/login.jsp'>로그인/회원가입</a>");
                }else{
                	String cmp = "ok";
                	if(islogin.compareTo(cmp) == 0){                
                		out.println("<a href='가입/logout.jsp'>로그아웃</a>");
                	}else{ 
                		out.println("<a href='가입/logout.jsp'>로그인/회원가입</a>");
                	}
                }
                %>
                </li>
            </ul>
        </div>
    </header>
</body>
</html>