<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/store.css">
<title>Insert title here</title>
<script>
  $(document).ready(function(){
    function gohome() {
      var id = '${mb.m_id}';

      if (id == '') {
        location.href = './';
      }
      else if (id != '') {
        location.href = './list';
      }
    }

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

      var swiper = new Swiper('.swc2', {
          slidesPerView: 4,
          spaceBetween: 5,
          slidesPerGroup: 4,
          loop: false,
          loopFillGroupWithBlank: true,
          pagination: {
            el: '.swiper-pagination'
          }
        });
  });
    
      
  </script>
</head>
<body>
	<header><jsp:include page="../header.jsp"></jsp:include></header>
	<article style="background-color: #E1E1E1; border: 1px solid #e1e1e1;">
		<img class=storeIMG src="resources/images/storeimg/10.PNG">
	</article>
	<section>
		<div id=p_cts>
			<div class=p_cts_menu>
				<ul class=p_cts_ul>
					<li><a href="store.jsp">전체보기</a></1i>
					<li><a href="store_cts.jsp">아트</a></li>
					<li>전자제품</li>
					<li>건강/헬스</li>
					<li>음악악기</li>
					<li>푸드/키친</li>
				</ul>
			</div>
		</div>
		<article class="childart1">
			<h1>상품 top10</h1>
			<!-- Swiper -->
			<div class="swiper-container swc1" id="swc1" style="width: 1100px;">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="swiper_img">
							<img src="resources/images/storeimg/1.PNG" width="250px"
								height="300px">
						</div>
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
					<div class="swiper-slide">
						<div class="swiper_img">
							<img src="resources/images/storeimg/2.PNG" width="250px"
								height="300px">
						</div>
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
					<div class="swiper-slide">
						<div class="swiper_img">
							<img src="resources/images/storeimg/3.PNG" width="250px"
								height="300px">
						</div>
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
					<div class="swiper-slide">
						<div class="swiper_img">
							<img src="resources/images/storeimg/4.PNG" width="250px"
								height="300px">
						</div>
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
					<div class="swiper-slide">
						<div class="swiper_img">
							<img src="resources/images/storeimg/5.PNG" width="250px"
								height="300px">
						</div>
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
					<div class="swiper-slide">
						<div class="swiper_img">
							<img src="resources/images/storeimg/6.PNG" width="250px"
								height="300px">
						</div>
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
					<div class="swiper-slide">
						<div class="swiper_img">
							<img src="resources/images/storeimg/3.PNG" width="250px"
								height="300px">
						</div>
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
					<div class="swiper-slide">
						<div class="swiper_img">
							<img src="resources/images/storeimg/6.PNG" width="250px"
								height="300px">
						</div>
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
					<div class="swiper-slide">
						<div class="swiper_img">
							<img src="resources/images/storeimg/5.PNG" width="250px"
								height="300px">
						</div>
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
					<div class="swiper-slide">
						<div class="swiper_img">
							<img src="resources/images/storeimg/4.PNG" width="250px"
								height="300px">
						</div>
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
				</div>
				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</article>
		</div>
		<div>
			<article class="childart1">
				<h1>아트</h1>
				<!-- Swiper -->
				<div class="swiper-container swc2" id="swc2" style="width: 1100px;">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/7.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/5.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img
									src="resources/images/storeimg/1.PNG"
									width="250px" height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/3.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/2.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/6.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/5.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img
									src="resources/images/storeimg/1.PNG"
									width="250px" height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								</di>
								<img src="resources/images/storeimg/2.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/3.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
					</div>
					<!-- Add Arrows -->
					<!-- <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div> -->
				</div>
			</article>
		</div>
		<div>
			<article class="childart1">
				<h1>아트</h1>
				<!-- Swiper -->
				<div class="swiper-container swc2" id="swc2" style="width: 1100px;">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/7.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/5.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img
									src="resources/images/storeimg/1.PNG"
									width="250px" height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/3.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/2.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/6.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/5.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/1.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								</di>
								<img src="resources/images/storeimg/2.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/3.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
					</div>
					<!-- Add Arrows -->
					<!-- <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div> -->
				</div>
			</article>
		</div>
		<div>
			<article class="childart1">
				<h1>아트</h1>
				<!-- Swiper -->
				<div class="swiper-container swc2" id="swc2" style="width: 1100px;">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/7.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/5.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/1.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/3.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/2.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/6.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/5.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/1.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								</di>
								<img src="resources/images/storeimg/2.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/3.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
					</div>
					<!-- Add Arrows -->
					<!-- <div class="swiper-button-next"></div>
              <div class="swiper-button-prev"></div> -->
				</div>
			</article>
		</div>
		<div>
			<article class="childart1">
				<h1>아트</h1>
				<!-- Swiper -->
				<div class="swiper-container swc2" id="swc" style="width: 1100px;">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/7.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/5.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/1.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/3.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/2.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/6.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/5.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/1.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								</di>
								<img src="resources/images/storeimg/2.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/3.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
					</div>
					<!-- Add Arrows -->
					<!-- <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div> -->
				</div>
			</article>
		</div>
		<div>
			<article class="childart1">
				<h1>아트</h1>
				<!-- Swiper -->
				<div class="swiper-container swc2" id="swc" style="width: 1100px;">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/7.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/5.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/1.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/3.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/2.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/6.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/5.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/1.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								</di>
								<img src="resources/images/storeimg/2.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
						<div class="swiper-slide">
							<div class="swiper_img" style="margin-left: 0px;">
								<img src="resources/images/storeimg/3.PNG" width="250px"
									height="300px">
							</div>
							<div class="swiper-text" style="padding-left: 0px;">
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
					</div>
					<!-- Add Arrows -->
					<!-- <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div> -->
				</div>
			</article>
		</div>
	</section>

	<footer><jsp:include page="../footer.jsp"></jsp:include></footer>
</body>
</html>