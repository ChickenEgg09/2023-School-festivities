<%@ page language="java" pageEncoding="UTF-8"%>

<%
	//로그인 여부, 아이디 정보
	String islogin = (String)session.getAttribute("islogin");
	String loginid = (String)session.getAttribute("loginid");

%>

<header>
    <div class="top">
        <div class="logo">
            <a href="./index.jsp"><img src="images/logo2.png" alt="로고자리"></a>
        </div>


        <div class="search-box">
            <a href="#"><img src="images/eheqhrl2.png" alt="돋보기 아이콘"></a>
            <input type="text" class="search-txt" name=""placeholder="검색어를 입력하세요">
          </div>
          
          <div class="spotmenu">
            <ul>                
              	<!-- <li><a href="./login.jsp">로그인 | 회원가입</a></li>    -->
              	
              	<!-- 로그인 하기 전이라면 로그인|회원가입이 보이게
              		로그인 상태라면 로그아웃이 보이게 -->
              	<%
                if(islogin == null) 
                {
               		out.println("<a href='./login.jsp'>로그인/회원가입</a>");
                }
                else
                {
                	String cmp = "ok";
                	if(islogin.compareTo(cmp) == 0)
                	{                
                		out.println(loginid+"님 <a href='./logout.jsp'>로그아웃</a>");
                	}
					else
					{ 
                		out.println("<a href='./login.jsp'>로그인/회원가입</a>");
                	}
                }
                %>           	
            </ul>
          </div>
          <div class="shopbag">
            <i class='bx bx-shopping-bag' id="shopicon" ></i>
          </div>

        <nav class="menu">
            <ul class="navi">
                 
                <li><a href="./bake.jsp">베이커리</a></li>

                <li><a href="./farm.jsp">농산</a></li>

                <li><a href="./animal.jsp">축산</a></li>

                <li><a href="./fish.jsp">수산</a></li>
                
            </ul>
        </nav>
    </div>
</header>