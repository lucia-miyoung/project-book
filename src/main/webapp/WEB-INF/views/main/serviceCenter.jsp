<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>    
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Montserrat|Noto+Sans+KR|Open+Sans|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../../resources/css/serviceCenter.css">
    <script src="https://kit.fontawesome.com/3fb56dfe63.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../../resources/css/reset.css">
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <script src="../../../resources/js/common.js"></script>
</head>
<body>
   <header class="topbar">
		<nav>
			<div class="container">
				 <a href="javascript: history.back();"><i class="fas fa-arrow-left"></i><span>이전</span></a>
                 <a href="/book/main"><i class="fas fa-home"></i><span>홈</span></a>
				<h2>고객 센터</h2>

				<div class="login-out">
					<c:choose>
						<c:when test= "${sessionScope.userId != null }">
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

<div class="bigBox">
      <div class="tabBox">
          <ul class="tabs">
                <li class="active" data-id="one">
                      문의하기
                </li>
                <li data-id="two">           
                      문의내역
                </li>
          </ul>
      </div>
      <form method="post" id="postform">
         <div class="contentBox" data-id="one">
            <div class="goQuestion">
              <div id="msg-wrap">
                        <div class="selectWrap">
                            <input type="text" name="ask_reason" class="default" value="" readonly/>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="selectResult invisible">
                            <ul>
                            	<li>회원 정보 문의</li>
                    			<li>결제/취소/환불 문의</li>
								<li>배송 문의</li>
                    			<li>도서관련 문의</li>
                    			<li>기타 문의</li>
                            </ul>
                        </div>
                    </div>
              <div class="title">
                  <input type="text" id="titleName" name="boardTitle" placeholder="제목을 입력하세요.">
                <textarea id="matter" name ="boardContent">
                </textarea>
               </div>
            </div>
            <div class="addNotice">
                <ul>
                    <li> 문의 [제목]과 [내용]란에는 절대 개인정보를 입력하지 마세요.</li>
                    <li> 문의에 개인정보가 포함되어 있거나, 중복 문의인 경우에는 삭제될 수 있습니다.</li>
                    <li> 문의에 욕설, 인격침해, 성희롱 등 수치심을 유발하는 표현이 있다면 상담이 중단될 수 있습니다. </li>
                </ul>
            </div>
            <label for="fileLabel">첨부파일</label>
            <div class="addFile">
                <!-- <input type="text" name="fileTxt" id="fileTxt"> -->
                <input type="file" name="askfile" id="askfile">
            </div>
            <p class="fileadd"> * 문제가 발생하는 화면 캡쳐 이미지를(타입: jpg, jpeg, png, svg)첨부해주세요.(최대 50GB까지 가능)</p>
        
            <label for="mailInput">
                이메일
            </label>
            <div class="email">
                <input type="text" name="email" id="email">
            </div>
            <!-- <label for="tellInput">
                연락처
            </label>
            <div class="tell">
                <input type="text" name="tell" id="tell">
            </div> -->

        <div class="agreeChk">
            <label for="chkbox">
            <input type="checkbox" name="chkbox" id="chkbox">
                개인정보 수집 및 이용 동의
            </label>
            <ul>
                <li> 1. 개인정보의 수집ㆍ이용 목적
                    밀리의 서재에서는 문의하신 내용에 대한 원인파악 및 원활한 상담을 위해 개인정보를 수집하고 있습니다. 수집된 개인정보는 상담 외 다른 용도로 사용되지 않습니다.
                </li>
                <li>
                    2. 수집하는 개인정보의 항목
                이메일, 연락처(휴대폰 번호), 단말 기기의 OS버전 정보, 앱 버전, 인터넷 환경에 대해, 고객님이 제공하시는 정보에 한해 수집합니다.

                </li>
                <li>
                    3. 개인정보의 보유ㆍ이용 기간
                    수집된 개인정보는 회원탈퇴 시점 또는 관련 법령(소비자의 불만 또는 분쟁처리에 관한 기록 3년)에 근거한 기간 동안 보관 후 삭제됩니다.
    
                </li>
            </ul>

        </div>
        <div class="btn">
            <button type="button" id="preBtn" onclick="history.back()">이전</button>
            <button type="button" id="finishBtn" onclink="inputFinish()">문의하기</button>
        </div>
        </div>
        </form>
         <!--one end  -->

         <div class="contentBox invisible" data-id="two">
            <div class="questionTable">
                <table class="tables">
                    <tr>
                        <th>문의 유형</th>
                        <th>상품명</th>
                        <th>제목</th>
                        <th>문의날짜</th>
                        <th>답변상태</th>
                        <th>삭제</th>
                    </tr>
                   <!-- foreach 시작 -->
                    <tr>
                        <td>배송 문의</td>
                        <td><a href="#"> 달빛 마신 소녀</a></td>
                        <td><a href="#detailQuestion" id ="titleClick">언제 도착하나요?</a></td>
                        <td>2020.05.01</td>
                        <td>답변완료</td>
                        <td><button type="button" id=deleteBtn><i class="fas fa-trash-alt"></i></button></td>
                    </tr>
                    <tr>
                        <td colspan="6"> 
                        <div class="detailQuestion">
                            <div class="question">
                                <strong><i class="fab fa-quora"></i></strong> 
                                <p> 배송이 대체 언제오나요~~~~~~~~~~~~
                                    배송이 대체 언제오나요~~~~~~~~~~~~
                                    배송이 대체 언제오나요~~~~~~~~~~~~
                                    배송이 대체 언제오나요~~~~~~~~~~~~
                                    배송이 대체 언제오나요~~~~~~~~~~~~
                                    배송이 대체 언제오나요~~~~~~~~~~~~
    
                                </p>
                            </div>
                            <div class="answer">
                                <strong><i class="fas fa-font"></i></strong> 
                                <p>
                                    안녕하세요. 소중한 고객님 
                                    2020년 4월 30일부터 2020년 5월 6일까지 연휴로 인하여 
                                    배송이 평소보다 3~7일 정도 지연되고 있습니다.
                                    빠른 시일 내에 고객님께 전달되도록 하겠습니다.  
                                    불편을 드려서 죄송합니다. 감사합니다.
    
                                </p>
                            </div>
                        </div>    
                        </td>
                    </tr>
                    <!-- foreach 끝 -->    

                </table>            
              </div>
        </div>
