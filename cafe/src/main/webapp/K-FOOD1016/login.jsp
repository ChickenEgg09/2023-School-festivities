<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/login.css" rel="stylesheet">
    <script src="scripts/login.js" defer type="text/javascript"></script>
    <script src="scripts/jquery-1.12.3.js"></script>
    <title>K-FOOD login</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-
    oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
</head>
<body>
        <div class="top">
            <div class="banner">
                <div class="logo">
                    <a href="./index.jsp"><img src="images/logo2.png"></a>
                </div>
            </div>
        </div>
        <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form name="join" method="post" action="./login_button.jsp">
            	<span>이메일을 사용하여 생성하세요</span>
            	<input type="text" name="join_name" placeholder="이름" />
            	<input type="email" name="join_email" placeholder="이메일" />
            	<input type="password" name="join_pwd" placeholder="비밀번호" />
            	<button type="submit">회원가입</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            
            <form name="login" method="post" action="./login_check.jsp">
            	<h1>로그인 하기</h1>
               	<input name="email_in" type="email" placeholder="이메일" />
            	<input name="pwd_in" type="password" placeholder="비밀번호" />
            	<a href="#">비밀번호를 잊으셨나요?</a>
            	<button type="submit">로그인하기</button>
            </form>
            
        </div>
        <div class="overlay-container">
            <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>계정이 이미 있으신가요?</h1>
                <p>로그인 후 더 다양한 콘텐츠를 즐겨보세요</p>
                <button class="ghost" id="signIn">로그인 하기</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>만나서 반갑습니다!</h1>
                <p>간단한 절차를 거쳐 계정을 만들어 보세요</p>
                <button class="ghost" id="signUp">가입하기</button>
            </div>
            </div>
        </div>
        </div>

</body>
</html>