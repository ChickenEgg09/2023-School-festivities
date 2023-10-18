<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String islogin = (String)session.getAttribute("islogin");	
	String loginid = (String)session.getAttribute("loginid");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>이벤트 리스너로 장바구니 수량 변경 및 자동 합계 구하기</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
        integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="basket.css" />
    <link rel="stylesheet" type="text/css" href="../../../../css/Footer.css">
    <link rel="stylesheet" type="text/css" href="../../../../css/Header.css">
    <script type="text/javascript" src="basket.js"></script>
</head>

<body>
    <header>
        <div class="top">
            <ul>
                <li>
                    <div class="logo">
                        <a href="../../../home.jsp">
                            𝓖𝓪𝓵𝓵𝓮𝓻𝔂 𝓐𝓵𝓲𝓬𝓮
                        </a>
                    </div>
                </li>
                <li>
                    <nav class="menu" style="width: 1050px;">
                        <ul class="navi">
                            <li style="width: 200px;"><a href="../../인사말.jsp" onMouseOver='this.innerHTML="ABOUT"' onMouseOut='this.innerHTML="인사말"'>인사말</a></li>
                            <li style="width: 200px;"><a href="../../쇼핑.jsp" onMouseOver='this.innerHTML="SHOP"' onMouseOut='this.innerHTML="쇼핑"'>쇼핑</a></li>
                            <li style="width: 50px;"><a href="basket.jsp" style="width: 40px; height: 40px; margin: 0 20px;"><img src="../../../../images/장바구니.jpg"></a>
                            <li style="width: 200px;"><a href="../../메뉴판.jsp" onMouseOver='this.innerHTML="MENU"' onMouseOut='this.innerHTML="메뉴"'>메뉴</a></li>
                            <li style="width: 200px;"><a href="../../게시판.jsp" onMouseOver='this.innerHTML="COMMUNITY"' onMouseOut='this.innerHTML="커뮤니티"'>커뮤니티</a></li>
                            <li style="width: 200px;"><a href="../../오시는 길.jsp" onMouseOver='this.innerHTML="WAY TO COME"' onMouseOut='this.innerHTML="오시는 길"'>오시는 길</a></li>
                        </ul>
                    </nav>
                </li>
                <li class="login">
                <%
                if(islogin == null) {
               		out.println("<a href='../../../가입/login.jsp'>로그인/회원가입</a>");
                }else{
                	String cmp = "ok";
                	if(islogin.compareTo(cmp) == 0){                
                		out.println("<a href='../../../가입/logout.jsp'>로그아웃</a>");
                	}else{ 
                		out.println("<a href='../../../가입/logout.jsp'>로그인/회원가입</a>");
                	}
                }
                %>
                </li>
            </ul>
        </div>
    </header>
    <div class="container">
		<h2>장바구니</h2>
	</div>
    <form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
        <input type="hidden" name="cmd" value="order">
        <div class="basketdiv" id="basket">
            <div class="row head">
                <div class="subdiv">
                    <div class="check">선택</div>
                    <div class="img">이미지</div>
                    <div class="pname">상품명</div>
                </div>
                <div class="subdiv">
                    <div class="basketprice">가격</div>
                    <div class="num">수량</div>
                    <div class="sum">합계</div>
                </div>
                <div class="subdiv">
                    <div class="basketcmd">삭제</div>
                </div>
                <div class="split"></div>
            </div>
            <div class="row data">
                <div class="subdiv">
                    <div class="check">
                        <input type="checkbox" name="buy" value="260" checked=""
                            onclick="javascript:basket.checkItem();">
                        &nbsp;
                    </div>
                    <div class="img">
                        <img src="../../../../images/원두콩.png" width="60">
                    </div>
                    <div class="pname">
                        <span>[갤러리 앨리스] 10월 원두콩</span>
                    </div>
                </div>
                <div class="subdiv">
                    <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price"
                            value="30000">30,000원</div>
                    <div class="num">
                        <div class="updown">
                        	<span onclick="javascript:basket.changePNum(1);">
                                <i class="fas fa-arrow-alt-circle-down down"></i>
                            </span>
                            <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="1"
                                onkeyup="javascript:basket.changePNum(1);" style="text-align: center;">
                            <span onclick="javascript:basket.changePNum(1);">
                                <i class="fas fa-arrow-alt-circle-up up"></i>
                            </span>
                        </div>
                    </div>
                    <div class="sum">30,000원</div>
                </div>
                <div class="subdiv">
                    <div class="basketcmd"><a href="javascript:void(0)" class="abutton"
                            onclick="javascript:basket.delItem();">삭제</a></div>
                </div>
            </div>
            <div class="row data">
                <div class="subdiv">
                    <div class="check"><input type="checkbox" name="buy" value="261" checked=""
                            onclick="javascript:basket.checkItem();">&nbsp;</div>
                    <div class="img"><img src="../../../../images/가을 블렌드.png" width="60"></div>
                    <div class="pname">
                        <span>단풍 블렌드</span>
                    </div>
                </div>
                <div class="subdiv">
                    <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price"
                            value="25000">25,000원</div>
                    <div class="num">
                        <div class="updown">
                        	<span onclick="javascript:basket.changePNum(2);"><i
                                    class="fas fa-arrow-alt-circle-down down"></i></span>
                            <input type="text" name="p_num2" id="p_num2" size="2" maxlength="4" class="p_num" value="1"
                                onkeyup="javascript:basket.changePNum(2);" style="text-align: center;">
                            <span onclick="javascript:basket.changePNum(2);"><i
                                    class="fas fa-arrow-alt-circle-up up"></i></span>
                        </div>
                    </div>
                    <div class="sum">25,000원</div>
                </div>
                <div class="subdiv">
                    <div class="basketcmd"><a href="javascript:void(0)" class="abutton"
                            onclick="javascript:basket.delItem();">삭제</a></div>
                </div>
            </div>
            <div class="row data">
                <div class="subdiv">
                    <div class="check"><input type="checkbox" name="buy" value="262" checked=""
                            onclick="javascript:basket.checkItem();">&nbsp;</div>
                    <div class="img"><img src="../../../../images/강릉 블랜드.png" width="60"></div>
                    <div class="pname">
                        <span>강릉 블렌드</span>
                    </div>
                </div>
                <div class="subdiv">
                    <div class="basketprice"><input type="hidden" name="p_price" id="p_price3" class="p_price"
                            value="22000">22,000원</div>
                    <div class="num">
                        <div class="updown">
                        	<span onclick="javascript:basket.changePNum(3);"><i
                                    class="fas fa-arrow-alt-circle-down down"></i></span>
                            <input type="text" name="p_num3" id="p_num3" size="2" maxlength="4" class="p_num" value="1"
                                onkeyup="javascript:basket.changePNum(3);" style="text-align: center;">
                            <span onclick="javascript:basket.changePNum(3);"><i
                                    class="fas fa-arrow-alt-circle-up up"></i></span>
                        </div>
                    </div>
                    <div class="sum">22,000원</div>
                </div>
                <div class="subdiv">
                    <div class="basketcmd"><a href="javascript:void(0)" class="abutton"
                            onclick="javascript:basket.delItem();">삭제</a></div>
                </div>
            </div>

        </div>

        <div class="right-align basketrowcmd">
            <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
            <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
        </div>

        <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: 3개</div>
        <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: 77,000원</div>

        <div id="goorder" class="">
            <div class="clear"></div>
            <div class="buttongroup center-align cmd">
                <a href="javascript:void(0);">선택한 상품 주문</a>
            </div>
        </div>
    </form>
    <footer>
        <div class="bottom">
            <div class="btlogo">
                <img src="../../../../images/ftlogo.png" alt="하단로고">
            </div>
            <div class="copy">
                <ul>
                    <li>상호 : Gallery Alice | 대표 : Cute | 주소 : 광명시 경기도 광명시 <br>
                        사업자등록번호 : 123-45-67890 | 전화번호 : 전화번호 : 02-1234-1234 | 이메일 : qwer1234@naver.com
                    </li>
                    <div class="sns">
                        <li><a href="https://www.facebook.com/people/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%95%A8%EB%A6%AC%EC%8A%A4/100069607637396/"
                                target="_blank">
                                <img src="../../../../images/sns1.jpg" alt="sns1"></a></li>
                        <li><a href="https://cafegalleryalice.modoo.at/" target="_blank">
                                <img src="../../../../images/sns2.png" alt="sns2"></a></li>
                        <li><a href="https://www.instagram.com/galleryalice_cafe/" target="_blank">
                                <img src="../../../../images/sns3.jpg" alt="sns3"></a></li>
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