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
	//�α׾ƿ��� �� ������������ ���ư�.
%>
</body>
</html>