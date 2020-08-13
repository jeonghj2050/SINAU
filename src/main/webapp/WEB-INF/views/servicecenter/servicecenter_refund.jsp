<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 센터</title>
<style type="text/css">
.t-code {
	display :none;
}
</style>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/servicecenter.css?a">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script type="text/javascript">
$(document).ready(function(){
	var chk = "${check}";
	
	if(chk == "1"){
		alert("글 등록  실패!");
		location.reload(true);
	}
	if(chk == "2"){
		alert("글 등록 성공!");
		location.reload(true);
	}
	if(chk == "3"){
		alert("글 삭제 성공!");
		location.reload(true);
	}
	if("${mb.m_email}" != '') {
	var name = "${mb.m_name}";
	$('.wr-btn').css('display','block');
	}
});
</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section class="sectionover">
	<h2 class="login-header">고객 센터</h2>
            <div class="cate_container">
                <a class="category" href="./servicecenter_main">FAQ</a>
                <a class="category" href="./servicecenter_question">1 : 1문의</a>
				<a class="category" href="./servicecenter_refund">환불내역</a>
            </div>
			<div class="data-area">
			<c:set var="cnt" value="0"/>
				<div class="title-row">
					<div class="t-no">번호</div>
					<div class="t-retitle">제목</div>
					<div class="t-orddate">주문날짜</div>
					<div class="t-amount">수량</div>
					<div class="t-reason">환불사유</div>
					<div class="t-price">환불금액</div>
					<div class="t-redate">신청날짜</div>
					<div class="t-state">현재 상태</div>
				</div><br>
				<c:forEach var="total" items="${totalList}">
				<div class="data-row">
				<div class="t-no">${total.num}</div>
					<div class="t-retitle">${total.onc_title}</div>
					<div class="t-orddate"><fmt:formatDate pattern="yyyy-MM-dd" value="${total.ord_date}"/></div>
					<div class="t-amount">${total.ord_amount}</div>
					<div class="t-reason">${total.ref_reason}</div>
					<div class="t-price">${total.ord_price}</div>
					<div class="t-redate"><fmt:formatDate pattern="yyyy-MM-dd" value="${total.ref_date}"/></div>
					<div class="t-state">
					<c:if test="${total.ref_state eq 1 }">
              				 환불 신청
            		 	  </c:if>	
            		<c:if test="${total.ref_state eq 2 }">
              				 환불 처리
            		 	  </c:if>
            		<c:if test="${total.ref_state eq 3 }">
              				 환불 완료
            		 	  </c:if> 	  
					</div>
				</div>
				</c:forEach>
				</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>

</html>