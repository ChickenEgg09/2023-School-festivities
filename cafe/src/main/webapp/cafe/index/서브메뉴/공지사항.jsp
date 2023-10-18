<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String islogin = (String)session.getAttribute("islogin");	
	String loginid = (String)session.getAttribute("loginid");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인사말</title>
    <link rel="stylesheet" type="text/css" href="../../css/Header.css">
    <link rel="stylesheet" type="text/css" href="../../css/home.css">
    <link rel="stylesheet" type="text/css" href="../../css/noti.css">
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
                       <a href="../home.jsp">
                            𝓖𝓪𝓵𝓵𝓮𝓻𝔂 𝓐𝓵𝓲𝓬𝓮
                        </a>
                    </div>
                </li>
                <li>
                    <nav class="menu" style="width: 1040px;">
                        <ul class="navi">
                            <li style="width: 200px;"><a href="인사말.jsp" onMouseOver='this.innerHTML="ABOUT"' onMouseOut='this.innerHTML="인사말"'>인사말</a></li>
                            <li style="width: 200px;"><a href="쇼핑.jsp" onMouseOver='this.innerHTML="SHOP"' onMouseOut='this.innerHTML="쇼핑"'>쇼핑</a></li>
                            <li style="width: 40px;"><a href="SHOP/장바구니/basket.jsp" style="width: 40px; height: 40px; margin: 0 20px;"><img src="../../images/장바구니.jpg"></a>
                            <li style="width: 200px;"><a href="메뉴판.jsp" onMouseOver='this.innerHTML="MENU"' onMouseOut='this.innerHTML="메뉴"'>메뉴</a></li>
                            <li style="width: 200px;" class="active"><a href="게시판.jsp" onMouseOver='this.innerHTML="COMMUNITY"' onMouseOut='this.innerHTML="커뮤니티"'>커뮤니티</a></li>
                            <li style="width: 200px;"><a href="오시는 길.jsp" onMouseOver='this.innerHTML="WAY TO COME"' onMouseOut='this.innerHTML="오시는 길"'>오시는 길</a></li>
                        </ul>
                    </nav>
                </li>
                <li class="login">
                <%
                if(islogin == null) {
               		out.println("<a href='../가입/login.jsp'>로그인/회원가입</a>");
                }else{
                	String cmp = "ok";
                	if(islogin.compareTo(cmp) == 0){                
                		out.println("<a href='../가입/logout.jsp'>로그아웃</a>");
                	}else{ 
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
                    <li><a href="게시판.jsp">게시판</a></li>
                    <li class="active"><a href="공지사항.jsp">공지사항</a></li>
                    <li><a href="Q&A.jsp">Q&A</a></li>
                    <li><a href="행사&교육.jsp">행사&교육</a></li>
                </ul>
            </div>
            <div class="noti">
                <div class="noti-wrap">
                    <div class="noti-listwrap">
                        <div class="noti-list">
                            <div class="side">
                                <div class="num">번호</div>
                                <div class="title">제목</div>
                                <div class="writer">글쓴이</div>
                                <div class="date">작성일</div>
                                <div class="count">조회</div>
                            </div>
                            <div>
                                <div class="num">주요공지</div>
                                <div class="title"><a href="../게시판/60th.jsp">60th 원더랜드콘서트</a></div>
                                <div class="writer">관리자</div>
                                <div class="date">2023.04.13</div>
                                <div class="count">526</div>
                            </div>
                            <div>
                                <div class="num">주요공지</div>
                                <div class="title"><a href="../게시판/59th.jsp">59th 원더랜드콘서트</a></div>
                                <div class="writer">관리자</div>
                                <div class="date">2023.03.01</div>
                                <div class="count">628</div>
                            </div>
                            <div>
                                <div class="num">주요공지</div>
                                <div class="title"><a href="../게시판/58th.jsp">58th 원더랜드콘서트</a></div>
                                <div class="writer">관리자</div>
                                <div class="date">2023.02.11</div>
                                <div class="count">1057</div>
                            </div>
                            <div>
                                <div class="num">주요공지</div>
                                <div class="title"><a href="../게시판/57th.jsp">57th 원더랜드콘서트</a></div>
                                <div class="writer">관리자</div>
                                <div class="date">2023.01.10</div>
                                <div class="count">861</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <div class="bottom">
            <div class="btlogo">
                <img src="../../images/ftlogo.png" alt="하단로고">
            </div>
            <div class="copy">
                <ul>
                    <li>상호 : Gallery Alice | 대표 : Cute  | 주소 : 광명시 경기도 광명시 <br>
                        사업자등록번호 : 123-45-67890  | 전화번호 : 전화번호 : 02-1234-1234 | 이메일 : qwer1234@naver.com 
                    </li>
                    <div class="sns">
                        <li><a href="https://www.facebook.com/people/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%95%A8%EB%A6%AC%EC%8A%A4/100069607637396/" target="_blank"><img src="../../images/sns1.jpg" alt="sns1"></a></li>
                        <li><a href="https://cafegalleryalice.modoo.at/" target="_blank"><img src="../../images/sns2.png" alt="sns2"></a></li>
                        <li><a href="https://www.instagram.com/galleryalice_cafe/" target="_blank"><img src="../../images/sns3.jpg" alt="sns3"></a></li>
                    </div>
                </ul>
            </div>
            <div class="copye">
                Copyright ⓒ Gallery Alice All rights 20503 kim
            </div>
        </div>
    </footer>
</body>
</html>