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
										<button class="table-btn" data-target="#resetOrder"
											data-toggle="modal">주문취소</button>
										<button class="table-btn">환불</button>
									</c:when>
								</c:choose> <c:if test="${prod.ord_state == 2}">
									<button class="table-btn">환불</button>
								</c:if> <c:if test="${prod.ord_state == 3}">
									<span>환불진행중</span>
								</c:if>
								<div class="modal fade" id="resetOrder">
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
											<div class="modal-body">
												<input type="radio" name="reson" value="1">1.다른 제품
												구매<br> <input type="radio" name="reson" value="2">2.단순
												변심<br> <input type="radio" name="reson" value="3">3.상품
												재주문
											</div>
											<!-- Footer -->
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													onclick="resetOrder()">주문취소</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div></td>
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
										<button class="table-btn" data-target="#resetOrder"
											data-toggle="modal">주문취소</button>
										<button class="table-btn">환불</button>
									</c:when>
								</c:choose> <c:if test="${onclass.ord_state == 2}">
									<button class="table-btn">환불</button>
								</c:if> <c:if test="${onclass.ord_state == 3}">
									<span>환불진행중</span>
								</c:if>
								<div class="modal fade" id="resetOrder">
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
											<div class="modal-body">
												<input type="radio" name="reson" value="1">1.다른 제품
												구매<br> <input type="radio" name="reson" value="2">2.단순
												변심<br> <input type="radio" name="reson" value="3">3.상품
												재주문
											</div>
											<!-- Footer -->
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													onclick="resetOrder()">주문취소</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div></td>
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
										<button class="table-btn" data-target="#resetOrder"
											data-toggle="modal">주문취소</button>
										<button class="table-btn">환불</button>
									</c:when>
								</c:choose> <c:if test="${offclass.ord_state == 2}">
									<button class="table-btn">환불</button>
								</c:if> <c:if test="${offclass.ord_state == 3}">
									<span>환불진행중</span>
								</c:if>
								<div class="modal fade" id="resetOrder">
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
											<div class="modal-body">
												<input type="radio" name="reson" value="1">1.다른 제품
												구매<br> <input type="radio" name="reson" value="2">2.단순
												변심<br> <input type="radio" name="reson" value="3">3.상품
												재주문
											</div>
											<!-- Footer -->
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													onclick="resetOrder()">주문취소</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div></td>
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
   function resetOrder(){
       var select;

       for(var i=0;i<document.getElementsByName('reson').length;i++){
           if(document.getElementsByName('reson')[i].checked==true){
               select=document.getElementsByName('reson')[i].value;
           }
       }

       location.href='./resetOrder';
   }
</script>
</html>