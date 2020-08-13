<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	$(document).ready(function() {
		function gohome() {
			var id = '${mb.m_email}';

			if (id == '') {
				location.href = './';
			} else if (id != '') {
				location.href = './list';
			}
		}

		var swiper1 = new Swiper('.swc1', {
			slidesPerView : 3,
			spaceBetween : 5,
			slidesPerGroup : 3,
			loop : false,
			loopFillGroupWithBlank : true,
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			}
		});

		var swiper = new Swiper('.swc2', {
			slidesPerView : 4,
			spaceBetween : 5,
			slidesPerGroup : 4,
			loop : false,
			loopFillGroupWithBlank : true,
			pagination : {
				el : '.swiper-pagination'
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
					<li><a href="store">전체보기</a></li>
					<li><a href="store_cts">아트/공예</a></li>
					<li>전자제품</li>
					<li>건강/헬스/뷰티</li>
					<li>음악/악기</li>
					<li>요리/주방</li>
				</ul>
			</div>
		</div>
		<article class="childart1">
			<h1>상품 top10</h1>
			<!-- Swiper -->
			<div class="swiper-container swc1" id="swc1" style="width: 1100px;">
				<div class="swiper-wrapper">
					<c:forEach var="pitem" items="${productList}">
						<div class="swiper-slide">
							<div class="swiper_img">
								<img src="resources/upload/${pitem.f_sysname}"
									width="250px" height="300px">
							</div>
							<div class="swiper-text">
								${pitem.cts_name}
								<div class="text_title">${pitem.p_title}</div>
								<div class="like_view">
									<span class="like_icon"><svg width="8px" height="8px"
											viewBox="0 0 16 16" class="bi bi-heart-fill"
											fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
												d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span>${pitem.l_count}
								</div>
								<div class="price"><fmt:formatNumber pattern="###,###,###" value="${pitem.p_price}" />원</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</article>

		<div>
			<article class="childart1">
				<h1>아트/공예</h1>
				<!-- Swiper -->
				<div class="swiper-container swc2" id="swc2" style="width: 1100px;">
					<div class="swiper-wrapper">
						<c:forEach var="paitem" items="${pArtList}">
							<div class="swiper-slide">
								<div class="swiper_img" style="margin-left: 0px;">
									<img src="resources/upload/${paitem.f_sysname}" width="250px"
										height="300px">
								</div>
								<div class="swiper-text" style="padding-left: 0px;">
									${paitem.cts_name}
									<div class="text_title">${paitem.p_title}</div>
									<div class="like_view">
										<span class="like_icon"><svg width="8px" height="8px"
												viewBox="0 0 16 16" class="bi bi-heart-fill"
												fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd"
													d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                    </svg></span> ${paitem.l_count}
									</div>
									<div class="price"><fmt:formatNumber pattern="###,###,###" value="${paitem.p_price}" />원</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</article>
		</div>
		
		<div>
			<article class="childart1">
				<h1>전자제품</h1>
				<!-- Swiper -->
				<div class="swiper-container swc2" id="swc2" style="width: 1100px;">
					<div class="swiper-wrapper">
						<c:forEach var="pbitem" items="${pEleList}">
							<div class="swiper-slide">
								<div class="swiper_img" style="margin-left: 0px;">
									<img src="resources/upload/${pbitem.f_sysname}" width="250px"
										height="300px">
								</div>
								<div class="swiper-text" style="padding-left: 0px;">
									${pbitem.cts_name}
									<div class="text_title">${pbitem.p_title}</div>
									<div class="like_view">
										<span class="like_icon"><svg width="8px" height="8px"
												viewBox="0 0 16 16" class="bi bi-heart-fill"
												fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd"
													d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                    </svg></span> ${pbitem.l_count}
									</div>
									<div class="price"><fmt:formatNumber pattern="###,###,###" value="${pbitem.p_price }" />원</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</article>
		</div>
		
		<div>
			<article class="childart1">
				<h1>건강/헬스/뷰티</h1>
				<!-- Swiper -->
				<div class="swiper-container swc2" id="swc2" style="width: 1100px;">
					<div class="swiper-wrapper">
						<c:forEach var="pcitem" items="${pHList}">
							<div class="swiper-slide">
								<div class="swiper_img" style="margin-left: 0px;">
									<img src="resources/upload/${pcitem.f_sysname}" width="250px"
										height="300px">
								</div>
								<div class="swiper-text" style="padding-left: 0px;">
									${pcitem.cts_name}
									<div class="text_title">${pcitem.p_title}</div>
									<div class="like_view">
										<span class="like_icon"><svg width="8px" height="8px"
												viewBox="0 0 16 16" class="bi bi-heart-fill"
												fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd"
													d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                    </svg></span> ${pcitem.l_count}
									</div>
									<div class="price"><fmt:formatNumber pattern="###,###,###" value="${pcitem.p_price }" />원</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</article>
		</div>
		
		<div>
			<article class="childart1">
				<h1>음악/악기</h1>
				<!-- Swiper -->
				<div class="swiper-container swc2" id="swc2" style="width: 1100px;">
					<div class="swiper-wrapper">
						<c:forEach var="pditem" items="${pMusicList}">
						<div class="swiper-slide">
								<div class="swiper_img" style="margin-left: 0px;">
									<img src="resources/upload/${pditem.f_sysname}" width="250px"
										height="300px">
								</div>
								<div class="swiper-text" style="padding-left: 0px;">
									${pditem.cts_name}
									<div class="text_title">${pditem.p_title}</div>
									<div class="like_view">
										<span class="like_icon"><svg width="8px" height="8px"
												viewBox="0 0 16 16" class="bi bi-heart-fill"
												fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd"
													d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                    </svg></span> ${pditem.l_count}
									</div>
									<div class="price"><fmt:formatNumber pattern="###,###,###" value="${pditem.p_price }" />원</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</article>
		</div>
		<div>
			<article class="childart1">
				<h1>푸드/키친</h1>
				<!-- Swiper -->
				<div class="swiper-container swc2" id="swc2" style="width: 1100px;">
					<div class="swiper-wrapper">
						<c:forEach var="peitem" items="${pFoodList}">
							<div class="swiper-slide">
								<div class="swiper_img" style="margin-left: 0px;">
									<img src="resources/upload/${peitem.f_sysname}" width="250px"
										height="300px">
								</div>
								<div class="swiper-text" style="padding-left: 0px;">
									${peitem.cts_name}
									<div class="text_title">${peitem.p_title}</div>
									<div class="like_view">
										<span class="like_icon"><svg width="8px" height="8px"
												viewBox="0 0 16 16" class="bi bi-heart-fill"
												fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd"
													d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                    </svg></span> ${peitem.l_count}
									</div>
									<div class="price"><fmt:formatNumber pattern="###,###,###" value="${peitem.p_price }" />원</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</article>
		</div>
	</section>

	<footer><jsp:include page="../footer.jsp"></jsp:include></footer>
</body>
</html>