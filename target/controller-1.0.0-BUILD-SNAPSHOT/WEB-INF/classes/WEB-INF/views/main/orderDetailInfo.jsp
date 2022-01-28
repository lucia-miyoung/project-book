<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="../../../resources/css/orderDetailInfo.css">
   <script src="https://kit.fontawesome.com/3fb56dfe63.js"
	crossorigin="anonymous"></script>
    <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="/resources/js/jquery-ui-1.10.3.custom.js"></script>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <link rel="stylesheet" href="../../../resources/css/reset.css">
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <script src="../../../resources/js/common.js"></script>
</head>
<body>

 <div class="mainBody">
	<form id="frm" method="post">
		<input type="hidden" name="member_id" id="member_id" value="${sessionScope.userId}"/>
		<input type="hidden" name="book_id" id="book_id" value="${paramMap.book_id}"/>
	</form>

        <div class="mainTitle">
            <h3> 주문 상세현황 </h3>
        </div>

        <div class="orderDetail">
            <div class="orderInformation">
                주문번호 (9987454321) / <a> 주문 날짜: 2020-04-30</a></th>
             </div>

            <div class="orderInfo">
                <table class="secondTable">
                <tr>
                    <th> 도서이미지 </th>
                    <th> 도서명 </th>
                    <th> 가격 </th>
                    
                </tr>
                    <tr>
                        <td> <img src="/bookImg/book${bookInfo.book_id}.jpg" alt="오류" width=100> </td>
                        <td> ${bookInfo.book_name} </td>
                        <td> KRW <span class="bookPrice" style="font-weight:bold;">${bookInfo.book_price}</span> 원  </td>
                    </tr>
                    <tr>
                        <td colspan="2"> 총 개수 <a> 1 </a> 개 </td>
                        <td> 총 금액  <a id="total_price"> 32,000 </a> 원</td>
                    </tr>
                </table>
            </div> 
         
            <div class="clientInfo">
                <table>
                    <tr>
                        <th>주문자 이름</th>
                        <td colspan="3">${memInfo.member_name}</td>
                    </tr>
                    <tr>
                        <th>핸드폰 번호</th>
                        <td>${memInfo.member_phone}</td>
                        <th>이메일</th>
                        <td>${memInfo.member_id}</td>
                    </tr>

                </table>

            </div>


            <div class="delivery"> 
                <table class="deliveryInfo">
                    <tr>
                        <th> 주소 </th>
                        <td> ${memInfo.member_home1} / ${memInfo.member_home2} ${memInfo.member_home3} </td> 
                    </tr>
                   <!--  <tr>
                        <th> 배송 요청사항 </th>
                        <td> </td>
                    </tr> -->
                </table>
            </div>
        </div>
    </div>

</body>
</html>