<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="resources/css/home.css?a">
<link rel="stylesheet" href="resources/css/youtube.css?a">
<link rel="stylesheet" href="resources/css/online.css?a">
</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>

	<section class="section-home">
		<div class="content-home">
			<div class="slider">
				<div>
					<img src="resources/images/event.webp" width="100%" height="100%">
				</div>
				<div>
					<img src="resources/images/event1.jpg" width="100%" height="100%">
				</div>
				<div>
					<img src="resources/images/event2.jpg" width="100%" height="100%">
				</div>
				<div>
					<img src="resources/images/event3.jpg" width="100%" height="100%">
				</div>
			</div>
		</div>
		<article class="childart5">
			<h1>전체 유투버</h1>
			<!-- Swiper -->
			<c:forEach var="total" items="${totalList}">
				<div class="swiper-slide5">
					<a href="contents?totalcode=${total.totalcode}"> <img
						src="resources/upload/${total.totalimg}" width="300px" height="300px"></a>
					<div class="swiper-text5">
						<div class="y_name">${total.totalctsname}</div>
						<div class="y_name">${total.totalsale}</div>
						<div class="y_name">${total.totallevel}</div>
						<div class="y_name">${total.totalcount}</div>
						<div class="y_title">
							<a href="contents?totalcode=${total.totalcode}">${total.totaltitle}</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</article>
	</section>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
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
<script type="text/javascript">
	$(document).ready(function() {
		var chk = "${check}";

		if (chk == "1") {
			alert("회원가입 실패!");
		} else if (chk == "2") {
			alert("회원가입 성공!");
		}
	});
</script>

</html>
