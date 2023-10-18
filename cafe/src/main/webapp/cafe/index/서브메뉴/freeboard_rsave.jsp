<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
String na = request.getParameter("name");
String em = request.getParameter("email");
String sub = request.getParameter("subject");
String cont = request.getParameter("content"); // "CONTENT" 변수 설정
if (cont == null) {
	cont = ""; // "CONTENT" 변수가 NULL인 경우 빈 문자열로 설정
}
String pw = request.getParameter("password");
String midParam = request.getParameter("mid");
String stepParam = request.getParameter("step");
int mid = 0;
int rnum = 0;
int step = 0;
if (midParam != null) {
	mid = Integer.parseInt(midParam);
}

String rnumParam = request.getParameter("rnum");
if (rnumParam != null) {
	rnum = Integer.parseInt(rnumParam);
}
if (stepParam != null) {
	step = Integer.parseInt(stepParam) + 1;
}

int id = 0;
int pos = 0;
if (cont != null && cont.length() == 1) {
	cont = cont + " ";
} else if (cont == null) {
	cont = ""; // "CONTENT" 변수가 NULL인 경우 빈 문자열로 설정
}

while ((pos = cont.indexOf("'", pos)) != -1) {
	String left = cont.substring(0, pos);
	String right = cont.substring(pos, cont.length());
	cont = left + "'" + right;
	pos += 2;
}

java.util.Date yymmdd = new java.util.Date();
SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
String ymd = myformat.format(yymmdd);

String sql = null;
Connection con = null;
Statement st = null;
ResultSet rs = null;
int cnt = 0;

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

	st = con.createStatement();
	sql = "select max(id) from freeboard";
	rs = st.executeQuery(sql);
	if (!(rs.next())) {
		id = 1;
	} else {
		id = rs.getInt(1) + 1;
		rs.close();
	}
	if (step == 1) {
		sql = "select max(replynum) from freeboard where masterid=" + mid;
		rs = st.executeQuery(sql);
		if (!(rs.next())) {
	rnum = 1;
		} else {
	rnum = rs.getInt(1) + 1;
		}
	}
	sql = "insert into freeboard(id,name,password,email,subject,";
	sql = sql + "content,inputdate,masterid,readcount,replynum,step)";
	sql = sql + " values(" + id + ", '" + na + "','" + pw + "','" + em;
	sql = sql + "','" + sub + "','" + cont + "',TO_DATE('" + ymd + "', 'yy-MM-dd HH24:mi:ss')," + mid + ",";
	sql = sql + "0," + rnum + "," + step + ")";

	cnt = st.executeUpdate(sql);
	st.close();
	con.close();

	// redirectCount 파라미터 처리
	int redirectCount = 0; // 기본값 설정

	String redirectCountParam = request.getParameter("redirectCount");
	if (redirectCountParam != null) {
		try {
	redirectCount = Integer.parseInt(redirectCountParam);
		} catch (NumberFormatException e) {
	// 파싱 중 예외 발생 시, 기본값인 0을 유지
		}
	}

	if (redirectCount < 3) {
		response.sendRedirect("게시판.jsp?go=" + request.getParameter("page") + "&redirectCount=" + (redirectCount + 1));
	} else {
		out.println("리디렉션 횟수가 너무 많습니다.");
	}
} catch (SQLException e) {
	out.println(e);
} finally {
%>
<script type="text/javascript" charset="utf-8">
	alert('답변되었습니다.');
	location.href = "게시판.jsp"; // Replace with the correct page
</script>
<%
}
%>