<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*,java.util.*,java.text.DecimalFormat" %> 
    
<%
	
	String islogin = (String)session.getAttribute("islogin");	
	String loginid = (String)session.getAttribute("loginid");
	String productName = request.getParameter("item");
	
	
	//로그인 되어 있지 않으면 로그인 하도록 페이지를 이동 시킨다. , 
	//로그인 된 경우에, 아이디(이메일), 상품 번호를 basket 테이블에 넣는다.
	//그리고 나서 아이디를 조건으로 basket 테이블의 레코드를 모두 select 읽어온다. 

if(islogin == null){
	out.println("<a href='../가입/login.jsp'>로그인/회원가입</a>");
}else{
	//로그인 된 경우, 	
	  String em=null;
	  Connection con= null;
	  Statement st =null;
	  ResultSet rs =null;
	  String sql;
	  int cnt = 0;
	
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
		  
	
		  
		  //이미 추가하려는 아이디/상품 번호로 담긴 장바구니 내역이 있는지 확인한다.
		st = con.createStatement();
		sql = "select * from  basket where email='"+loginid+"' and num ="+productName;
		rs = st.executeQuery(sql);
		if (!(rs.next())){
			//장바구니에 해당 아이템이 없으므로, 장바구니에 추가한다.
			sql = "insert into basket(email,num,counter)";
			sql = sql + " values('" + loginid + "', "+ productName + ", 1)";
			//out.println(sql);
			cnt = st.executeUpdate(sql);
		
		}else {
			//장바구니에 동일 아이템이 있으면, 구매 수량만 하나 증가한다.
			sql = "update basket set counter = counter + 1 where email='"+loginid+"' and num =" +productName;
			//out.println(sql);
			cnt = st.executeUpdate(sql);
			rs.close();
		}
		
		
	
			st.close();
			con.close();
			
	
	
	} catch (SQLException e) {
	   out.println(e);
	}


}

	response.sendRedirect("./basket.jsp");

%>
