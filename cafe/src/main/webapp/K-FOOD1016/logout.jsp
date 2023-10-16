<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
	  session.setAttribute("islogin", null);
	  session.setAttribute("loginid", null);
	  //로그인 정보를 null로 초기화
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	out.println("<script> location.href='./index.jsp';</script>");
	//로그아웃 뒤에 메인페이지로 돌아감.
%>
</body>
</html>