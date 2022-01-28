<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <script src="https://kit.fontawesome.com/3fb56dfe63.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js" integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc=" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Montserrat|Noto+Sans+KR|Open+Sans|Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../../resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/payment.css" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mainBody">
        <form id="frm" method="post">
            <input type="hidden" name="member_name" id="member_name" value="${sessionScope.userId}" />
        	<input type="hidden" name="orderChk" id="orderChk" value="${orderChk}" />
        	 
        </form>

        <div class="mainTitle">
            <h3 style="font-size:18px;"> 주문/결제 </h3>
        </div>
	<form id="orderfrm" method="post">
	<input type="hidden" name="status" id="status" value="I"/>
	<input type="hidden" name="mileage" id="mileage" value=""/>
        <div class="orderDetail">
            <div class="orderInformation">
                주문번호 (9987454321) / 주문 날짜 :
                <input type="text" id="order_date" name="order_date" value="" readonly/>
            </div>
		
            <div class="order-info">
                <div class="order-info-title">
                    도서 정보
                </div>
                <div class="order-info-detail">
                    <ul class="title">
                    	<li>순번</li>
                        <li>도서이미지</li>
                        <li>도서명</li>
                        <li>가격</li>
                    </ul>
                  <c:forEach var="book" items="${bookList}" varStatus="status">
                    <ul class="content">
                    	<li>${status.index+1 }
                    	<input type="hidden" name="book_id" id="book_id" value="${book.book_id}"/>
                    	</li>
                        <li><img src="/bookImg/book${book.book_id}.jpg" alt="오류"></li>
                        <li><span>${book.book_name }</span></li>
                        <li>KRW <span id="price">${book.book_price }</span>원</li>
                    </ul>
                  </c:forEach>
                </div>
                <!-- <div class="total">
                    <p>총 <span>1개</span> <span>9800</span>원</p>
                </div> -->
            </div>

            <div class="user-info">
                <div class="user-info-title">
                    주문자 정보
                </div>
                <div class="user-info-detail">
                    <div class="user_name">
                        <span>주문자 이름</span>
                        <input type="text" name="order_name" id="order_name" value="${sessionScope.userId }" readonly/>
                    </div>
                    <div class="user_phone">
                        <span>주문자 전화번호</span>
                         <input type="text" name="order_phone" id="order_phone" value="${userinfo.member_phone }" readonly/>
                    </div>
                    <div class="user_email">
                        <span>주문자 이메일</span>
                        <input type="text" name="order_email" id="order_email" value="${userinfo.member_id }" readonly/>
                    </div>
                </div>
            </div>
            <div class="ship-info">
                <div class="ship-info-title">
                    배송지 정보
                </div>
                <div class="ship-info-address">
                    <input type="text" class="address" name="order_address" readonly 
                    value="${userinfo.member_home1} ${userinfo.member_home2} ${userinfo.member_home3}"/>
                    <button type="button" class="adrsBtn">변경</button>
                    <div id="msg-wrap">
                        <div class="selectWrap">
                            <input type="text" name="ship_msg" class="default" value="${shipmsg[0].ship_msg}" readonly/>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="selectResult invisible">
                            <ul>
                            	<c:forEach var="list" items="${shipmsg}">
                                	<li>${list.ship_msg}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pay-info">
                <div class="pay-info-title">
                    결제 정보
                </div>
                <div class="pay-info-detail">
                    <table>
                            <tr>
                                <th>총 수량</th>
                                <td><span>${bookList.size()}</span>개</td>
                            </tr>
                            <tr>
                                <th>총 상품 금액</th>
                                <td><span id="item_price"></span>원</td>
                            </tr>
                            <tr>
                                <th>할인 쿠폰</th>
                                <td><span id="disc_cpn"></span>원 ( 
                                	<span id="percent">
                                	<c:if test="${bookList.size() <= 2}">
                                	${cpnList[1].discount_cpn}
                                	</c:if>
                                	<c:if test="${bookList.size() == 3}">
                                	${cpnList[2].discount_cpn}
                                	</c:if>
                                	<c:if test="${bookList.size() == 4}">
                                	${cpnList[3].discount_cpn}
                                	</c:if>
                                	<c:if test="${bookList.size() > 4}">
                                	${cpnList[5].discount_cpn}
                                	</c:if> 
                                	</span>%)
                                </td>
                            </tr>
                            <tr>
                                <th>배송비</th>
                                <td><span id="ship_price"></span>원</td>
                            </tr>
                            <tr>
                                <th>총 결제 금액</th>
                                <td>
                                <input type="text" id="total_price" name="total_price" value=""/>원</td>
                            </tr>
                    </table>
                </div>
            </div>
            <div class="total-pay-btn">
                <button type="button" class="cancel-button">취소하기</button>
                <button type="button" class="pay-button">결제하기</button>
            </div>

        </div>
 	</form>
    </div>


   	<script>
   		const cancelBtn = document.querySelector('.cancel-button');
   		cancelBtn.addEventListener('click', () => {
   			if(!confirm('취소하시겠습니까?')) {
   				return;
   			}
   			history.back(-1);
   		});
   		
   		const payBtn = document.querySelector('.pay-button');
   		const orderChk = document.querySelector('#orderChk');	
   		const inputs = document.querySelectorAll('.orderDetail input:not(#book_id)');
	   		
   		payBtn.addEventListener('click', () => {
   	   		
   	   		for(let i=0; i<inputs.length; i++){
   	   			if(inputs[i].value == null || inputs[i].value == '') {
   	   				alert('빈칸을 입력해주세요.');
   	   				inputs[i].focus();
   	   				return;
   	   			}
   	   		}
   	   		
   			if(orderChk.value > 0) {
   				alert('이미 구매된 도서가 있습니다. \n아이디 1개당 각 도서 1개씩만 구매 가능합니다.');
   				return;
   			}

   			if(!confirm('구매하시겠습니까?')) {
   				return;
   			} else {
   				onorderitem();
   			}
   			
   		});
   		
   		function onorderitem() {
   			$.ajax({
   				url: "/member/setOrderitem.do",
   				data: $('#orderfrm').serialize(),
   				async: true,
   				success: function(rs) {
   					alert('구매 완료되었습니다.');
   	   				$('#frm').attr('action','/member/mypage');
   	   				$('#frm').submit();
   				}
   				,error: function(xhr, status, error) {
   					alert('오류');
   				}
   				
   			});
   		}
   	</script>
   
    <script>
        const selectWrap = document.querySelector('.selectWrap');
        const selectIcon = document.querySelector('.selectWrap > i');
        const selectResult = document.querySelector('.selectResult');
        const selectList = document.querySelector('.selectResult > ul');
        const def = document.querySelector('.default');
        const wrap = document.querySelector('#wrap');

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
                if(val == '직접 입력') {
                	def.readOnly=false;
                	def.value='';
                	def.focus();
                }
            }
        });

        let adrsInput = document.querySelector('.ship-info-address > input');
        const adrsBtn = document.querySelector('.ship-info .adrsBtn');
        adrsBtn.addEventListener('click', () => {
            adrsInput.readOnly = false;
            adrsInput.focus();
        });

        let today = new Date();
        let year = today.getFullYear();
        let month = ('0' + (today.getMonth() + 1)).slice(-2);
        let day = ('0' + today.getDate()).slice(-2);
        let dateString = year + '-' + month + '-' + day;
        let hours = ('0' + today.getHours()).slice(-2);
        let minutes = ('0' + today.getMinutes()).slice(-2);
        let timeString = hours + ':' + minutes;
        
        let dateSpan = document.querySelector('.orderInformation > input');
        dateSpan.value = dateString + ' ' + timeString;

    </script>
    <script>
    	const bookPrices = document.querySelectorAll('.order-info-detail .content #price');
    	const priceSpan = document.querySelector('#item_price');
    	const discSpan = document.querySelector('#disc_cpn'); 
    	let shipSpan = Number('2500');
    	const totalSpan = document.querySelector('#total_price');
    	const mileSpan = document.querySelector('#mileage');
    	
        let disc = Number(document.querySelector('.pay-info-detail #percent').textContent);
    	let price = 0;
		let maxPrice = 50000;
    	
    	bookPrices.forEach(item=> {
    		 price += Number(item.textContent);	
    	});
    	
    	//결제 정보 자동 입력
    	let disPrice = (price*disc)/100;
    	discSpan.textContent = disPrice.toLocaleString();
    	
    	//상품 금액 5만원이상 무료배송
    	price >= maxPrice ? shipSpan = 0 : shipSpan;
    	document.querySelector('#ship_price').textContent = shipSpan.toLocaleString();
    	
    	let sum = price-disPrice+shipSpan;
    	priceSpan.textContent = price.toLocaleString();
    	
    	totalSpan.value = sum.toLocaleString();
    	
    	//마일리지
    	let milesum = Math.round(((price-disPrice)*3)/100);
    	mileSpan.value = milesum;
    		
    </script>
</body>
</html>