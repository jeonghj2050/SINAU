<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="resources/css/style.css?a">

</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>

		<div class="slideshow-container">

			<div class="mySlides fade">
				<div class="numbertext">1 / 3</div>
				<img src="resources/images/event1.jpg" width="1300" height="300">
			</div>

			<div class="mySlides fade">
				<div class="numbertext">2 / 3</div>
				<img src="resources/images/event2.jpg" width="1300" height="300">
			</div>

			<div class="mySlides fade">
				<div class="numbertext">3 / 3</div>
				<img src="resources/images/event3.jpg" width="1300" height="300">
			</div>

		</div>
		<br>

		<div style="text-align: center">
			<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
		</div>
		<section>
	</section>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
	var slideIndex = 0;
	showSlides();

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
		setTimeout(showSlides, 2000); // Change image every 2 seconds
	}
</script>
</html>
