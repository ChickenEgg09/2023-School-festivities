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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../css/nt.css">
    <link rel="stylesheet" type="text/css" href="../../css/Footer.css">
    <link rel="stylesheet" type="text/css" href="../../css/Header.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>6대 다류 차회</title>
</head>
<body>
    <header>
        <div class="top">
            <ul>
                <li>
                    <div class="logo">
                        <a href="../home.jsp">
                            <img src="../../images/logo.png" alt="로고">
                        </a>
                    </div>
                </li>
                <li>
                    <nav class="menu" style="width: 1040px;">
                        <ul class="navi">
                            <li style="width: 200px;"><a href="../서브메뉴/인사말.jsp" onMouseOver='this.innerHTML="ABOUT"' onMouseOut='this.innerHTML="인사말"'>인사말</a></li>
                            <li style="width: 200px;"><a href="../서브메뉴/쇼핑.jsp" onMouseOver='this.innerHTML="SHOP"' onMouseOut='this.innerHTML="쇼핑"'>쇼핑</a></li>
                            <li style="width: 40px;"><a href="../서브메뉴/SHOP/장바구니/basket.jsp" style="width: 40px; height: 40px; margin: 0 20px;"><img src="../../images/장바구니.jpg"></a>
                            <li style="width: 200px;"><a href="../서브메뉴/메뉴판.jsp" onMouseOver='this.innerHTML="MENU"' onMouseOut='this.innerHTML="메뉴"'>메뉴</a></li>
                            <li style="width: 200px;"><a href="../서브메뉴/게시판.jsp" onMouseOver='this.innerHTML="COMMUNITY"' onMouseOut='this.innerHTML="커뮤니티"'>커뮤니티</a></li>
                            <li style="width: 200px;"><a href="../서브메뉴/오시는 길.jsp" onMouseOver='this.innerHTML="WAY TO COME"' onMouseOut='this.innerHTML="오시는 길"'>오시는 길</a></li>
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
    <div class="wrp">
        <div class="wrapp">
            <div class="noti-wrap">
                <div class="noti-view-wrap">
                    <div class="noti-view">
                        <div class="title">
                            6대 다류 차회
                        </div>
                        <div class="info">
                            <dl>
                                <dt>번호</dt>
                                <dd>2</dd>
                            </dl>
                            <dl>
                                <dt>글쓴이</dt>
                                <dd>관리자</dd>
                            </dl>
                            <dl>
                                <dt>날짜</dt>
                                <dd>2021.11.26</dd>
                            </dl>
                            <dl>
                                <dt>조회</dt>
                                <dd>1539</dd>
                            </dl>
                        </div>
                        <div class="cont">


알고 마시면 훨씬 맛있는 차<br>
이야기와 문화가 있는 차 행사에 초대합니다.<br><br>

갤러리앨리스에서 열리는 [ 6대 다류 차회 ] - 차 한잔의 위로에 함께 해 보세요<br><br>

*6대 다류는 녹차, 백차, 청차, 황차, 홍차. 흑차를 말하는데,<br>
이번 차회에서는 황차를 대신해 말차로 6가지의 차가 준비됩니다.<br>
6대 다류 차회 : 차 한잔의 위로<br><br>

2021. 11. 26(FRI) 13:00 ~ 17:00<br>
                        </div>
                    </div>
                    <div class="nt-wrap">
                        <a href="../서브메뉴/행사&교육.jsp" class="on">목록</a>
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
                    <li>상호 : Gallery Alice | 대표 : Cute | 주소 : 광명시 경기도 광명시 <br>
                        사업자등록번호 : 123-45-67890 | 전화번호 : 전화번호 : 02-1234-1234 | 이메일 : qwer1234@naver.com
                    </li>
                    <div class="sns">
                        <li><a href="https://www.facebook.com/people/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%95%A8%EB%A6%AC%EC%8A%A4/100069607637396/"
                                target="_blank">
                                <img src="../../images/sns1.jpg" alt="sns1"></a></li>
                        <li><a href="https://cafegalleryalice.modoo.at/" target="_blank">
                                <img src="../../images/sns2.png" alt="sns2"></a></li>
                        <li><a href="https://www.instagram.com/galleryalice_cafe/" target="_blank">
                                <img src="../../images/sns3.jpg" alt="sns3"></a></li>
                    </div>
                </ul>
            </div>
            <div class="copye">
                Copyright ⓒ Gallery Alice All rights 20503 kim
            </div>
        </div>
    </footer>
</div>
</body>
</html>