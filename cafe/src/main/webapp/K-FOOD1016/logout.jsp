<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
	  session.setAttribute("islogin", null);
	  session.setAttribute("loginid", null);
	  //�α��� ������ null�� �ʱ�ȭ
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
	//�α׾ƿ� �ڿ� ������������ ���ư�.
%>
</body>
</html>