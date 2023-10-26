<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.text.DecimalFormat" %> 

<%
	String islogin = (String)session.getAttribute("islogin");	
	String loginid = (String)session.getAttribute("loginid");
	String productName = request.getParameter("productName");	
%>

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
	  
	  // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fboard?useUnicode=true&characterEncoding=euckr","root","multi");
} catch (SQLException e) {
   out.println(e);
}



Vector num=new Vector();
Vector name=new Vector();
Vector img=new Vector();
Vector price=new Vector();
Vector cont=new Vector();

String htmlText;


try {
	  st = con.createStatement();
	  String sql = "select * from product where num = "+ productName ;
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
	    		cont.addElement(rs.getString("content"));
	   		}while(rs.next());
	   		int totalRows = name.size();
	   		
	   		for(int i=0;i<totalRows;i++){
	   			// 레코드가 하나 뿐임. 여기서 설정해 줄 필요 없음
	   		}
	   
	   
	   		htmlText = htmlText + "</div>";
	   		out.println(htmlText);
	   		rs.close();
	  } 
	  
	   

	  st.close();
	  con.close();
}catch (SQLException e) {
		   out.println(e);
}
%>	






<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../../../css/쇼핑.css">
    <link rel="stylesheet" type="text/css" href="../../../css/Footer.css">
    <link rel="stylesheet" type="text/css" href="../../../css/Header.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../../../js/shop.js"></script>

<script type="text/javascript">
	function fn_add_bask(){
		if (confirm('장바구니에 등록하시겠습니까?')) {
			//alert('등록되었습니다.');
		}else{
			return false;
		}
	}
	function login() {
		alert('로그인하세요');
		
	}
</script>

</head>

