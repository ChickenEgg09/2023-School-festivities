<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<%
String na = request.getParameter("name");
String em = request.getParameter("email");
String sub = request.getParameter("subject");
String cont = request.getParameter("content");
String pw = request.getParameter("password");
int id = 1;
int pos = 0;
if (cont.length() == 1)
	cont = cont + " ";

while ((pos = cont.indexOf("\'", pos)) != -1) {
	String left = cont.substring(0, pos);
	String right = cont.substring(pos, cont.length());
	cont = left + "\'" + right;
	pos += 2;
}

java.util.Date yymmdd = new java.util.Date();
SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
// �ڹٿ����� HH �빮�ڰ� 24�ð� ����;
String ymd = myformat.format(yymmdd);

String sql = null;
Connection con = null;
Statement st = null;
ResultSet rs = null;
int cnt = 0;

try {

	Class.forName("oracle.jdbc.driver.OracleDriver"); //����Ŭ�� ����
	//Class.forName("org.gjt.mm.mysql.Driver"); // mysql 
} catch (ClassNotFoundException e) {
	out.println(e);
}

try {
	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "scott";
	String dbPass = "tiger";

	con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

	//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fboard?useUnicode=true&characterEncoding=euckr","root","multi");

	st = con.createStatement();
	sql = "select max(id) from  freeboard";
	rs = st.executeQuery(sql);
	if (!(rs.next()))
		id = 1;
	else {
		id = rs.getInt(1) + 1;
		rs.close();
	}
	sql = "insert into freeboard(id,name,password,email,subject,";
	sql = sql + "content,inputdate,masterid,readcount,replynum,step)";
	sql = sql + " values(" + id + ", '" + na + "','" + pw + "','" + em;
	sql = sql + "','" + sub + "','" + cont + "',TO_DATE('" + ymd + "', 'yy-MM-dd HH24:mi:ss')," + id + ",";
	// ��¥ ������ 24�ð� ������ HH24
	sql = sql + "0,0,0)";

	out.println(sql);
	cnt = st.executeUpdate(sql);
	// if (cnt >0) 
	//  out.println("�����Ͱ� ���������� �ԷµǾ����ϴ�.");
	//  else  
	//   out.println("�����Ͱ� �Էµ��� �ʾҽ��ϴ�. ");

	st.close();
	con.close();
} catch (SQLException e) {
	out.println(e);
}
%>
<jsp:forward page="freeboard_list.jsp" />