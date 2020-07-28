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
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/offline/offline_apply.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/style.css" />

<title>오프라인 옵션선택</title>

</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section>
		<div class="wrap-apply">
			<div class="wrap-applytop">
				<div class="wrap-applytop-left">수업신청</div>
				<div class="wrap-applytop-right">신청서 작성</div>
			</div>

			<div class="wrap-applycenter">
				<div class="class-apply">
					<div id="classapply-img">
						<img src="../../../resources/images/offline/1.jpg" alt="#"
							width="280px" height="280px">
					</div>
					<div id="classapply-info">
						<li id="sub-cate">공예</li>
						<li id="creator-name">김지안</li>
						<li id="on-name">시들지않는 생화, 특별한 플라워 리스 만들고 꽃과 함께 인생샷 남기기</li>
					</div>
				</div>
				<div class="time-table">
					<div class="time-table-txt">
						<img src="../../../resources/images/offline/time2.png"> 원하는
						수업 일정을 선택해주세요.
					</div>
					<hr>
					<form>
						<div class="time-table-info">
							<input type="radio" name="time" value="1">
							<div class="time-table-date">07.25</div>
							<div class="time-table-time">14:00~16:00</div>
							<div class="time-table-place">강남</div>
						</div>
						<hr>
						<div class="time-table-info">
							<input type="radio" name="time" value="2">
							<div class="time-table-date">07.25</div>
							<div class="time-table-time">16:00~18:00</div>
							<div class="time-table-place">강남</div>
						</div>
						<hr>
						<br>
						<a href="/payment">
							<div class="btn-offapply">
								<input type="submit" value="완료" id="submit">
							</div> 
						</a>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>