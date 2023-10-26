<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
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
            location.href = "./login.jsp"; // 수정이 필요한 페이지로 리다이렉트
        </script>
    <%
    } else {
        String[] checkArr = joinEmail.split("@");
        String[] emailList = {"naver.com", "gamil.com", "nate.com", "dreamwiz.com", "empal.com", "hanmail.net", "yahoo.com","outlook.com","hotmail.com"};
        boolean isHaveGol = (checkArr.length == 2); // "@" 기호가 정확히 1개인지 확인

        if (!isHaveGol) {
    %>
            <script type="text/javascript">
                alert('이메일을 다시 확인해주세요.');
                location.href = "./login.jsp";
            </script>
    <%
        } else {
            String domain = checkArr[1]; // "@" 뒷 부분을 도메인으로 저장
            boolean emailFound = false;

            for (String allowedDomain : emailList) {
                if (allowedDomain.equals(domain)) {
                    emailFound = true;
                    break;
                }
            }

            if (!emailFound) {
    %>
                <script>
                    alert('이메일을 다시 확인해주세요.');
                    location.href = "./login.jsp";
                </script>
    <%
            } else {
                // 데이터베이스 연결 및 회원가입 처리
                Connection conn = null;
                PreparedStatement pstmt = null;

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
                            alert('<%= joinEmail %>님 회원가입이 되셨습니다.');
                            location.href = "./login.jsp"; // 원하는 페이지로 리다이렉트
                        </script>
    <%
                    } else {
    %>
                        <script type="text/javascript" charset="utf-8">
                            alert('데이터를 삽입하지 못했습니다. 다시 시도해 주세요.');
                            location.href = "./login.jsp"; // 수정이 필요한 페이지로 리다이렉트
                        </script>
    <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    // 필요에 따라 예외 처리 로직 추가
                }
            }
        }
    }
    %>
</body>
</html>