</div>

<script>

const tabs = document.querySelectorAll('ul.tabs li');
const conts = document.querySelectorAll('.contentBox');

tabs.forEach((tab, index) => {
	tab.addEventListener('click', (event) => {
		const tabid = tab.dataset.id;
		const conid = conts[index].dataset.id;
			conts.forEach(cont=>{
				if(tabid == cont.dataset.id) {
					cont.classList.remove('invisible');
				}else {
					cont.classList.add('invisible');
				}
			});
	
		tabs.forEach(tab=> {
			tab.classList.remove('active');
		});
		tab.classList.add('active');
	});
	
});

</script>

<script>
const selectWrap = document.querySelector('.selectWrap');
const selectIcon = document.querySelector('.selectWrap > i');
const selectResult = document.querySelector('.selectResult');
const selectList = document.querySelector('.selectResult > ul');
const def = document.querySelector('.default');
const wrap = document.querySelector('#wrap');

def.value = selectList.querySelectorAll('li')[0].textContent;

selectWrap.addEventListener('click', () => {
    selectIcon.classList.toggle('open');
    selectResult.classList.toggle('invisible');
});

selectList.addEventListener('click', (event) => {
    if (event.target.nodeName == 'LI') {
        const val = event.target.textContent;
        def.value = val;
        selectResult.classList.add('invisible');
        selectIcon.classList.toggle('open');
    }
});
</script>

<script>
const askfile = document.querySelector('#askfile');
let imgtype= ['jpg', 'jpeg', 'png', 'svg'];

askfile.addEventListener('change', (event) => {
	let file = event.target.files[0];
 	let filetype = file.type.split('/')[1];
 	if(imgtype.indexOf(filetype) == -1) {
 		alert('jpg, jpeg, png, svg 등 \n이미지 파일만 업로드 가능합니다.');
 		return;
 	}
	});

</script>

<script>

    $(document).on("click", "#titleClick", function(){
        if($(".detailQuestion").css("display")=="none"){
            $(".detailQuestion").show();
        }else {
            $(".detailQuestion").hide();
        }
    });
    
    </script>

<script>
    function inputFinish(){
        var infoChk =document.getElementById('infoChk');
        var chkbox = document.getElementById("chkbox");

        if(chkbox.checked==false){
                alert("개인정보 수집 및 이용에 동의해주세요.");
                return;
        }else{
            alert("등록 완료되었습니다.")
        document.getElementById('inputForm').submit();
        }
    }
</script>
    
</body>
</html>