<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
	  session.setAttribute("islogin", null);
	  session.setAttribute("loginid", null);	  
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	out.println("<script> location.href='../home.jsp';</script>");
	//로그아웃일 때 메인페이지로 돌아감.
%>
</body>
</html>