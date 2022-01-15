<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>내 서재</title>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Nanum+Gothic|Kaushan+Script|Montserrat|Noto+Sans+KR|Open+Sans|Roboto&display=swap"
	rel="stylesheet" />
<!-- Fontawesome API-->
<script src="https://kit.fontawesome.com/3fb56dfe63.js"
	crossorigin="anonymous"></script>
<!--
    Available Fonts
    Main Font:
    font-family: 'Kaushan Script', cursive;

    Article Choices:
    font-family: 'Roboto', sans-serif;
    font-family: 'Open Sans', sans-serif;
    font-family: 'Montserrat', sans-serif;

    Korean Font:
    font-family: '맑은 고딕', sans-serif;
    font-family: 'Noto Sans KR', sans-serif;
    font-family: 'Black Han Sans', sans-serif;
    font-family: 'Nanum Gothic', sans-serif;
    -->

<!-- css reset -->
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<!-- individual page stylesheet -->
<link rel="stylesheet" href="../../../resources/css/myaccount.css">
<link rel="stylesheet" href="../../../resources/css/common.css" />
<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="/resources/js/jquery-ui-1.10.3.custom.js"></script>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<!-- slidify sliders and fadeInUp reveal -->
<script src="../../../resources/js/common.js"></script>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="member" />
	</sec:authorize>
	<header class="topbar">
		<nav>
			<div class="container">
				 <a href="javascript: history.back();"><i class="fas fa-arrow-left"></i><span>이전</span></a>
                 <a href="/book/main"><i class="fas fa-home"></i><span>홈</span></a>
				<h2>내 정보 관리</h2>

				<div class="login-out">
					<c:choose>
						<c:when test="${sessionScope.userId != null }">
							<span>${ sessionScope.userId }</span>님 환영합니다.
                		<button type="button" id="logoutBtn"
								onclick="gologinout(0)">로그아웃</button>
						</c:when>
						<c:otherwise>
							<button type="button" id="loginBtn" onclick="gologinout(1)">로그인</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</nav>
	</header>
	<script>


	
	function gologinout(num) {
		
		if(num == 0) {
			if(!confirm('로그아웃 하시겠습니까?')) {
				return;
			}
		$('#member_id').val('');
		
			$.ajax({
				url: '/logout',
				data: {
					"member_id" : ''
				},
				success: function(rs) {
					alert('로그아웃이 완료됐습니다.');
					location.reload();
					
				}, error : function(xhr, status, error) {
					alert('오류');
				}
			});
			
		} else {
			if(!confirm('로그인 하시겠습니까?')) {
				return;
			}
			alert('로그인 페이지로 이동합니다.');
			location.href='/login';
		}
		
	}
	
