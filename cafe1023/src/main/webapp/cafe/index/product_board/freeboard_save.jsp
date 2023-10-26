<%@ page contentType="text/html; charset=euc-kr" %>  
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.FileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*" %>




<% request.setCharacterEncoding("utf-8"); %>
<%
	int id =1; // db p_key
	int cnt = 0;
	
	String sql=null;
	Connection con=null;
	Statement st=null; 
 	ResultSet rs=null;  

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver"); //����Ŭ�� ����
	} catch (ClassNotFoundException e ) {
 		out.println(e);
	}

	try {
		 String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		 String dbId = "scott";
		 String dbPass = "tiger";	
		  
		 con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		  
		st = con.createStatement();
  		sql = "select max(num) from product";
  		rs = st.executeQuery(sql);
 

  
 		if (!(rs.next())) 
   			id=1;
  		else {
  			 id= rs.getInt(1) + 1 ;
 		 	 rs.close();
		}   
   	
 //�̹��� ���� ó�� ����
		String saveDirectory = application.getRealPath("/cafe/index/product_board/p_img");
		String saveDirectory2 ="C:/Users/user/Documents/GitHub/School/cafe1023/src/main/webapp/cafe/index/product_board/p_img";
 		int maxPostSize = 10 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();			
		String fileName = "p_img";
	
		out.println(saveDirectory);
	
		MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);			
	
	
	
		File file = multipartRequest.getFile(fileName);
	
		fileName = file.getName();
	
		long fileSize = file.length();
		
		if(fileName == null){
			out.println("���� ���ε� ����");
		}else{

		}
		
		
		// �̹����� ��Ȯ�� ������ �ȵǴ� �� ���Ƽ� �� �� �� ������. (//�߰� �ڵ�)
		
		  // �۾� �������� ���ε� �� ���� �����ϱ� ����

		File newFile = new File (saveDirectory2+"/"+fileName);
        
        BufferedInputStream input = null;
        BufferedOutputStream output = null;
        
        try {
            input = new BufferedInputStream(new FileInputStream(file));
            output = new BufferedOutputStream(new FileOutputStream(newFile));
            
            byte[] readBuffer = new byte[1024];
            while(input.read(readBuffer, 0, readBuffer.length) != -1){
                output.write(readBuffer);
            }
        } catch (Exception e) {
            
        } finally {
            input.close();
            output.close();
        }
 
        // �۾� �������� ���ε� �� ���� �����ϱ� ��
        //�߰� ���� ���� ��
        
	
		String na = multipartRequest.getParameter("p_name");

		String price = multipartRequest.getParameter("p_price"); 
	 	String cont = multipartRequest.getParameter("p_content");
// �̹��� ���ε�� �� ��� �޾ƿ��� ��
  
  
  sql= "insert into product(num,name,img,content,price)"; 
  sql= sql + " values(" +id + ", '" +  na + "','" + fileName + "','"+ cont + "'," + price + ")" ;

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
  out.println(sql);
 }
 
 
%>
