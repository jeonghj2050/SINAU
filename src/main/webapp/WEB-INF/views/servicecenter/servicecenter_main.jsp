<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="resources/css/servicecenter.css?a">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.FAQ_tab li").click(function() {

			$("ul.FAQ_tab li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});

	});
</script>
</head>
<body>
	<header>
		<jsp:include page="servicecenter_header.jsp"></jsp:include>
	</header>
	<section>
		<h2 class="login-header">고객 센터</h2>
		<div class="cate_container">
			<a class="category" href="./servicecenter_main">FAQ</a> <a
				class="category" href="./servicecenter_question">1 : 1문의</a>
		</div>
		<div class="FAQ_box">
			<ul class="FAQ_tab">
				<li><a href="#tab1">1</a></li>
				<li><a href="#tab2">2</a></li>
				<li><a href="#tab3">3</a></li>
				<li><a href="#tab4">4</a></li>
				<li><a href="#tab5">5</a></li>
				<li><a href="#tab6">6</a></li>
				<li><a href="#tab7">7</a></li>
				<li><a href="#tab8">8</a></li>
				<li><a href="#tab9">9</a></li>
				<li><a href="#tab10">10</a></li>
			</ul>
			<div class="FAQ_title">
					<div class="FAQ_num">번호</div>
					<div class="FAQ_content">내용</div>
			</div>
			<div class="tab_container">

				<div id="tab1" class="tab_content">
					<ul>
						<li>daskdsalfjaslfasjflasjfas</li>
						<li>hfaskfsafaskfhasfksafsa</li>
					</ul>
				</div>

				<div id="tab2" class="tab_content">
					<ul>
						<li>rerbreb</li>
						<li>uykulyu</li>
					</ul>
				</div>
				<div id="tab3" class="tab_content">
					<ul>
						<li>dasdsadsad</li>
						<li>hfaskfsafaskdsadsadfhasfksafsa</li>
					</ul>
				</div>
				<div id="tab4" class="tab_content">
					<ul>
						<li>oiyiuky</li>
						<li>/p/po.ip</li>
					</ul>
				</div>
				<div id="tab5" class="tab_content">
					<ul>
						<li>kwykmyjy</li>
						<li>gdsgeulr7i;lti</li>
					</ul>
				</div>

			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="servicecenter_footer.jsp"></jsp:include>
	</footer>
</body>
</html>