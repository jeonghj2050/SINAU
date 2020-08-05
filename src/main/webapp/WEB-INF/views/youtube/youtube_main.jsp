<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유튜브 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<link rel="stylesheet" href="resources/css/home.css?a">
<link rel="stylesheet" href="resources/css/youtube.css?a">
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>

	<section class="section-home">
		<div class="youtube-home">
			<div class="image">대표 이미지</div>
		</div>
		<div class="top10menu">
			<h1>TOP10</h1>
			<c:forEach var="index" begin="1" end="10">
			<div class="youtube">
				<div class="y_img">이미지</div>
				<div class="y_title">제목</div>
			</div>
		 	</c:forEach>
		 </div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		var chk = "${msg}";

		if (chk != "") {
			alert(chk);
			location.reload(true);
		}

		$('.slider').bxSlider({
			auto : true,
			slideWidth : 1300,
		});

		var mql = window.matchMedia("screen and (max-width: 1300px)");
		mql.addListener(function(e) {
			if (!e.matches) {
				slider.reloadSlider();
			}
		});
		
	});
</script>
</html>