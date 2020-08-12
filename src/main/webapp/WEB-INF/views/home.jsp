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
		<article class="childart10">
			<h1>전체 강좌</h1>
			<!-- Swiper -->
			<c:forEach var="t" items="${totalList}">
				<div class="swiper-slide5">
					<a href="classcontents?totalcode=${t.totalcode}"> <img
						src="resources/upload/${t.totalimg}" width="300px" height="300px"></a>
					<div class="swiper-text5">
						<div class="total_ctsname">${t.totalctsname}</div>
						<div class="total_level">${t.totallevel}</div>
						<div class="total_sale">${t.totalsale}원</div>						
						<div class="class_likes">
										<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
												fill="#bdc2c6"></path>
										</svg>${t.totalcount}
									</div>
						
						<div class="total_title">
							<a href="classcontents?totalcode=${t.totalcode}">${t.totaltitle}</a>
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
$(document).ready(function(){
	var msg = "${msg}";
	console.log(msg);
	if(msg != ""){
		alert(msg);
		location.reload(true);
	}
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	var chk = "${check}";
	
	if(chk == "0"){
		alert("회원가입 실패!");
		location.reload(true);
	}
	if(chk == "1"){
		alert("회원가입 성공!");
		location.reload(true);
	}
	if(chk == "2"){
		alert("로그인 성공!");
		location.reload(true);
	}
	if(chk == "3"){
		alert("로그인 실패!");
		location.reload(true);
	}
	if(chk == "4"){
		alert("탈퇴한 회원 이메일입니다!");
		location.reload(true);
	}
	if(chk == "5"){
		alert("아직 승인 받지않은 이메일입니다!");
		location.reload(true);
	}

});
</script>
</html>
