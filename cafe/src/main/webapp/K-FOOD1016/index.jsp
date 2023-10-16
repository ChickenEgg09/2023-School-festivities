<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*" %> 
<%@ page import="java.time.LocalDateTime" %> 
<%@ page import="java.time.LocalDate" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/style.css" rel="stylesheet">
    <script src="scripts/javascript.js" defer type="text/javascript"></script>
    <script src="scripts/jquery-1.12.3.js"></script>
    <link href="images/약과2.png" rel="shortcut icon" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>K-fOOD</title>

</head>
<body>
    
    <%@include file="./header.jsp"%>
    
   
    
    <div class="bodywrap">
        <div class="imgslide">
            <div class="slidelist">
                <a href="#"><span>세계로 뻗어나가는 한식</span><img src="images/bannner.jpg" alt="슬라이드1"></a>
                <a href="#"><span>남녀노소가 즐기는 간편식 라면</span><img src="images/bannner2.jpg" alt="슬라이드2"></a>
                <a href="#"><span>오랜 전통으로 이어진 김치</span><img src="images/bannner3.jpg" alt="슬라이드3"></a>
            </div>
        </div>

        <!-- <div class="line">
        <img src="images/line2.png">
        </div> -->

      
        <div class="contents">
            <div class="notice">
            	<!-- 홈화면에서 공지사항 클릭하면 리스트로 넘어감 -->
                <ul><h3><a href="freeboard/freeboard_list.jsp">공지사항</a></h3>
<%   
	

    //홈화면에 공지사항 4줄 보이게 해주는 메뉴
	Connection con= null;	//DB접속 핸들러
	Statement st =null;		//sql실행문 관리
	ResultSet rs =null;		//select쿼리로 받아온 결과의 집합(레코드셋)
	int z=0;				//홈화면에 출력학 공지사항 라인수를 세기위한 카운터 - 4개 출력되게
	
	String[] title = new String[4];
	String[] context = new String[4];
	
	//db 접속하기
  try {	  
	  	Class.forName("oracle.jdbc.driver.OracleDriver");
  } catch (ClassNotFoundException e ) {  //서버 오류 났을 때, 에러메세지 안 나오게.
   		out.println(e);
  }
  
  //jdbc 접속 정보 / 서버는 localhost (ip대신) / 1521포트 번호 / xe 오라클 express버전일 때
  try{
      String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
      String dbId = "scott";
      String dbPass = "tiger";	
	  
	  con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);	  
	  //DB연결 획득
  } catch (SQLException e) {
   out.println(e);
  }
  
  try {
	  st = con.createStatement();
	  String sql = "select * from freeboard order by" ; //DB쿼리
	  sql = sql + " masterid desc, replynum, step, id" ; 
	  rs = st.executeQuery(sql);
	  //masterid desc 글번호 내림차순 마지막에 쓴 글이 처음으로, 
	  //replynum 댓글 깊이, step 몇번째 댓글인가에 따라 들여쓰기를 위해, id 글의 고유아이디
	  
	  if (!(rs.next()))  {
		//게시판에 글이 없네.   
	  } else {	  
	 	 do {		
	 				 		
	 		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy.MM.dd");
	 		Date writtenDate = dateFormat.parse(rs.getString("inputdate"));
	 		String inputDate = dateFormat1.format(writtenDate); // yyyy.MM.dd 형식에 맞게 출력하기 위해.
	 		//DB에 입력된 날짜형식에 맞게 읽어오기 위해 dateFormat 변수로 읽어옴 - parse()
	 		//dateFormat1은 날짜 출력 디자인을 맞추기 위해 yyyy.MM.dd으로 설정하였음
	 			
	 		
			out.println("<li><a href='#''>&nbsp "+rs.getString("subject")+"<span>"+ inputDate +"</span></a></li>");
			title[z]=rs.getString("subject");
			context[z]=rs.getString("content");
			z++;
			//홈화면에 공지사항 4줄 보이게 해주는 메뉴 - 배열 title(제목), context(내용) 설정
			//제목과 날짜를 가져와서 출력함
			
			
		 }while(rs.next() && z < 4);
	 	 //rs.next()  - 다음 레코드를 보게하기 위한 코드, 이대로 실행하면 전체 레코드를 다 가져옴.
	 	 //z < 4 - 결과가 4개보다 많은 경우 상위 4개만 사용하려고 z<4 조건 AND로 추가함
	     rs.close();
	 	 //받아온 레코드셋을 종료함
	 }
	
	  //디자인에 따라 공지글이 네 개가 안되면 나머지는 공백으로 채움
	  //z를 초기화하지 않은 이유는 이미 숫자를 카운트하고 있었음.
	  for( ;z<4;z++){
			   out.println("<li><a href='#'>&nbsp <span>&nbsp </span></a></li>");
		  	 }
	  
	  	st.close();		//sql 쿼리문 관리하는 객체 종료
	  	con.close();	//DB접속 종료
	} catch (java.sql.SQLException e) {
	  out.println(e);
	}  
