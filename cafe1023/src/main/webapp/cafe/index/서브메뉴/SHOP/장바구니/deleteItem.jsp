<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.text.DecimalFormat" %>
<%
String numToDelete = request.getParameter("num");
String loginid = (String) session.getAttribute("loginid");

if (numToDelete != null) {
    Connection con = null;
    Statement st = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e) {
        out.println(e);
    }

    try {
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbId = "scott";
        String dbPass = "tiger";

        con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

        // 삭제 쿼리 실행
        String deleteQuery = "DELETE FROM basket WHERE email = ? AND num = ?";
        PreparedStatement pstmt = con.prepareStatement(deleteQuery);
        pstmt.setString(1, loginid);
        pstmt.setString(2, numToDelete);
        pstmt.executeUpdate();

        pstmt.close();
        con.close();

        // 삭제가 성공했을 때 사용자를 장바구니 페이지로 리디렉션
        response.sendRedirect("basket.jsp");
    } catch (SQLException e) {
        out.println(e);
    }
}
%>