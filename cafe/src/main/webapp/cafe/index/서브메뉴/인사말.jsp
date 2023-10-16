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
    <link rel="stylesheet" type="text/css" href="../../css/noti.css">
    <link rel="stylesheet" type="text/css" href="../../css/home.css">
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
                            <img src="../../images/logo.png" alt="로고">
                        </a>
                    </div>
                </li>
                <li>
                    <nav class="menu" style="width: 1040px;">
                        <ul class="navi">
                            <li style="width: 200px;" class="active"><a href="인사말.jsp" onMouseOver='this.innerHTML="ABOUT"' onMouseOut='this.innerHTML="인사말"'>인사말</a></li>
                            <li style="width: 200px;"><a href="쇼핑.jsp" onMouseOver='this.innerHTML="SHOP"' onMouseOut='this.innerHTML="쇼핑"'>쇼핑</a></li>
                            <li style="width: 40px;"><a href="SHOP/장바구니/basket.jsp" style="width: 40px; height: 40px; margin: 0 20px;"><img src="../../images/장바구니.jpg"></a>
                            <li style="width: 200px;"><a href="메뉴판.jsp" onMouseOver='this.innerHTML="MENU"' onMouseOut='this.innerHTML="메뉴"'>메뉴</a></li>
                            <li style="width: 200px;"><a href="게시판.jsp" onMouseOver='this.innerHTML="COMMUNITY"' onMouseOut='this.innerHTML="커뮤니티"'>커뮤니티</a></li>
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
    <div class="bgi">
        <a href="#"><img src="../../images/galleryalice2.png" alt="갤러리앨리스"></a>
    </div>
    <div class="wrp">
        <div class="wrappers">
            <div class="Hello">
                <div class="Hello-title">
                    <h1>인사말</h1>
                </div>
                <div class="Hello-main">
                    <p>cafe Gallery Alice입니다.</p><br>
                    <p>광명동굴이 있는 가학동에 자리한 갤러리앨리스는 예쁜 카페를 품고 있습니다.
                        7년동안 멋진 공연과 전시를 통해 철산동은 물론 광명시를 포괄하는 문화공간을 운영했던 더스토리오브앨리스가 
                        가학동에 앨리스 시즌2를 시작합니다.</p><br>
                    <p>전시, 원더랜드콘서트, 맛있는 차돌박이 비빔밥으로 새롭게 만나는 갤러리앨리스는 
                        오래된 동네, 창고로 둘러쌓인 오지같은 가학동 한적한 동네에서 귀한 손님들을 기다립니다.</p><br>
                    <p>먼데서 오시는 손님을 귀중히 여기는 갤러리앨리스가 되겠습니다.</p><br>
                </div>
                <div class="Hello-img">
                    <img src="../../images/galleryAlice.png" alt="갤러리앨리스">
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