<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
<HEAD><TITLE>占쏙옙 占쏙옙占쏙옙占싹깍옙</TITLE></HEAD>
<BODY>
[<A href="게시판.jsp?go=<%=request.getParameter("page")%>">게시판 목록으로</A>]

<%
 String sql=null;
 Connection con= null;
 PreparedStatement st =null;
 ResultSet rs =null;
 int cnt=0;
 int pos=0;
 String cont=request.getParameter("content");

 if (cont.length()==1) 
  cont = cont+" " ;
  while ((pos=cont.indexOf("\'", pos)) != -1) {
   String left=cont.substring(0, pos);
   String right=cont.substring(pos, cont.length());
   cont = left + "\'" + right;
   pos += 2;
  }  

  int id = Integer.parseInt(request.getParameter("id"));


  try {
 	  
 	  Class.forName("oracle.jdbc.driver.OracleDriver"); //占쏙옙占쏙옙클占쏙옙 占쏙옙占쏙옙
 	//Class.forName("org.gjt.mm.mysql.Driver"); // mysql 
 } catch (ClassNotFoundException e ) {
 out.println(e);
 }

 try{
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbId = "scott";
    String dbPass = "tiger";	
 	  
 	  con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
 	  
 	  // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fboard?useUnicode=true&characterEncoding=euckr","root","multi");
 } catch (SQLException e) {
 out.println(e);
 }




 
 
 
  try {
   sql = "select * from freeboard where id=? ";
   st = con.prepareStatement(sql);
   st.setInt(1, id);
   rs = st.executeQuery();
   if (!(rs.next()))  {
    out.println("해당 내용이 없습니다");
   } else {
   String pwd= rs.getString("password"); 
   if (pwd.equals(request.getParameter("password"))) {
    sql = "update freeboard set name= ? ,email=?,";
    sql = sql + "subject=?,content=? where id=? " ;
    st = con.prepareStatement(sql);
    st.setString(1, request.getParameter("name"));
    st.setString(2, request.getParameter("email"));
    st.setString(3, request.getParameter("subject"));
    st.setString(4, cont);
    st.setInt(5, id);
    cnt = st.executeUpdate(); 
    if (cnt >0) 
     out.println("정상적으로 수정되었습니다.");
    else
     out.println("수정되지 않았습니다.");
   } else 
    out.println("비밀번호가 틀립니다.");
  } 
  rs.close();
  st.close();
  con.close();
 } catch (SQLException e) {
  out.println(e);
 } 
%>
</BODY>
</HTML> 