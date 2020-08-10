<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html lang="en">
<head>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/payment/completion_pay.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/style.css" />
<title>결제창</title>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section>
		<div class="compay-top">
			<div class="compay-top-txt">결제완료</div>
		</div>
		<div class="compay-center-wrap">
			<div class="compay-center">
				<div class="order-txt">
					결제완료<br>${orderCheck.ord_name}님의 주문이 완료되었습니다.<br>
				</div>
				<div class="order-info">
					<div class="order-num">
						<div>주문번호</div>
						<div>${orderCheck.ord_code}</div>
					</div>
					<div class="order-name">
						<div>주문명</div>
						<div>${mclCheck.ofc_title}</div>
					</div>
				</div>
				 <a href="/">
				 <div class="compay">
				<button class="btn-compay">돌아가기</button>
				</div>
				</a>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js%22%3E%3C/script"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js%22%3E%3C/script"></script>

</html>