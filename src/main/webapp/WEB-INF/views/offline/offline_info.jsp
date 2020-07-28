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
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/offline/offline_info.css" />
	
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/style.css" />

<title>오프라인 상세</title>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section>
		<div class="main-image">
			<div id="info-img1">
				<img id="img1" src="../../../resources/images/offline/1-3.jpg">
			</div>
			<div id="info-img2">
				<img id="img2" src="../../../resources/images/offline/1-2.jpg">
			</div>
			<div id="info-img3">
				<img id="img3" src="../../../resources/images/offline/1.jpg">
			</div>
		</div>

		<div class="info-wrap">
			<div class="all-info">
				<div class="info-l">
					<div class="text-info">
						<img src="../../../resources/images/offline/info-1.png">
						<div class="sinfo_ddate">
							<div class="sp_title">배송 일정</div>
							<div class="ddate">
								<div class="ddate_info1">
									<svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-patch-exclamation" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg"
										style="background-color: gainsboro; margin: 0px 5px;">
                                            <path
											d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
                                            <path fill-rule="evenodd"
											d="M10.273 2.513l-.921-.944.715-.698.622.637.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636a2.89 2.89 0 0 1 4.134 0l-.715.698a1.89 1.89 0 0 0-2.704 0l-.92.944-1.32-.016a1.89 1.89 0 0 0-1.911 1.912l.016 1.318-.944.921a1.89 1.89 0 0 0 0 2.704l.944.92-.016 1.32a1.89 1.89 0 0 0 1.912 1.911l1.318-.016.921.944a1.89 1.89 0 0 0 2.704 0l.92-.944 1.32.016a1.89 1.89 0 0 0 1.911-1.912l-.016-1.318.944-.921a1.89 1.89 0 0 0 0-2.704l-.944-.92.016-1.32a1.89 1.89 0 0 0-1.912-1.911l-1.318.016z" />
                                        </svg>
									알려드려요
									<div class="ddate_info2">배송 업체의 사정에 따라 2~7 영업일이 소요됩니다.</div>
								</div>
							</div>
						</div>
					</div>
					<div class="sinfo_refund">
						<div class="sp_title">환불 신청</div>
						<div class="refund">
							<div class="refund_info">
								<div class="refund_img">
									<img src="refund.png" width="30px" height="30px">
								</div>
								<div class="refund_info2">
									상품 개봉 및 훼손 없이, 배송 완료 후 <span>7일 이내</span>인 경우에만 환불이 가능합니다.
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="paymentSection">
					<div class="teacher_name">by.윤지</div>
					<div class="class_explain">기초를 빙자한 야매는 이제끝, 그림 공부의 원리부터
						배워봅시다.</div>
					<div class="lable_container">
						<div class="categories">
							<div class="cate_lable">미술</div>
						</div>
						<div class="class_startdate">9.23(수)부터 수강 가능</div>
					</div>
					<div class="class_price">
						<strong>45,000원</strong>
					</div>
					<div class="hr"></div>
					<div class="like_container">
						<div class="btn_div">
							<button type="button" class="likebtn unfilled_heart"
								color="default" fill="false" data-test-id="wishlist-button"
								data-test-group="sales-product-info-table-row">
								<div class="sc-fzqARJ eozcfK">
									<svg width="18" height="18" fill="none" viewBox="0 0 24 24">
                                            <path fill-rule="evenodd"
											clip-rule="evenodd"
											d="M20.5 9c0-2-1.5-3.9-3.7-3.9-2.3 0-3.8 1.63-4.8 3.33-1-1.7-2.5-3.33-4.8-3.33C5 5.1 3.5 6.867 3.5 9c0 4.62 4.949 7.667 8.5 9.623 3.551-1.956 8.5-5.003 8.5-9.623zm-19-.176C1.5 5.607 3.962 3 7 3c2.7 0 4 1 5 2.2C13 4 14.3 3 17 3c3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
											fill="#1b1c1d"></path></svg>
								</div>
								<span class="like_num"><span>267</span></span>
							</button>
							<button type="button" class="likebtn full_heart" color="default"
								fill="false">
								<div class="sc-fzqARJ eozcfK">
									<svg width="18" height="18" fill="none" viewBox="0 0 24 24">
                                            <path fill-rule="evenodd"
											clip-rule="evenodd"
											d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
											fill="#1b1c1d"></path></svg>
								</div>
								<span class="like_num"><span>535</span></span>
							</button>
						</div>
						<div class="btn_div">
							<button type="button" class="likebtn sharebtn" color="default"
								fill="false">
								<div class="sc-fzqARJ eozcfK">
									<svg width="18" height="18" fill="none" viewBox="0 0 24 24">
                                            <path fill-rule="evenodd"
											clip-rule="evenodd"
											d="M20 19v-7h2v8a1 1 0 01-1 1H3a1 1 0 01-1-1v-8h2v7h16zM13 5.829l3.586 3.587L18 8 12 2 6 8.001l1.414 1.415L11 5.829V16h2V5.83z"
											fill="#1b1c1d"></path></svg>
								</div>
								<span class="like_num">공유하기</span>
							</button>
						</div>
					</div>
					<button type="button" class="class_submitbtn" color="orange"
						fill="true"><a href="/offline_apply">
						<span class="sc-fzoyTs jZUSDr"> <span>클래스 신청하기</span></span></a>
					</button>
					<div>
						<p class="refund_alert">키트 미개봉 시, 9월 25일까지 전액 환불 보장</p>
					</div>
				</div>
				<div class="sc-pDbHj jvrfBM sc-pZCuu fVtWky show2">
					<div class="sc-oTaid fgxYOw" style="min-height: 0px;">
						<div class="sc-paWVw gzcrzB">
							<h3 class="sc-fzplWN rzudF sc-pjTqr jJFvBj">공유하기</h3>
							<button type="button"
								class="sc-fzqNqU fsyYOM sc-fzqPZZ bDLHXT closer"
								color="transparent">
								<span class="sc-fzoyTs jZUSDr"><svg width="24"
										height="24" fill="none" viewBox="0 0 24 24">
                                        <path
											d="M18.5 4L12 10.5 5.5 4 4 5.5l6.5 6.5L4 18.5 5.5 20l6.5-6.5 6.5 6.5 1.5-1.5-6.5-6.5L20 5.5 18.5 4z"
											fill="#1b1c1d"></path></svg></span>
							</button>
						</div>
						<div class="sc-qQlgh bJEPkb">
							<div class="ShareModalBottomSheet__Container-kk26a5-0 cSqgOv">
								<div class="ShareButton__Container-f3i5k7-0 llVJRo">
									<div class="ShareButton__Button-f3i5k7-1 ipUSgi">
										<svg width="24" height="24" viewBox="0 0 24 24">
											<path fill="#1B1C1D" fill-rule="evenodd"
												d="M12 4c-4.97 0-9 3.185-9 7.115 0 2.557 1.707 4.8 4.27 6.054-.188.702-.682 2.545-.78 2.94-.123.49.178.483.376.351.155-.103 2.466-1.675 3.464-2.353.541.08 1.1.123 1.67.123 4.97 0 9-3.186 9-7.115C21 7.185 16.97 4 12 4"></path></svg>
									</div>
								</div>
								<div class="ShareButton__Container-f3i5k7-0 llVJRo">
									<div class="ShareButton__Button-f3i5k7-1 gFdtJW">
										<svg viewBox="0 0 64 64" width="36" height="36">
											<g>
											<path fill="#FFF"
												d="M48,22.1c-1.2,0.5-2.4,0.9-3.8,1c1.4-0.8,2.4-2.1,2.9-3.6c-1.3,0.8-2.7,1.3-4.2,1.6 C41.7,19.8,40,19,38.2,19c-3.6,0-6.6,2.9-6.6,6.6c0,0.5,0.1,1,0.2,1.5c-5.5-0.3-10.3-2.9-13.5-6.9c-0.6,1-0.9,2.1-0.9,3.3 c0,2.3,1.2,4.3,2.9,5.5c-1.1,0-2.1-0.3-3-0.8c0,0,0,0.1,0,0.1c0,3.2,2.3,5.8,5.3,6.4c-0.6,0.1-1.1,0.2-1.7,0.2c-0.4,0-0.8,0-1.2-0.1 c0.8,2.6,3.3,4.5,6.1,4.6c-2.2,1.8-5.1,2.8-8.2,2.8c-0.5,0-1.1,0-1.6-0.1c2.9,1.9,6.4,2.9,10.1,2.9c12.1,0,18.7-10,18.7-18.7 c0-0.3,0-0.6,0-0.8C46,24.5,47.1,23.4,48,22.1z"></path></g></svg>
									</div>
								</div>
								<div class="ShareButton__Container-f3i5k7-0 llVJRo">
									<div class="ShareButton__Button-f3i5k7-1 jdAwxw">
										<svg width="24" height="24" viewBox="0 0 24 24">
											<path fill="#FFF" fill-rule="evenodd"
												d="M20.007 3H3.993A.993.993 0 003 3.993v16.014c0 .549.444.993.993.993h8.621v-6.97h-2.347v-2.716h2.347V9.308c0-2.324 1.42-3.589 3.494-3.589.994 0 1.848.072 2.096.106v2.43h-1.44c-1.125 0-1.344.54-1.344 1.327v1.733h2.689l-.349 2.722h-2.34V21h4.587a.993.993 0 00.993-.993V3.993A.993.993 0 0020.007 3"></path></svg>
									</div>
								</div>
								<div class="ShareButton__Container-f3i5k7-0 llVJRo">
									<div class="ShareButton__LinkButton-f3i5k7-2 dYmVXl">
										<svg width="20" height="20" fill="none" viewBox="0 0 24 24">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M14 8a1 1 0 011-1h3a5 5 0 010 10h-3a1 1 0 110-2h3a3 3 0 100-6h-3a1 1 0 01-1-1zm-4 8a1 1 0 01-1 1H6A5 5 0 016 7h3a1 1 0 010 2H6a3 3 0 100 6h3a1 1 0 011 1zm-3-4a1 1 0 011-1h8a1 1 0 110 2H8a1 1 0 01-1-1z"
												fill="#1B1C1D"></path></svg>
										<span class="ShareButton__LinkText-f3i5k7-3 gcriev">링크
											복사하기</span>
									</div>
								</div>
							</div>
						</div>
						<div class="sc-pAYXY fmggLq"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('.show2').hide(); //페이지를 로드할 때 숨길 요소
		$('.full_heart').hide();

		$('.sharebtn').click(function() {
			$('.show2').show(); //클릭 시 두 번째 요소 표시
			return false;
		});

		$('.unfilled_heart').click(function() {
			$('.unfilled_heart').hide();
			$('.full_heart').show();
		});

		$('.full_heart').click(function() {
			$('.full_heart').hide();
			$('.unfilled_heart').show();
		});

		$('.closer').click(function() {
			$('.show2').hide();
			return false;
		});
	});
</script>
</html>