</script>
<style>
li {
    list-style:none;
}
a {
    text-decoration:none;
}
.wrapper {
    width:700px;
    margin:0 auto;
    padding-top:20px;
}
.listChoice ul  {
    margin:0; 
    padding:0;
}
.listChoice ul li {
    border-bottom :1px solid #e8e8e8;
    height: 48px;
    line-height: 48px;
    text-indent:10px;
    cursor: pointer;
}
.listChoice ul li:nth-child(2) {
    border-bottom:none;
}
.listChoice p {

    background-color: #eff1f5;
    padding: 8px;
    margin-bottom:0px;
    margin-top:0px;
    font-size: 13px;
    font-weight: bold;
    color:gray;
}
.listChoice li a {
    color: #333;
    display:block;
    height:48px;
}
.listChoice i {
float:right;
line-height: 48px;
margin-right:20px;
color:#ccc;
}
.title {
    margin-bottom: 20px;
}
.title p {
    margin-bottom: 0px;
    margin-top:20px;
    color:#333;
}
.goSub {
    height:140px;
    position: relative;
    box-shadow: 0 8px 20px rgba(0,0,0,.1),
     0 2px 10px rgba(0,0,0,.1);
     border-radius:7px;
     border:none;
     margin-bottom:30px;
}
.goSub p {
    text-indent: 20px;
}
.goSub p:nth-child(1) {
   	color:#333;
    font-size:17px;
    z-index: 2;
    text-align:left;
    font-weight: bold;
}
.goSub p:nth-child(2) {
    color: #666;
    font-size: 14px;
    text-align:left;
}
.goSub p:nth-child(3) {
    color: rgb(0, 4, 255);
    font-size: 14px;
    text-align:left;
}
.goSub button {
    border:1px solid #0099FF;
    width: 100%;
    height: 100%;
    outline:none;
    border-radius:7px;
    background-color:#F3F4F6;
    font-size: 15px;
    cursor: pointer;    
    justify-content:space-between;  
}
.goSub img {
    float:right;
    width: 140px;
    position: absolute;
    top:0;
    right:0;
    margin-top:7px;
}
.lastColumn {
    background-color: #eff1f5;
}
.title  i {
    color:#c990b9;
    margin-right: 10px;
    margin-left:10px;
}
.title p {
    margin:7px 0 5px 10px;
    padding-top:10px;
    width: 400px;
    display:inline;
    font-size: 23px;
    color:#333;
}
.lastColumn {
    padding: 16px;
    margin-top:15px;
}
.lastColumn button {
    background: #bec5d0;
    font-size: 16px;
    color: #fff;
    height: 48px;
    line-height: 48px;
    display: block;
    width: 100%;
    border-radius: 4px;
    border:none;
    cursor: pointer;
    outline: none;
}
.lastColumn button:hover {
    font-weight: bold;
    background: #b5bbc4;
}
.historyBox {
    border:1px solid lightgray;
    padding: 10px;
    border-radius: 5px;
    width: 85%;
    margin:0 auto;
    margin-top: 15px;
    background-color:rgb(248, 248, 248); 
}
.payList {
    height: 85%;
    overflow:auto;
}
.historyBox p {
    border-top:1px solid lightgray;
    font-size: 14px;
    color:#0099FF;
    padding: 15px 0 15px 0;
    margin-top: 15px;
}

.historyBox p i {
    font-size: 20px;
}
.historyBox ul li {
    color: rgb(104, 103, 103);
    font-size: 13px;
    padding:2px 0 2px 0;
}
.historyBox ul li:nth-child(1) {
    font-size: 19px;
    font-weight: bold;
    color:#333;
}
.modal {
    display:none;
    position:fixed;
    left:0; 
    top:0;
    width:100%;
    height:100%;
    overflow:auto;
    background-color: rgba(0,0,0,0.3);
    z-index: 3;
}
#modalCloseBtn button {
   width: 100%; 
   height: 60px;
   font-size: 19px;
   background-color:#0099FF;
   color:white;
   border:none;
   position: absolute;
   bottom:0;
   left:0;
   right:0;
   outline:none;
   cursor: pointer;
   border-radius: 0 0 5px 5px;
}
#modalCloseBtn button:hover {
    font-weight: bold;
    background-color:rgb(5, 142, 233);
    border-radius: 0 0 5px 5px;
}
.modal .modal_content {
    position: relative;
    background-color:  #fefefe;
    margin:8% auto;
    padding: 20px 10px 20px 10px;
    width: 450px;
    height: 550px;
    border:1px solid #0099FF;
    border-radius: 5px;
    border-bottom:none; 
}
 .modal_content > p {
    font-size: 18px;
    font-weight: bold;
    padding-bottom: 15px;
    border-bottom:1px solid lightgray;
    text-align:center;
 }
