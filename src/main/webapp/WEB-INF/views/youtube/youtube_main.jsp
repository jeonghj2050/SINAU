<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유튜브 메인</title>
<link rel="stylesheet" href="resources/css/youtube.css?a">
</head>
<body>
	<header>
		<jsp:include page="../header.jsp" ></jsp:include>
	</header>

	<section class="section-home">
		<div class="content-home">
				<img src="resources/images/bbb.jpg"width="100%" height="100%">
		</div>
		<div class="top10menu">
			<a>슬라이드</a>
			<div class="top10">
				<h1>top10</h1>
			</div>
			<div class=c:foreach>
				<div class="youtubeinfo">
					<a>상세정보</a>
					<div class="youtubeclass_img">이미지</div>
					<p>타이틀 제목 제목 제목</p>
				</div>
			</div>
			<div class=c:foreach>
				<div class="youtubeinfo">
					<a>상세정보</a>
					<div class="youtubeclass_img">이미지</div>
					<p>타이틀 제목 제목 제목</p>
				</div>
			</div>
			<div class=c:foreach>
				<div class="youtubeinfo">
					<a>상세정보</a>
					<div class="youtubeclass_img">이미지</div>
					<p>타이틀 제목 제목 제목</p>
				</div>
			</div>
			<div class=c:foreach>
				<div class="youtubeinfo">
					<a>상세정보</a>
					<div class="youtubeclass_img">이미지</div>
					<p>타이틀 제목 제목 제목</p>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>