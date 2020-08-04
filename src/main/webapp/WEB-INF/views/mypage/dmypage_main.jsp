<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU -판매자</title>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<link rel="stylesheet" type="text/css" href="resources/css/mypage.css">


</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section class="mp_section">
		<jsp:include page="mypage_nav.jsp"></jsp:include>
		<article>
			<div class="page-title">등록된 상품</div>
			<button type="button" class="my_default_btn" style="float: right;" onclick="location.href='./dMyNewProd'">상품 등록</button>
			<div class="my_product_list">
				<c:forEach var="prod" items="${myprodList}">
					<div class="myproduct_info_box">
						<img src="resources/upload/${prod.f_sysname }" width="300px" height="300px"
							alt="" style="float: left;">
						<div class="myproduct_info">
							<div class="myproduct_content">${prod.p_title }</div>
							<div class="myproduct_amt">재고 수량 : ${prod.p_amount }</div>
							<div class="myproduct_sale_amt">
								판매 수량 : ${prod.p_salamount }
								<div>
									<button class="my_default_btn">삭제 요청</button>
									<button class="my_default_btn">재고/내용 수정</button>
								</div>
							</div>

						</div>
					</div>

				</c:forEach>
			</div>
		</article>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>