<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
		<jsp:include page="servicecenter_header.jsp"></jsp:include>
	</header>
	<section class="sectionover">
		<h2 class="login-header">고객 센터</h2>
		<div class="cate_container">
			<a class="category" href="./servicecenter_main">FAQ</a>
			<a class="category" href="./servicecenter_question">1 : 1문의</a> 
		</div>
		
	</section>
	<footer>
		<jsp:include page="servicecenter_footer.jsp"></jsp:include>
	</footer>
</body>
</html>