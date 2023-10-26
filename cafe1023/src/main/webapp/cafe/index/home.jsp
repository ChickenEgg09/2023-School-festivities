<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>𝓖𝓪𝓵𝓵𝓮𝓻𝔂 𝓐𝓵𝓲𝓬𝓮</title>
    <link rel="stylesheet" type="text/css" href="../css/home.css">
    <link rel="stylesheet" type="text/css" href="../css/fullpage.css">
    <link rel="stylesheet" type="text/css" href="../css/hover.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/home.js"></script>
    <script type="text/javascript" src="../js/fullpage.js"></script>
</head>
<body>
    <%@ include file="Header.jsp" %>
    <div id="fullpage">
        <div class="section active" id="section0">
            <nav class="menu"></nav>
            <div class="imgslide">
                <div class="slidelist">
                    <img src="../images/slide2.jpg" alt="슬라이드1">
                    <img src="../images/slide3.jpg" alt="슬라이드2">
                    <img src="../images/slide1.jpg" alt="슬라이드3">
                </div>
            </div>
        </div>
        <div class="section" id="section1">
            <div class="contents">
                <div class="con-title">
                    <h1 class="line-under text-left">
                        Gallery Alice<br>
                        공지사항
                    </h1>
                </div>
                <div class="con-row">
                    <ul class="row">
                        <li class="row-wr">
                            <ul>
                                <li><a href="게시판/60th.jsp">60th 원더랜드콘서트</a> <span>2023.04.13</span></li>
                            </ul>
                        </li>
                        <li class="row-wr">
                            <ul>
                                <li><a href="게시판/59th.jsp">59th 원더랜드콘서트</a> <span>2023.03.01</span></li>
                            </ul>
                        </li>
                        <li class="row-wr">
                            <ul>
                                <li><a href="게시판/58th.jsp">58th 원더랜드콘서트</a> <span>2023.02.11</span></li>
                            </ul>
                        </li>
                        <li class="row-wr">
                            <ul>
                                <li><a href="게시판/57th.jsp">57th 원더랜드콘서트</a> <span>2023.01.10</span></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="section" id="section2">
            <%@ include file="Footer.jsp" %>
        </div>
    </div>
</body>
</html>