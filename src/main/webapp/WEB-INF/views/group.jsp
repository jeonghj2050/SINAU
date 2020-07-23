<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 구분</title>
<link rel="stylesheet" href="resources/css/style.css?a">
</head>
<body>
	<div class="group">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<section>
 			<nav class="group-lisst">
				<ul>
					<li class="group1"><a href="./normaljoin">일반 회원</a></li>
					<li class="group1"><a href="./Creatorjoin">크리에이터 회원</a></li>
					<li class="group1"><a href="./dealjoin">판매자 회원</a></li>
				</ul>
			</nav>
		</section>
		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>