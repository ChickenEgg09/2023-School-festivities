<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
   String loginId = request.getParameter("email_in");
   String loginPwd = request.getParameter("pwd_in");   
   
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

      } //�α����� �����ϸ� isLogin�� true�� �����Ͽ� ���� ������ �� �̿���.
      
      
      stmt.close();
      conn.close();

      if(isLogin == true){
          // out.print("�α��� ����");
    	  out.print("<script> alert('"+loginId+"�� ȯ���մϴ�!'); location.href='./index.jsp';</script>");
    	  session.setAttribute("islogin", "ok");
    	  session.setAttribute("loginid", loginId);
          
      }else{   
		// out.print("�α��� ����");   
      	  out.print("<script> alert('���̵�/�н����带 Ȯ���� �ּ���');location.href='./login.jsp';</script>");
  	   	  
      }
        
   
%>


</body>
</html>