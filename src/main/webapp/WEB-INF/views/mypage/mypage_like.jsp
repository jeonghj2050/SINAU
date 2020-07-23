<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU 회원정보수정</title>

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/mypage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(function() {
		$('li').click(function() {
			$('li').removeClass('item-selected');
			$(this).addClass('item-selected');
		})
	});
</script>
<script type="text/javascript">
$(document).ready(function(){
  var swiper1 = new Swiper('.swc1', {
        slidesPerView: 3,
        spaceBetween: 5,
        slidesPerGroup: 3,
        loop: false,
        loopFillGroupWithBlank: true,
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        }
      });

});
</script>

</head>
<body>
	<header>
		<img src="resources/images/SINAU_logo.png" alt="" width="150px"
			height="50px" style="margin: 20px;">
		<div></div>
	</header>
	<section class="mp_section">
		<jsp:include page="mypage_nav.jsp"></jsp:include>
		<article class="childart1">
			<h1>상품</h1>
			<!-- Swiper -->
			<div class="swiper-container swc1" style="width: 1070px;">
				<div class="swiper-wrapper">
					<c:forEach var="offlineClass" items="${offlineList}">
						<div class="swiper-slide">
						<img src="resources/images/storeimg/1.PNG" width="250px"
							height="300px">
						<div class="swiper-text">
							공예
							<div class="text_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
							<div class="like_view">
								<span class="like_icon"><svg width="8px" height="8px"
										viewBox="0 0 16 16" class="bi bi-heart-fill"
										fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
											d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
          </svg></span> 246
							</div>
							<div class="price">10,450원</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<h1>오프라인</h1>
			<!-- Swiper -->
			<div class="swiper-container swc1" style="width: 1100px;">
				<div class="swiper-wrapper">
					<c:forEach var="offlineClass" items="${offlineList}">
						<div class="swiper-slide">
						<img src="resources/images/storeimg/1.PNG" width="250px"
							height="300px">
						<div class="swiper-text">
							공예
							<div class="text_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
							<div class="like_view">
								<span class="like_icon"><svg width="8px" height="8px"
										viewBox="0 0 16 16" class="bi bi-heart-fill"
										fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
											d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
          </svg></span> 246
							</div>
							<div class="price">10,450원</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<h1>상품</h1>
			<!-- Swiper -->
			<div class="swiper-container swc1" style="width: 1100px;">
				<div class="swiper-wrapper">
					<c:forEach var="offlineClass" items="${offlineList}">
						<div class="swiper-slide">
						<img src="resources/images/storeimg/1.PNG" width="250px"
							height="300px">
						<div class="swiper-text">
							공예
							<div class="text_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
							<div class="like_view">
								<span class="like_icon"><svg width="8px" height="8px"
										viewBox="0 0 16 16" class="bi bi-heart-fill"
										fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
											d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
          </svg></span> 246
							</div>
							<div class="price">10,450원</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</article>
	</section>
	<footer></footer>
</body>

</html>