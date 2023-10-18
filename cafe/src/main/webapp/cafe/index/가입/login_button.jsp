<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
</head>
<body>
    <%
    String joinName = request.getParameter("join_name");
    String joinEmail = request.getParameter("join_email");
    String joinPwd = request.getParameter("join_pwd");

    if (joinName == null || joinEmail == null || joinPwd == null || joinName.trim().isEmpty() || joinEmail.trim().isEmpty() || joinPwd.trim().isEmpty()) {
        %>
        <script type="text/javascript" charset="utf-8">
            alert('필수 입력란을 모두 작성해 주세요.');
            location.href = "./login.jsp"; // Replace with the correct page
        </script>
        <%
    } else {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbId = "scott";
        String dbPass = "tiger";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

            String sql = "insert into members values (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, joinName);
            pstmt.setString(2, joinEmail);
            pstmt.setString(3, joinPwd);

            int rowsAffected = pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            if (rowsAffected > 0) {
                %>
                <script type="text/javascript" charset="utf-8">
                    alert('<%= joinName %>님 환영합니다!');
                    location.href = "./login.jsp"; // Redirect to the desired page
                </script>
                <%
            } else {
                %>
                <script type="text/javascript" charset="utf-8">
                    alert('데이터를 삽입하지 못했습니다. 다시 시도해 주세요.');
                    location.href = "./login.jsp"; // Replace with the correct page
                </script>
                <%
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception as needed, e.g., display an error message or log it.
        }
    }
    %>
</body>
</html>
