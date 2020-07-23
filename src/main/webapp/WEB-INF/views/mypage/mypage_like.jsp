<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU 좋아요 목록</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/mypage.css">

<style type="text/css">
	.swiper-container {
		width: 1070px;
		margin-bottom:50px; 
	}
</style>

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
        slidesPerView: 4,
        spaceBetween: 5,
        slidesPerGroup: 4,
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
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section class="mp_section">
		<jsp:include page="mypage_nav.jsp"></jsp:include>
		<article class="childart1">
			<div class="page-title"> 좋아요 </div>
			<div>
				<span>온라인</span>
			</div>
			<div class="swiper-container swc1">
				<div class="swiper-wrapper">
					<c:forEach var="onLike" items="${onLikeList }">
						<div class="swiper-slide">
						<img src="resources/images/test/${onLike.f_oriname }" width="250px"
							height="300px">
						<div class="swiper-text">
							${onLike.cts_name }
							<div class="text_title">${onLike.onc_title }</div>
							<div class="like_view">
								<span class="like_icon"><svg width="8px" height="8px"
										viewBox="0 0 16 16" class="bi bi-heart-fill"
										fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
											d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                                        </svg></span> ${onLike.l_count }
							</div>
							<div class="price">${onLike.onc_sale }원</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<div>
				<span>오프라인</span>
			</div>
			<div class="swiper-container swc1">
				<div class="swiper-wrapper">
					<c:forEach var="offLike" items="${offLikeList }">
						<div class="swiper-slide">
						<img src="resources/images/test/${offLike.f_oriname }" width="250px"
							height="300px">
						<div class="swiper-text">
							${offLike.cts_name }
							<div class="text_title">${offLike.ofc_title }</div>
							<div class="like_view">
								<span class="like_icon"><svg width="8px" height="8px"
										viewBox="0 0 16 16" class="bi bi-heart-fill"
										fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
											d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                                        </svg></span> ${offLike.l_count }
							</div>
							<div class="price">${offLike.ofc_sale }원</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<div>
				<span>상품</span>
			</div>
			<div class="swiper-container swc1">
				<div class="swiper-wrapper">
					<c:forEach var="prodLike" items="${prodLikeList }">
						<div class="swiper-slide">
						<img src="resources/images/test/${prodLike.f_oriname }" width="250px"
							height="300px">
						<div class="swiper-text">
							${prodLike.cts_name }
							<div class="text_title">${prodLike.p_title }</div>
							<div class="like_view">
								<span class="like_icon"><svg width="8px" height="8px"
										viewBox="0 0 16 16" class="bi bi-heart-fill"
										fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
											d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                                        </svg></span> ${prodLike.l_count }
							</div>
							<div class="price">${prodLike.p_price }원</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</article>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>

</html>