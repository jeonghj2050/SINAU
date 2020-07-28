<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>오프라인 메인</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/offline/offline_main.css" />

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/offline/CSSreset.min.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/offline/als_demo1.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/style.css" />
<meta name="robots" content="index,follow" />
<meta name="keywords"
	content="jQuery plugin, jQuery scroller, list jQuery, jQuery lists, css3, html5, jQuery" />
<meta name="description"
	content="any list scroller demo - jQuery scrolling plugin by musings.it to scroll any kind of list with any content - musings.it web design and development - Bergamo Italy" />
<meta name="author" content="Federica Sibella - musings.it" />
<meta name="geo.placename"
	content="via Generale Alberico Albricci 1, 24128 Bergamo, Italy">
<script type="text/javascript"
	src="../../../resources/js/offline/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="../../../resources/js/offline/jquery.alsEN-1.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#lista1").als({
			visible_items : 3,
			scrolling_items : 1,
			orientation : "horizontal",
			circular : "yes",
			autoscroll : "no",
			interval : 5000,
			direction : "right"
		});
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section>
		<div class="main-image">
			<div id="main-image"></div>
		</div>
		<article class="content">
			<div class="nav">
				<li id="off-all"><a href="/offline">전체보기</a></li>
				<li id="off1"><a href="/offline_cate1">공예</a></li>
				<li id="off2">미술</li>
				<li id="off3">디지털드로잉</li>
				<li id="off4">요리</li>
				<li id="off5">운동</li>
			</div>
			<article class="childart">
				<article class="child1">
					<div class="blank"></div>
					<h1>지금, 인기 TOP10</h1>
					<div id="lista1" class="als-container">
						<span class="als-prev"><img
							src="../../../resources/images/offline/thin_left_arrow_333.png"
							alt="prev" title="previous" /></span>
						<div class="als-viewport">
							<ul class="als-wrapper">

								<c:forEach var="off" items="${offList}">
									<li class="als-item"><a href="./offline_info">
											<div class="s_sumnail">
												<div class="s_class_img">
													<img
														src="resources/images/offline/${off.f_oriname}">
												</div>
												<div class="s_sumnail-txt">
													<div class="s_sumnail-txt-top">
														<div id="s_sub-cate">${off.ofc_cts_name}</div>
														<div id="s_not">ㆍ&nbsp;</div>
														<div id="s_creator-name">${off.ofc_teacher}</div>
													</div>
													<div id="s_online-name">${off.ofc_title}</div>
													<div id="s_class_likes">
														<svg width="15" height="15" fill="none"
															viewBox="0 0 24 18">
                                                                <path
																fill-rule="evenodd" clip-rule="evenodd"
																d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
																fill="#bdc2c6"></path></svg>
													</div>
													<div id="s_class_likes">${off.l_count}</div>
													<div id="s_hr"></div>
													<div id="s_online-price">${off.ofc_sale} 원</div>
												</div>
											</div>
									</a></li>
								</c:forEach>
								<li class="als-item">
									<div class="s_sumnail">
										<div class="s_class_img">
											<img src="../../../resources/images/offline/1.jpg">
										</div>
										<div class="s_sumnail-txt">
											<div class="s_sumnail-txt-top">
												<div id="s_sub-cate">공d예</div>
												<div id="s_not">ㆍ&nbsp;</div>
												<div id="s_creator-name">김지안</div>
											</div>
											<div id="s_online-name">시들지않는 생화, 특별한 플라워 리스 만들고 꽃과 함께
												인생샷 남기기</div>
											<div id="s_class_likes">
												<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                                                <path
														fill-rule="evenodd" clip-rule="evenodd"
														d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
														fill="#bdc2c6"></path></svg>
											</div>
											<div id="s_class_likes">2394</div>
											<div id="s_hr"></div>
											<div id="s_online-price">40,000원</div>
										</div>
									</div>
								</li>
								<li class="als-item">
									<div class="s_sumnail">
										<div class="s_class_img">
											<img src="../../../resources/images/offline/1.jpg">
										</div>
										<div class="s_sumnail-txt">
											<div class="s_sumnail-txt-top">
												<div id="s_sub-cate">공예</div>
												<div id="s_not">ㆍ&nbsp;</div>
												<div id="s_creator-name">김지안</div>
											</div>
											<div id="s_online-name">시들지않는 생화, 특별한 플라워 리스 만들고 꽃과 함께
												인생샷 남기기</div>
											<div id="s_class_likes">
												<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                                                <path
														fill-rule="evenodd" clip-rule="evenodd"
														d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
														fill="#bdc2c6"></path></svg>
											</div>
											<div id="s_class_likes">2394</div>
											<div id="s_hr"></div>
											<div id="s_online-price">40,000원</div>
										</div>
									</div>
								</li>
								<!-- <li class="als-item">
									<div class="s_sumnail">
										<div class="s_class_img">
											<img src="../../../resources/images/offline/1.jpg">
										</div>
										<div class="s_sumnail-txt">
											<div class="s_sumnail-txt-top">
												<div id="s_sub-cate">공예</div>
												<div id="s_not">ㆍ&nbsp;</div>
												<div id="s_creator-name">김지안</div>
											</div>
											<div id="s_online-name">시들지않는 생화, 특별한 플라워 리스 만들고 꽃과 함께
												인생샷 남기기</div>
											<div id="s_class_likes">
												<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                                                <path
														fill-rule="evenodd" clip-rule="evenodd"
														d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
														fill="#bdc2c6"></path></svg>
											</div>
											<div id="s_class_likes">2394</div>
											<div id="s_hr"></div>
											<div id="s_online-price">40,000원</div>
										</div>
									</div>
								</li>
								<li class="als-item">
									<div class="s_sumnail">
										<div class="s_class_img">
											<img src="../../../resources/images/offline/1.jpg">
										</div>
										<div class="s_sumnail-txt">
											<div class="s_sumnail-txt-top">
												<div id="s_sub-cate">공예</div>
												<div id="s_not">ㆍ&nbsp;</div>
												<div id="s_creator-name">김지안</div>
											</div>
											<div id="s_online-name">시들지않는 생화, 특별한 플라워 리스 만들고 꽃과 함께
												인생샷 남기기</div>
											<div id="s_class_likes">
												<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                                                <path
														fill-rule="evenodd" clip-rule="evenodd"
														d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
														fill="#bdc2c6"></path></svg>
											</div>
											<div id="s_class_likes">2394</div>
											<div id="s_hr"></div>
											<div id="s_online-price">40,000원</div>
										</div>
									</div>
								</li>
								<li class="als-item">
									<div class="s_sumnail">
										<div class="s_class_img">
											<img src="../../../resources/images/offline/1.jpg">
										</div>
										<div class="s_sumnail-txt">
											<div class="s_sumnail-txt-top">
												<div id="s_sub-cate">공예</div>
												<div id="s_not">ㆍ&nbsp;</div>
												<div id="s_creator-name">김지안</div>
											</div>
											<div id="s_online-name">시들지않는 생화, 특별한 플라워 리스 만들고 꽃과 함께
												인생샷 남기기</div>
											<div id="s_class_likes">
												<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                                                <path
														fill-rule="evenodd" clip-rule="evenodd"
														d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
														fill="#bdc2c6"></path></svg>
											</div>
											<div id="s_class_likes">2394</div>
											<div id="s_hr"></div>
											<div id="s_online-price">40,000원</div>
										</div>
									</div>
								</li>
								<li class="als-item">
									<div class="s_sumnail">
										<div class="s_class_img">
											<img src="../../../resources/images/offline/1.jpg">
										</div>
										<div class="s_sumnail-txt">
											<div class="s_sumnail-txt-top">
												<div id="s_sub-cate">공예</div>
												<div id="s_not">ㆍ&nbsp;</div>
												<div id="s_creator-name">김지안</div>
											</div>
											<div id="s_online-name">시들지않는 생화, 특별한 플라워 리스 만들고 꽃과 함께
												인생샷 남기기</div>
											<div id="s_class_likes">
												<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                                                <path
														fill-rule="evenodd" clip-rule="evenodd"
														d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
														fill="#bdc2c6"></path></svg>
											</div>
											<div id="s_class_likes">2394</div>
											<div id="s_hr"></div>
											<div id="s_online-price">40,000원</div>
										</div>
									</div>
								</li>
								<li class="als-item">
									<div class="s_sumnail">
										<div class="s_class_img">
											<img src="../../../resources/images/offline/1.jpg"">
										</div>
										<div class="s_sumnail-txt">
											<div class="s_sumnail-txt-top">
												<div id="s_sub-cate">공예</div>
												<div id="s_not">ㆍ&nbsp;</div>
												<div id="s_creator-name">김지안</div>
											</div>
											<div id="s_online-name">시들지않는 생화, 특별한 플라워 리스 만들고 꽃과 함께
												인생샷 남기기</div>
											<div id="s_class_likes">
												<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                                                <path
														fill-rule="evenodd" clip-rule="evenodd"
														d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
														fill="#bdc2c6"></path></svg>
											</div>
											<div id="s_class_likes">2394</div>
											<div id="s_hr"></div>
											<div id="s_online-price">40,000원</div>
										</div>
									</div>
								</li>
								<li class="als-item">
									<div class="s_sumnail">
										<div class="s_class_img">
											<img src="images/1.jpg">
										</div>
										<div class="s_sumnail-txt">
											<div class="s_sumnail-txt-top">
												<div id="s_sub-cate">공예</div>
												<div id="s_not">ㆍ&nbsp;</div>
												<div id="s_creator-name">김지안</div>
											</div>
											<div id="s_online-name">시들지않는 생화, 특별한 플라워 리스 만들고 꽃과 함께
												인생샷 남기기</div>
											<div id="s_class_likes">
												<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                                                <path
														fill-rule="evenodd" clip-rule="evenodd"
														d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
														fill="#bdc2c6"></path></svg>
											</div>
											<div id="s_class_likes">2394</div>
											<div id="s_hr"></div>
											<div id="s_online-price">40,000원</div>
										</div>
									</div>
								</li> -->
							</ul>
						</div>
						<span class="als-next"><img
							src="../../../resources/images/offline/thin_right_arrow_333.png"
							alt="next" title="next" /></span>
					</div>
				</article>

				<article class="child2">
					<div class="blank"></div>
					<h1>최근 업데이트 클래스</h1>
					<h5>크리에이터가 최근 등록한 클래스예요.</h5>
					<div id="new">
						<div>
							<div class="class_img">
								<img src="../../../resources/images/offline/4.jpg" alt="">
							</div>
							<article class="on-info1">
								<li id="sub-cate">미술</li>
								<li>ㆍ</li>
								<li id="creator-name">도로시</li> <br> <br>
								<div id="online-name">원데이 안산) '레진공예'로 세상에 하나뿐인 나만의 작품 만들기
									-도로시팩토리</div>
								<div id="class_likes">
									<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd"
											clip-rule="evenodd"
											d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
											fill="#bdc2c6"></path></svg>
								</div>
								<div id="class_likes">2394</div>
								<div id="hr"></div>
								<div id="online-price">20,000원</div>
							</article>
						</div>
						<div>
							<div class="class_img">
								<img src="../../../resources/images/offline/5.jpg" alt="">
							</div>
							<article class="on-info1">
								<li id="sub-cate">공예</li>
								<li>ㆍ</li>
								<li id="creator-name">윤정은</li> <br> <br>
								<div id="online-name">♥레진공예 [취미반]♥핸드메이드/악세사리/금손 되기 프로젝트♪</div>
								<div id="class_likes">
									<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd"
											clip-rule="evenodd"
											d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
											fill="#bdc2c6"></path></svg>
								</div>
								<div id="class_likes">2394</div>
								<div id="hr"></div>
								<div id="online-price">150,000원</div>
							</article>
						</div>
						<div>
							<div class="class_img">
								<img src="../../../resources/images/offline/6.jpg" alt="">
							</div>
							<article class="on-info1">
								<li id="sub-cate">공예</li>
								<li>ㆍ</li>
								<li id="creator-name">금소니</li> <br> <br>
								<div id="online-name">세상에 단하나뿐인 나만의 비즈반지 만들기</div>
								<div id="class_likes">
									<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd"
											clip-rule="evenodd"
											d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
											fill="#bdc2c6"></path></svg>
								</div>
								<div id="class_likes">2394</div>
								<div id="hr"></div>
								<div id="online-price">14,000원</div>
							</article>
						</div>
						<div>
							<div class="class_img">
								<img src="../../../resources/images/offline/7.jpg" alt="">
							</div>
							<article class="on-info1">
								<li id="sub-cate">공예</li>
								<li>ㆍ</li>
								<li id="creator-name">허주연</li> <br> <br>
								<div id="online-name">[손끝으로 느끼는 자연의 결★] '한지 손거울' 만들기</div>
								<div id="class_likes">
									<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd"
											clip-rule="evenodd"
											d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
											fill="#bdc2c6"></path></svg>
								</div>
								<div id="class_likes">2394</div>
								<div id="hr"></div>
								<div id="online-price">38,000원</div>
							</article>
						</div>
						<div>
							<div class="class_img">
								<img src="../../../resources/images/offline/6.jpg" alt="">
							</div>
							<article class="on-info1">
								<li id="sub-cate">공예</li>
								<li>ㆍ</li>
								<li id="creator-name">금소니</li> <br> <br>
								<div id="online-name">세상에 단하나뿐인 나만의 비즈반지 만들기</div>
								<div id="class_likes">
									<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd"
											clip-rule="evenodd"
											d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
											fill="#bdc2c6"></path></svg>
								</div>
								<div id="class_likes">2394</div>
								<div id="hr"></div>
								<div id="online-price">14,000원</div>
							</article>
						</div>
						<div>
							<div class="class_img">
								<img src="../../../resources/images/offline/7.jpg" alt="">
							</div>
							<article class="on-info1">
								<li id="sub-cate">공예</li>
								<li>ㆍ</li>
								<li id="creator-name">허주연</li> <br> <br>
								<div id="online-name">[손끝으로 느끼는 자연의 결★] '한지 손거울' 만들기</div>
								<div id="class_likes">
									<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd"
											clip-rule="evenodd"
											d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
											fill="#bdc2c6"></path></svg>
								</div>
								<div id="class_likes">2394</div>
								<div id="hr"></div>
								<div id="online-price">38,000원</div>
							</article>
						</div>
						<div>
							<div class="class_img">
								<img src="../../../resources/images/offline/6.jpg" alt="">
							</div>
							<article class="on-info1">
								<li id="sub-cate">공예</li>
								<li>ㆍ</li>
								<li id="creator-name">금소니</li> <br> <br>
								<div id="online-name">세상에 단하나뿐인 나만의 비즈반지 만들기</div>
								<div id="class_likes">
									<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd"
											clip-rule="evenodd"
											d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
											fill="#bdc2c6"></path></svg>
								</div>
								<div id="class_likes">2394</div>
								<div id="hr"></div>
								<div id="online-price">14,000원</div>
							</article>
						</div>
						<div>
							<div class="class_img">
								<img src="../../../resources/images/offline/7.jpg" alt="">
							</div>
							<article class="on-info1">
								<li id="sub-cate">공예</li>
								<li>ㆍ</li>
								<li id="creator-name">허주연</li> <br> <br>
								<div id="online-name">[손끝으로 느끼는 자연의 결★] '한지 손거울' 만들기</div>
								<div id="class_likes">
									<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd"
											clip-rule="evenodd"
											d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
											fill="#bdc2c6"></path></svg>
								</div>
								<div id="class_likes">2394</div>
								<div id="hr"></div>
								<div id="online-price">38,000원</div>
							</article>
						</div>
					</div>
				</article>
			</article>
		</article>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>