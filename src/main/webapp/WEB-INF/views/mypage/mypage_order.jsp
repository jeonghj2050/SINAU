<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU 주문내역</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/mypage.css">

<script>
$(function(){
    $(".table").hide();
    $(".table:first").show();
    $("#mytab li").click(function(){
        var tabName=$(this).attr('name');
        $(".table").hide();
        $("#"+tabName).show();
    });
});
</script>

</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section class="mp_section">
		<jsp:include page="mypage_nav.jsp"></jsp:include>
		<article>
			<div class="page-title">내 주문내역</div>
			<div role="tabpanel">
				<ul class="nav nav-tabs" role="tablist" id="mytab">
					<li role="presentation" name="tableprod"><a href="#"
						aria-controls="home" role="tab" data-toggle="tab">상품주문내역</a></li>
					<li role="presentation" name="tableon"><a href="#"
						aria-controls="home" role="tab" data-toggle="tab">온라인주문내역</a></li>
					<li role="presentation" name="tableoff"><a href="#"
						aria-controls="home" role="tab" data-toggle="tab">오프라인주문내역</a></li>
				</ul>
			</div>
			<div>
				<table class="table" id="tableprod">
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>주문금액</th>
						<th>주문일자</th>
						<th>수량</th>
						<th>총금액</th>
						<th>주문상태</th>
					</tr>
					<c:forEach var="prod" items="${prodOrder}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${prod.p_title}</td>
							<td>${prod.p_price}</td>
							<td>${prod.ord_date}</td>
							<td>${prod.ord_amount}</td>
							<td>${prod.ord_amount * prod.p_price}</td>
							<td><c:choose>
									<c:when test="${prod.ord_state == 1}">
										<button class="table-btn" data-target="#cancleOrder"
											data-toggle="modal" data-notifyid="${prod.ord_code }">주문취소</button>
										<button class="table-btn" data-target="#refund"
											data-toggle="modal" data-notifyid="${prod.ord_code }">환불</button>
									</c:when>
								</c:choose> <c:if test="${prod.ord_state == 2}">
									<span>주문취소</span>
								</c:if> <c:if test="${prod.ord_state == 3}">
									<span>환불진행중</span>
								</c:if> <c:if test="${prod.ord_state == 4}">
									<span>환불완료</span>
								</c:if>
								<div class="modal fade" id="cancleOrder">
									<div class="modal-dialog">
										<div class="modal-content">
											<!-- header -->
											<div class="modal-header">
												<!-- 닫기(x) 버튼 -->
												<button type="button" class="close" data-dismiss="modal">×</button>
												<!-- header title -->
												<h4 class="modal-title">주문 취소</h4>
											</div>
											<!-- body -->
											<div class="modal-body" style="text-align: left;">
												<input type="radio" name="reson" value="1">1.다른 제품
												구매<br> <input type="radio" name="reson" value="2">2.단순
												변심<br> <input type="radio" name="reson" value="3">3.상품
												재주문
											</div>
											<!-- Footer -->
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													onclick="cancleOrder()">주문취소</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
								<form action="./refund" method="get">
								<div class="modal fade" id="refund">
									<div class="modal-dialog">
										<div class="modal-content">
											<!-- header -->
											<div class="modal-header">
												<!-- 닫기(x) 버튼 -->
												<button type="button" class="close" data-dismiss="modal">×</button>
												<!-- header title -->
												<h4 class="modal-title">환불</h4>
											</div>
											<!-- body -->
											<div class="modal-body" style="text-align: left;">
												<input type="hidden" name="sort" value="prod">
												<input type="hidden" name="ref_ord_code" class="ref_ord_code"> 
												<input type="radio" name="ref_reson" value="더 이상 구매를 원하지 않습니다.">1.더
												이상 구매를 원하지 않습니다.<br> <input type="radio" name="ref_reson" 
													value="실수로 구매하였습니다.">2.실수로 구매하였습니다.<br> <input
													type="radio" name="ref_reson"  value="제품에 결함이 있습니다.">3.제품에
												결함이 있습니다.<br>
												 <select name="ref_bank"> 
					                                <option value="신한">신한</option>
					                                <option value="국민">국민</option>
					                                <option value="우리">우리</option>
					                            </select><br>
					                            계좌번호<input type="text" name="ref_banknum">
					                            예금주 <input type="text" name="ref_bankname">
											</div>
											<!-- Footer -->
											<div class="modal-footer">
												<button type="submit" class="btn btn-default"
													>환불</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div></form></td>
						</tr>
					</c:forEach>
				</table>
				<table class="table" id="tableon">
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>주문금액</th>
						<th>주문일자</th>
						<th>수량</th>
						<th>총금액</th>
						<th>주문상태</th>
					</tr>
					<c:forEach var="onclass" items="${onlineOrder}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${onclass.onc_title}</td>
							<td>${onclass.onc_sale}</td>
							<td>${onclass.ord_date}</td>
							<td>${onclass.ord_amount}</td>

							<td>${onclass.ord_amount * onclass.onc_sale}</td>
							<td><c:choose>
									<c:when test="${onclass.ord_state == 1}">
									</c:when>
								</c:choose> <c:if test="${onclass.ord_state == 2}">
									<button class="table-btn">환불</button>
								</c:if> <c:if test="${onclass.ord_state == 3}">
									<span>환불진행중</span>
								</c:if></td>
						</tr>
					</c:forEach>
				</table>
				<table class="table" id="tableoff">
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>주문금액</th>
						<th>주문일자</th>
						<th>수량</th>
						<th>총금액</th>
						<th>주문상태</th>
					</tr>
					<c:forEach var="offclass" items="${offOrder}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${offclass.ofc_title}</td>
							<td>${offclass.ofc_sale}</td>
							<td>${offclass.ord_date}</td>
							<td>${offclass.ord_amount}</td>

							<td>${offclass.ord_amount * offclass.ofc_sale}</td>
							<td><c:choose>
									<c:when test="${offclass.ord_state == 1}">

									</c:when>
								</c:choose> <c:if test="${offclass.ord_state == 4}">
									<button class="table-btn">환불</button>
								</c:if> <c:if test="${offclass.ord_state == 3}">
									<span>환불진행중</span>
								</c:if></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</article>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script>
	var ord_code="";
	var ref_ord_code="";
	$(document).ready(function() {     
	    $('#cancleOrder').on('show.bs.modal', function(event) {          
	    	ord_code = $(event.relatedTarget).data('notifyid');
	    	
	    });
	    $('#refund').on('show.bs.modal', function(event) {          
	    	ref_ord_code = $(event.relatedTarget).data('notifyid');
	    	$('.ref_ord_code').val(ref_ord_code);
	    });
	});
	function cancleOrder(){
		var select;
		var sort=sort;
		for(var i=0;i<document.getElementsByName('reson').length;i++){
			if(document.getElementsByName('reson')[i].checked==true){
				select=document.getElementsByName('reson')[i].value;
			}
		}
		console.log(ord_code)
		location.href='./cancleOrder?sort='+sort+"&ord_code="+ord_code;
	}
	
	function refundOrder(sort){
		var select;
		var sort=sort;
		for(var i=0;i<document.getElementsByName('reson').length;i++){
			if(document.getElementsByName('reson')[i].checked==true){
				select=document.getElementsByName('reson')[i].value;
			}
		}
		console.log(sort);
		console.log(select);
		location.href='./refund?sort='+sort+"&ord_code="+ord_code; 
	}
</script>
</html>