%>					<!-- HTML에서 사용한 부분 주석 처리함 : 공지사항 4줄 디자인을 가져옴 -->
                    <!--li><a href="#">&nbsp K-FOOD 공지사항1<span>2023.04.24</span></a></li>
                    <li><a href="#">&nbsp K-FOOD 공지사항2<span>2023.04.24</span></a></li>
                    <li><a href="#">&nbsp K-FOOD 공지사항3<span>2023.04.24</span></a></li>
                    <li><a href="#">&nbsp K-FOOD 공지사항4<span>2023.04.24</span></a></li-->

                </ul>
            </div>

            <div class="gallery">
                <ul><h3>관련 사이트</h3>
                    <div class="imgboxdiv">
                        <li class="imgdiv"><a href="http://kfcf.co.kr" target="_blank"><img src="images/gallery11.jpg" alt="갤러리1">
                        </a></li><div class="imgcoment">한국음식문화재단</div>
                    </div>
                    <div class="imgboxdiv">
                        <li class="imgdiv"><a href="http://www.kfr.or.kr/" target="_blank"><img src="images/gallery22.jpg" alt="갤러리2">
                        </a></li><div class="imgcoment2">한국전통음식연구소</div>
                    </div>
                    <div class="imgboxdiv">
                        <li class="imgdiv"><a href="https://mukbangmap.com/map/korea" target="_blank"><img src="images/gallery33.jpg" alt="갤러리3">
                        </a></li><div class="imgcoment3">한국맛집지도</div>
                    </div> 
                </ul>
            </div>
            
            <div class="youtube"><h3>영상</h3>
                <iframe width="400" height="200" src="https://www.youtube.com/embed/rvgLxpsM8rU?autoplay=1&mute=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen>
                </iframe>
            </div> 
        </div>

        <div class="snscopy">
            <div class="sns">
                <ul><h3>SNS</h3>
                    <li><a href="#"><img src="images/sns1.jpg" alt="sns1"></a></li>
                    <li><a href="#"><img src="images/sns2.jpg" alt="sns2"></a></li>
                    <li><a href="#"><img src="images/sns3.jpg" alt="sns3"></a></li>
                </ul>
            </div> 
            <div class="copy">
                COPYRIGHTⓒ by K-FOOD. ALL RIGHTS RESERVED
            </div>
        </div>

        <div class="btlogo">
            <a href="#"><img src="images/btlogo1.png"></a>
        </div>

    </div> 

    <div class="modal">
        <div class="modalup">
            <div class="uptitle">
                <%=title[0] %> <!--K-FOOD 공지사항- String에 저장해 둔 내용을 뿌리기-->
            </div>
            <div class="upbody">
            	<%=context[0] %>
            	<!-- DB에서 읽어온 값이 줄바꿈 해야할 때, <br> 태그를 삽입해야 함. -->
                <!--p>안녕하세요 K-FOOD 입니다.</p>
                <p>저희 사이트는 한국의 전통음식과 퓨전음식에 대해 소개하고
                유저들이 자유롭게 레시피를 공유할 수 있도록
                직접 공유, 배포 가능하게 만들었습니다. 불편한 점이나 문의사항이 있으시면
                하단 sns 아이콘을 클릭하여 의견 남겨주시기 바랍니다.</p><br>
                <p>감사합니다.</p-->
            </div>
            <div class="btn">
                닫기
            </div>
        </div>
    </div>

    
</body>
</html>

    
    