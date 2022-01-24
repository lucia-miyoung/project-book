<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags --%>" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Montserrat|Noto+Sans+KR|Open+Sans|Roboto&display=swap" rel="stylesheet">
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
    <script src="https://kit.fontawesome.com/3fb56dfe63.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../../resources/css/myAccount.css">
    <link rel="stylesheet" href="../../../resources/css/reset.css">
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <link rel="stylesheet" href="../../../resources/css/subHistory.css">
    <script src="../../../resources/js/common.js"></script>
</head>
<body>
<sec:authentication property="principal" var="member"/>

<header class="topbar">
        <nav>
          <div class="container">
            <a href="javascript: history.back();"><i class="far fa-arrow-left"></i></a>
            <h2>내 정보 관리</h2>
          </div>
        </nav>
      </header>
<div class="wrapper">
    <div class="title">
        <h2> <i class="fas fa-bell-on"></i>  <p> ${member.member.memberNickName } 님의 관리 페이지 입니다.</p></h2>
    </div>        
    <div class="summary">
        <div class="goSub">
            
            <button type="button" id="gogoSub" onclick="location.href='/goSubscribe'">
                <p>
                    정기구독 신청하기
                </p>
                <p>
                    독서 습관을 길러서 지식인이 되어보아요.
                </p>
                <p>
                    정기구독 신청하고 첫 달 무료 혜택받기!!
                </p>
                <div class="image">
                    <img src="../../resources/images/myLibrary/photoImg.png" >
                </div>
            </button>
           

        </div>

    </div>

    <div class="listChoice">
        <p> 정보 관리 </p>
        <ul>
            <li><a href="/updateMyInfo">회원정보수정 <i class="far fa-chevron-right"></i></a></li>
            <li><a href="/member/delete">회원탈퇴<i class="far fa-chevron-right"></i></a> </li>
        </ul>
    </div>

    <div class="listChoice">
        <p> 서비스 관리 </p>
        <ul>
            <li><a href="buyPaperBook.jsp">종이책 구매 관리<i class="far fa-chevron-right"></i></a></li>
            <li><a href="#" id="modalOpen">구독 내역<i class="far fa-chevron-right"></i></a></li>
        </ul>
    </div>

    <div class="listChoice">
        <p> 서비스 안내 </p>
        <ul>
            <li><a href="notice.jsp">공지사항<i class="far fa-chevron-right"></i></a></li>
            <li><a href="serviceCenter.jsp">고객센터<i class="far fa-chevron-right"></i></a></li>
        </ul>
    </div>
    <div class="lastColumn">
    	<form action="/member/logout" method="post">
    		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
    		<button type="submit">로그아웃</button>
    	</form>
        
    </div>
</div>

<!-- 모달창  -->
<div id ="modalGo" class="modal">
    
    <div class="modal_content">
    <p> <i class="fas fa-book"></i> 구독 내역 </p>
    <div class = "payList"> 
       
      <!-- foreach 시작 -->
        <div class="historyBox"> 
            <ul>
                <li> 연 정기구독 </li>
                <li> 99,000 원 (1 년) </li>
                <li> 구입날짜: 2020/02/08 </li>
            </ul>
            <p> <i class="fas fa-money-check-edit-alt"></i> 결제완료 </p>
        </div>
       <!-- foreach 끝 -->  
       
      <!-- otherwise (구매내역없을 경우 나오는 디자인) -->
       <!-- <div class="NoHistory">
                 <div class="noImg">
                     <i class="fas fa-coins"></i>
                 </div>
                 <p> 구매내역이 없습니다. </p>
            </div> -->
  
    </div>
    <!-- payList end -->
    <span id="modalCloseBtn">
        <button type="button" id="peopleChkBtn"> 확인 </button>
    </span>
    </div>
  </div>
  <script>
  
    var modal = document.getElementById('modalGo');
    var openBtn = document.getElementById('modalOpen');
    var closeBtn = document.getElementById('modalCloseBtn');

    openBtn.onclick = function() {
       modal.style.display = "block";
    }
    closeBtn.onclick = function() {
        modal.style.display ="none";
    }
   window.onclick = function(event){
       if(event.target==modal) {
           modal.style.display = "none";
       }
   }
   </script>
<script>
    $(document).ready(() => {
      const li = document.querySelector('footer.fixed a[href="/myaccount"]').parentElement;
      const ul = li.parentElement;
      [ul, li].forEach(element => element.classList.add('active'));
    });
  </script>


</body>
</html>