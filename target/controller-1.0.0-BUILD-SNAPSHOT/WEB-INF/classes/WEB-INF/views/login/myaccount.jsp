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
            <div id="gogoSub">
            <div>
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
            </div>
            </div>
        </div>
    </div>
    <div class="listChoice">
        <p> 정보 관리 </p>
        <ul>
            <li><a href="javascript:goview('/member/updatemypage');">회원정보수정 <i class="far fa-chevron-right"></i></a></li>
            <li><a href="javascript:goview('/member/godeletepage');">회원탈퇴<i class="far fa-chevron-right"></i></a> </li>
        	<li><a href="javascript:goview('/member/mypage');">마이 페이지<i class="far fa-chevron-right"></i></a></li>
        </ul>
    </div>

    <div class="listChoice">
        <p> 서비스 안내 </p>
        <ul>
            <li><a href="/member/notice">공지사항<i class="far fa-chevron-right"></i></a></li>
            <li><a href="/common/servicecenter">고객센터<i class="far fa-chevron-right"></i></a></li>
        </ul>
    </div>
    <div class="lastColumn">
      <button type="button" onclick="gologinout(0)">로그아웃</button>
    </div>
  </div>
<script>

function gologinout(num) {
	
	if(num == 0) {
		if(!confirm('로그아웃 하시겠습니까?')) {
			return;
		}
		
		alert('로그아웃 됐습니다.');
		
		$.ajax({
			url: '/logout',
			data: {
				"member_id" : ''
			},
			success: function(rs) {
				location.reload();
				$('#member_id').val('');
			
			}, error : function(xhr, status, error) {
				alert('오류');
			}
		});
		
	} else {
		alert('로그인 페이지로 이동합니다.');
		location.href='/login';
	}
	
}

function goview(url) {
	const userid = document.querySelector('#member_name').value;
	if(userid == '' || userid == null) {
		alert('로그인 후 이용 가능합니다.');
		return;
	}
	$('#frm').attr('action', url);
	$('#frm').submit();
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
            <i class="fas fa-home"></i>
            <span>홈</span>
          </a>
        </li>
        <li>
          <a href="search">
            <i class="fas fa-search"></i>
            <span>검색</span>
          </a>
        </li>
        <li>
          <a href="feed">
            <i class="fas fa-stream"></i>
            <span>피드</span>
          </a>
        </li>
        <li>
          <a href="myLibrary.html">
            <i class="fas fa-book"></i>
            <span>내서재</span>
          </a>
        </li>
        <li>
          <a href="myAccount.html">
            <i class="fas fa-user"></i>
            <span>관리</span>
          </a>
        </li>
      </ul>
      <button type="button" class="scroll-to-top">
        <i class="fas fa-chevron-double-up"></i>
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
        
        
      </script>
    </div>
  </footer>
	
	
	
</body>

</html>