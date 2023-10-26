<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
    <title>데이터 삭제</title>
</head>
<body>
    <%
        String email = request.getParameter("email"); // 파라미터로 전달된 ID 값을 얻어옵니다.
        
        // 데이터베이스 연결 정보
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	    String dbId = "scott";
	    String dbPass = "tiger";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // 데이터베이스 연결
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

            // 삭제 쿼리 작성
            String sql = "DELETE FROM BASKET WHERE EMAIL = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.executeUpdate();

            if (pstmt.executeUpdate() > 0) {
    %>
                <p>데이터가 성공적으로 삭제되었습니다.</p>
    <%
            } else {
    %>
                <p>데이터가 성공적으로 삭제되었습니다.</p>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
            <p>오류가 발생했습니다: <%= e.getMessage() %></p>
    <%
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("./basket.jsp");
    %>
</body>
</html>
