<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String loginId = request.getParameter("email_in");
   String loginPwd = request.getParameter("password_in");   
   
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   boolean isLogin = false;
   
      String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
      String dbId = "scott";
      String dbPass = "tiger";
      
      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      String sql = "select pwd from members where email = '"+loginId +"'";
      //out.print("sql: " + sql);
      
      //String sql = "insert into member values ('?', '?', '?')";
      stmt = conn.createStatement();
      //pstmt.setString(1, joinName);
      //pstmt.setString(2, joinPwd);
      //pstmt.setString(3, joinEmail);
      
      rs = stmt.executeQuery(sql);
      
      while (rs.next()) {

         if( loginPwd.compareTo(rs.getString("pwd")) == 0 )
            isLogin = true;

      }
      

      
      
      stmt.close();
      conn.close();

      if(isLogin == true){
          // out.print("로그인 성공");
    	  out.print("<script> alert('"+loginId+"님 환영합니다!'); location.href='../home.jsp';</script>");
    	  session.setAttribute("islogin", "ok");
    	  session.setAttribute("loginid", loginId);
          
      }else{   
		// out.print("로그인 실패");   
      	  out.print("<script> alert('아이디/패스워드를 확인해 주세요');location.href='./login.jsp';</script>");
  	   	  
      }
        
   
%>


</body>
</html>