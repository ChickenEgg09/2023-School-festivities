document.addEventListener("DOMContentLoaded", function () {
    const tabHello = document.getElementById("tabHello");
    const tabDirections = document.getElementById("tabDirections");
    const helloContent = document.querySelector(".tab-content.Hello");
    const directionsContent = document.querySelector(".tab-content.Directions");
    const tabBoard = document.getElementById("tabBoard");
    const tabNotice = document.getElementById("tabNotice");
    const tabQnA = document.getElementById("tabQnA");
    const tabBoardLink = document.getElementById("tabBoardLink"); // 게시판 링크
    const tabQnALink = document.getElementById("tabQnALink"); // Q&A 링크
    const boardContent = document.getElementById("boardContent");
    const noticeContent = document.getElementById("noticeContent");
    const qnaContent = document.getElementById("qnaContent");

    tabHello.addEventListener("click", function () {
        tabHello.classList.add("active");
        tabDirections.classList.remove("active");
        helloContent.classList.add("active");
        directionsContent.classList.remove("active");
    });

    tabDirections.addEventListener("click", function () {
        tabHello.classList.remove("active");
        tabDirections.classList.add("active");
        helloContent.classList.remove("active");
        directionsContent.classList.add("active");
    });

    tabBoard.addEventListener("click", function () {
        tabBoard.classList.add("active");
        tabNotice.classList.remove("active");
        tabQnA.classList.remove("active");
    
        boardContent.classList.add("active");
        noticeContent.classList.remove("active");
        qnaContent.classList.remove("active");
    });
    
    tabNotice.addEventListener("click", function () {
        tabBoard.classList.remove("active");
        tabNotice.classList.add("active");
        tabQnA.classList.remove("active");
    
        boardContent.classList.remove("active");
        noticeContent.classList.add("active");
        qnaContent.classList.remove("active");
    });
    
    tabQnA.addEventListener("click", function () {
        tabBoard.classList.remove("active");
        tabNotice.classList.remove("active");
        tabQnA.classList.add("active");
    
        boardContent.classList.remove("active");
        noticeContent.classList.remove("active");
        qnaContent.classList.add("active");
    });
    
    // 초기 상태에서 게시판 화면을 보이도록 설정
    tabBoard.classList.add("active");
    boardContent.classList.add("active");
    
    // 각 링크 클릭 시 해당 섹션을 활성화
    tabBoardLink.addEventListener("click", function (e) {
        e.preventDefault();
        tabBoard.classList.add("active");
        tabNotice.classList.remove("active");
        tabQnA.classList.remove("active");
    
        boardContent.classList.add("active");
        noticeContent.classList.remove("active");
        qnaContent.classList.remove("active");
    });

    tabQnALink.addEventListener("click", function (e) {
        e.preventDefault();
        tabBoard.classList.remove("active");
        tabNotice.classList.remove("active");
        tabQnA.classList.add("active");
    
        boardContent.classList.remove("active");
        noticeContent.classList.remove("active");
        qnaContent.classList.add("active");
    });
});
