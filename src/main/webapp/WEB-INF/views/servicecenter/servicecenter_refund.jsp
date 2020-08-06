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
				<div class="title-row">
					<div class="t-no">번호</div>
					<div class="t-code">카테고리</div>
					<div class="t-retitle">제목</div>
					<div class="t-orddate">주문날짜</div>
					<div class="t-amount">수량</div>
					<div class="t-reason">환불사유</div>
					<div class="t-price">환불금액</div>
					<div class="t-redate">신청날짜</div>
					<div class="t-state">현재 상태</div>
				</div><br>
				<c:forEach var="reitem" items="${reList}">
				<div class="data-row">
					<div class="t-no">${reitem.rownum}</div>
					<div class="t-code" style="display:none;">${reitem.ord_kind}</div>
					<div class="t-retitle">${reitem.ofc_title}</div>
					<div class="t-retitle">${reitem.onc_title}</div>
					<div class="t-retitle">${reitem.p_title}</div>
					<div class="t-orddate"><fmt:formatDate pattern="yyyy-MM-dd" value="${reitem.ord_date}"/></div>
					<div class="t-amount">${reitem.ord_amount}</div>
					<div class="t-reason">${reitem.ref_reason}</div>
					<div class="t-price">${reitem.ord_price}</div>
					<div class="t-redate"><fmt:formatDate pattern="yyyy-MM-dd" value="${reitem.ref_date}"/></div>
					<div class="t-state">${reitem.ref_state}</div>
					
				</div>
				</c:forEach>
				</div>
			<div class="btn-area">
				<button class="wr-btn" onclick="location.href='./servicecenter_write'">글쓰기</button>
			</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>

</html>