.modal_content > p i {
    color: rgb(18, 69, 110);
    font-size:22px;
}
.modal_content ul li span:nth-child(2) {
        color:rgb(61, 61, 61);
        font-size:15px;
}
.NoHistory {
    text-align: center;
    height:95%;
    padding-top: 150px;
}
.NoHistory i {
    font-size: 40px;
    color:rgb(252, 215, 9);
    background-color:transparent;
    margin: 15px 0 15px 0;
}
.NoHistory p {
    font-size: 14px;
}
</style>
	<div class="wrapper">
	<form id="frm" method="post">
		<input type="hidden" name="member_id" id="member_id" value="${paramMap.member_id }" />
		<input type="hidden" name="member_name" id="member_name" value="${sessionScope.userId}" />
	</form>
    <div class="title">
        <h2> <i class="fas fa-bell-on"></i>  <p> ${sessionScope.userId} </p>님</h2>
    </div>       
    <div class="summary">
        <div class="goSub">  
            <button type="button" id="gogoSub" onclick="location.href='goSubscribe.html'">
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
                    <img src="../../../resources/images/myLibrary/photoImg.png" >
                </div>
            </button>
        </div>
    </div>
    <div class="listChoice">
        <p> 정보 관리 </p>
        <ul>
            <li><a href="javascript:goview('/member/updatemypage');">회원정보수정 <i class="far fa-chevron-right"></i></a></li>
            <li><a href="deleteMyInfo.html">회원탈퇴<i class="far fa-chevron-right"></i></a> </li>
        </ul>
    </div>
    <div class="listChoice">
        <p> 서비스 관리 </p>
        <ul>
            <li><a href="javascript:goview('/member/mypage');">마이 페이지<i class="far fa-chevron-right"></i></a></li>
            <li><a href="#" id="modalOpen">구독 내역<i class="far fa-chevron-right"></i></a></li>
        </ul>
    </div>

    <div class="listChoice">
        <p> 서비스 안내 </p>
        <ul>
            <li><a href="/member/notice">공지사항<i class="far fa-chevron-right"></i></a></li>
            <li><a href="serviceCenter.html">고객센터<i class="far fa-chevron-right"></i></a></li>
        </ul>
    </div>
    <div class="lastColumn">
      <button type="button">로그아웃</button>
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
      <button type="button" id="peopleChkBtn" > 확인 </button>
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
      const li = document.querySelector('footer.fixed a[href="my-account"]').parentElement;
      const ul = li.parentElement;
      [ul, li].forEach(element => element.classList.add('active'));
    });
  </script>


<footer class="fixed">
    <div class="container">
      <ul>
        <li>
          <a href="/">
            <i class="far fa-home-alt"></i>
            <span>홈</span>
          </a>
        </li>
        <li>
          <a href="search">
            <i class="far fa-search"></i>
            <span>검색</span>
          </a>
        </li>
        <li>
          <a href="feed">
            <i class="fad fa-stream"></i>
            <span>피드</span>
          </a>
        </li>
        <li>
          <a href="myLibrary.html">
            <i class="fas fa-books"></i>
            <span>내서재</span>
          </a>
        </li>
        <li>
          <a href="myAccount.html">
            <i class="far fa-user"></i>
            <span>관리</span>
          </a>
        </li>
      </ul>
      <button type="button" class="scroll-to-top">
        <i class="fad fa-chevron-double-up"></i>
      </button>
      <!-- add scroll-to-top function -->
      <script>
        $(document).ready(function () {
          const button = document.querySelector("footer .scroll-to-top");
          button.addEventListener("click", () => {
            document.documentElement.style.scrollBehavior = "smooth";
            document.documentElement.scrollTop = 0;
            document.documentElement.style.scrollBehavior = "";
          });
  
          let timeoutID = null;
          window.addEventListener("scroll", () => {
            if (document.documentElement.scrollTop === 0) {
              button.classList.remove("visible");
              return;
            }
            if (!button.classList.contains("visible")) {
              button.style.transition = "";
              button.classList.add("visible");
            }
            timeoutID =
              clearTimeout(timeoutID) ||
              setTimeout(() => {
                button.style.transition = "0.4s ease";
                button.classList.remove("visible");
              }, 1200);
          });
        });
        
        function goview(url) {
        	$('#frm').attr('action', url);
        	$('#frm').submit();
        }
      </script>
    </div>
  </footer>
	
	
	
</body>

</html>