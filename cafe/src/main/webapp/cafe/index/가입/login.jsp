<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="membership.css">
    <script src ="membership.js" ></script>
</head>
<body>
   <main class="main">
      <section class="home">
        <h1>Welcome to the <span>Gallery Alice</span></h1>
        <button id="sign-up" class="btn">회원가입</button>
        <button id="sign-in" class="btn">로그인</button>
        <p><a class="link-copy" href="../home.jsp">홈페이지</a></p>
      </section>
      <section class="sign-up">
         <article class="signup-left">
            <h1>Gallery Alice</h1>
            <div class="wc_message">
               <h3>Let's Kick Now!</h3>
               <p>쉽고 30초도 채 걸리지 않아</p>
             </div>
             <div class="btn-back">
               <i class="fas fa-2x fa-angle-left angle-left-color"></i>
               뒤로가기
            </div>
         </article>
         <article class="form-area">
            <div class="organize-form form-area-signup">
              <h2>회원가입</h2>
              <form class="form" name="join" method="post" action="./login_button.jsp">
                <div class="form-field">
                  <label for="name">이름:</label>
                  <input type="text" id="name" name="join_name"/>
                </div>
      
                <div class="form-field">
                  <label for="email">이메일:</label>
                  <input type="text" id="email" name="join_email" />
                </div>
      
                <div class="form-field">
                  <label for="password">비밀번호:</label>
                  <input type="text" id="password" name="join_pwd"/>
                </div>
      
                <button class="btn-sign btn-up" type="submit">회원가입</button>
              </form>
              <p>계정을 가지고 있나요? <a href="#" class="link-in">로그인</a></p>
      
            </div>
            <div class="organize-form form-area-signin">
               <h2>로그인</h2>
               <form class="form" name="login" method="post" action="./login_check.jsp">
                  <div class="form-field">
                    <label for="email-in">이메일:</label>
                    <input type="text" name="email_in" id="email-in" />
                  </div>
                  <div class="form-field">
                    <label for="password-in">비밀번호:</label>
                    <input type="text" name="password_in" id="password-in" />
                  </div>
                  <button class="btn-sign btn-in" type="submit">로그인</button>
               </form>
               <p>계정이 없나요? <a href="#" class="link-up">회원가입</a></p>
            </div>
         </article>
     
         <article class="signup-right">
           <i class="fas fa-2x fa-bars bars-style"></i>
           <p><a class="link-copy" href="../home.jsp">홈페이지</a></p>
         </article>
      </section>
    </main>
</body>
</html>