<body>
    <header>
        <div class="top">
            <ul>
                <li>
                    <div class="logo">
                        <a href="../../home.jsp">
                            𝓖𝓪𝓵𝓵𝓮𝓻𝔂 𝓐𝓵𝓲𝓬𝓮
                        </a>
                    </div>
                </li>
                <li>
                    <nav class="menu" style="width: 1040px;">
                        <ul class="navi">
                            <li style="width: 200px;"><a href="../인사말.jsp" onMouseOver='this.innerHTML="ABOUT"' onMouseOut='this.innerHTML="인사말"'>인사말</a></li>
                            <li style="width: 200px;" class="active"><a href="../쇼핑.jsp" onMouseOver='this.innerHTML="SHOP"' onMouseOut='this.innerHTML="쇼핑"'>쇼핑</a></li>
                            <li style="width: 40px;"><a href="장바구니/basket.jsp" style="width: 40px; height: 40px; margin: 0 20px;"><img style="width: 40px; height: 40px" src="../../../images/장바구니.jpg"></a>
                            <li style="width: 200px;"><a href="../메뉴판.jsp" onMouseOver='this.innerHTML="MENU"' onMouseOut='this.innerHTML="메뉴"'>메뉴</a></li>
                            <li style="width: 200px;"><a href="../게시판.jsp" onMouseOver='this.innerHTML="COMMUNITY"' onMouseOut='this.innerHTML="커뮤니티"'>커뮤니티</a></li>
                            <li style="width: 200px;"><a href="../오시는 길.jsp" onMouseOver='this.innerHTML="WAY TO COME"' onMouseOut='this.innerHTML="오시는 길"'>오시는 길</a></li>
                        </ul>
                    </nav>
                </li>
                <li class="login">
                <%
                if(islogin == null) {
               		out.println("<a href='../../가입/login.jsp'>로그인/회원가입</a>");
                }else{
                	String cmp = "ok";
                	if(islogin.compareTo(cmp) == 0){                
                		out.println("<a href='../../가입/logout.jsp'>로그아웃</a>");
                	}else{ 
                		out.println("<a href='../../가입/logout.jsp'>로그인/회원가입</a>");
                	}
                }
                %>
                </li>
            </ul>
        </div>
    </header>
    
    
    
    
    <input type="hidden" id="productName" value="<%= productName %>">
    <div class="wrap" style="margin-top: 30px">
        
        
        
        <div class="contents-shop">
            <div class="imgshop">
                <img src="../../product_board/p_img/<%=img.elementAt(0)%>">
            </div>
            <div class="detail">
                <div class="infoArea">
                    <h2 class="title"><%=name.elementAt(0)%></h2>
                    <span class="notes">
                        <em class="noteTit">
                        	<%
                        	String content1 = cont.elementAt(0).toString();
                        	out.println(content1.replaceAll("\r\n", "<br>")); // 줄바꿈 문자를 만나면 <br> 태그로 바꾸어 주기
                        	%>
                            <!--  
                            헤이즐넛의 고소한 풍미와<br>
							바닐라의 달콤한 향이 조화로운 커피<br><br>
							500g 31,000원
							-->
                        </em>
                    </span>
                    <em class="price">
                    	<%
                    	DecimalFormat mkComma = new DecimalFormat("#,###,###");
                    	int pr = Integer.parseInt(price.elementAt(0).toString());
                    	String pr_s = mkComma.format(pr);
                    	// 금액에 세 자리마다 콤마 찍기
                    	%>
                    	<%=pr_s%>원
                    </em>
                </div>
                <div class="subInfo">
                    <dl class="infoList togType2">
                        <!--  
                        <dt class>로스팅</dt>
                        <dd class>2023.10.18</dd>
                        -->
                        <dt class>배송안내</dt>
                        <dd>
                            <p class="fs">예약 배송 상품과 일반 상품을 같이 구매하는 경우 예약 발송일에 함께 발송됩니다.</p>
                        </dd>
                        <dd>
                            <p class="fs">상품별 출고예정일이 다를시 가장 늦은 상품 기준으로 모두 함께 배송됩니다.</p>
                        </dd>
                    </dl>
                    <div id="slt" style="display: none;">
                        <div class="sltft">
                        </div>
                        <div class="slt-but">
                            <button id="decrementCount">-</button>
                            <span class="count">0</span>
                            <button id="incrementCount">+</button>
                        </div>
                        <a href class="slt-btn">
                            X
                        </a>
                        <div class="slt-price">
                            <span>31,000</span>원
                        </div>
                    </div>
                    <div id="shop-mon">
                        <div class="shop-money">
                            총 상품금액 
                            <span><%=pr_s%></span> 원
                        </div>
                    </div>
                    <a href="결제/pay.jsp" class="shop-pay">
                        구매하기
                    </a>
                    <!-- a href class="shop-bask" id="shop-btn" onclick="fn_add_bask()" -->
                    <%
                    if(islogin == null) {
                   		%>
                   		<a href="../../가입/login.jsp" class="shop-bask" onclick="login()">
                        	장바구니
                    	</a>
                   		<%
                    } else {
                    	%>
                    	<a href="./장바구니/add_basket.jsp?item=<%=productName%>" class="shop-bask" onclick="return fn_add_bask()">
                        	장바구니
                    	</a>
                    	<%
                    }
                    %>
                </div>
            </div>
        </div>
        
        
        
        
    </div>
    <footer>
        <div class="bottom">
            <div class="btlogo">
                <img src="../../../images/ftlogo.png" alt="하단로고">
            </div>
            <div class="copy">
                <ul>
                    <li>상호 : Gallery Alice | 대표 : Cute | 주소 : 광명시 경기도 광명시 <br>
                        사업자등록번호 : 123-45-67890 | 전화번호 : 전화번호 : 02-1234-1234 | 이메일 : qwer1234@naver.com
                    </li>
                    <div class="sns">
                        <li><a href="https://www.facebook.com/people/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EC%95%A8%EB%A6%AC%EC%8A%A4/100069607637396/"
                                target="_blank">
                                <img src="../../../images/sns1.jpg" alt="sns1"></a></li>
                        <li><a href="https://cafegalleryalice.modoo.at/" target="_blank">
                                <img src="../../../images/sns2.png" alt="sns2"></a></li>
                        <li><a href="https://www.instagram.com/galleryalice_cafe/" target="_blank">
                                <img src="../../../images/sns3.jpg" alt="sns3"></a></li>
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