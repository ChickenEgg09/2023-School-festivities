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
   String joinName = request.getParameter("join_name");   
   String joinEmail = request.getParameter("join_email");
   String joinPwd = request.getParameter("join_pwd");
   
  /*out.print("이름 : " + joinName);   
   out.print("email : " + joinEmail);
   out.print("pwd : " + joinPwd);*/
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   
      String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
      String dbId = "scott";
      String dbPass = "tiger";
      
      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      String sql = "insert into members values ('"+joinName+"', '"+joinEmail+"', '"+joinPwd+"')";
      //out.print("sql: " + sql);
      
      //String sql = "insert into member values ('?', '?', '?')";
      pstmt = conn.prepareStatement(sql);
      //pstmt.setString(1, joinName);
      //pstmt.setString(2, joinPwd);
      //pstmt.setString(3, joinEmail);
      
      pstmt.executeUpdate(sql);
      
      pstmt.close();
      conn.close();
%>

<script>
<% 
out.print("alert('"+joinName+"님 환영합니다!');");
%>
location.href="login.jsp";
</script>

</body>
</html>