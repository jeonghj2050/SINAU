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
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	<div class="content-home">
		<div class="slider">
			<div>
				<img src="resources/images/event.webp" width="1300" height="300">
			</div>
			<div>
				<img src="resources/images/event1.jpg" width="1300" height="300">
			</div>
			<div>
				<img src="resources/images/event2.jpg" width="1300" height="300">
			</div>
			<div>
				<img src="resources/images/event3.jpg" width="1300" height="300">
			</div>
		</div>
	</div>
	<section>
		<article class="childart">
			<h1>TOP10</h1>
			<c:forEach var="onlineClass" items="${offList}">
				<div class="mp_classInfo" id="${offClass.ofc_code}">
					<img src="resources/images/test/${offClass.f_oriname }" alt=""
						width="300px" height="300px" id="mp_class_img">
					<div class="class_info_contents" id="${offClass.ofc_code}">
						<p>${offClass.cts_name}| ${offClass.m_name}</p>
						<p class="info_title">${offClass.ofc_title}</p>
						<div>${offClass.ofc_content}</div>
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
</html>
