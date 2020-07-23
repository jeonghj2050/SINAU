<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU 주문내역</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/mypage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
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
                    <li role="presentation" name="tableprod"><a href="#" aria-controls="home" role="tab" data-toggle="tab" >상품주문내역</a></li>
                    <li role="presentation" name="tableon"><a href="#" aria-controls="home" role="tab" data-toggle="tab">온라인주문내역</a></li>
                    <li role="presentation" name="tableoff"><a href="#" aria-controls="home" role="tab" data-toggle="tab" >오프라인주문내역</a></li>
                </ul> 
            </div>
            <div > 
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
	                        <td>
	                        	<c:choose>
									<c:when test="${prod.ord_state == 1}">
										<button class="table-btn">주문취소</button>
										<button class="table-btn">환불</button>
									</c:when>
								</c:choose>
								<c:if test="${prod.ord_state == 2}">
									<button class="table-btn">환불</button>
								</c:if>
								<c:if test="${prod.ord_state == 3}">
									<span>환불진행중</span>
								</c:if>
	                        </td>
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
	                        <td>
	                        	<c:choose>
									<c:when test="${onclass.ord_state == 1}">
										<button class="table-btn">주문취소</button>
										<button class="table-btn">환불</button>
									</c:when>
								</c:choose>
								<c:if test="${onclass.ord_state == 2}">
									<button class="table-btn">환불</button>
								</c:if>
								<c:if test="${onclass.ord_state == 3}">
									<span>환불진행중</span>
								</c:if>
	                        </td>
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
	                        <td>
	                        	<c:choose>
									<c:when test="${offclass.ord_state == 1}">
										<button class="table-btn">주문취소</button>
										<button class="table-btn">환불</button>
									</c:when>
								</c:choose>
								<c:if test="${offclass.ord_state == 2}">
									<button class="table-btn">환불</button>
								</c:if>
								<c:if test="${offclass.ord_state == 3}">
									<span>환불진행중</span>
								</c:if>
	                        </td>
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
</html>