<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/home.css?a">
	<link rel="stylesheet" href="resources/css/online.css?ver=1.6">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>크리에이터 메인화면</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('.tab-content').hide();
			$('.current').show();
			$('.cate_container a:first-child').addClass('on')
			$('.cate_container a').click(function () {
				$('.cate_container a').removeClass('on')
				$(this).addClass('on')
				var tab_id = $(this).attr('data-tab');
				$('.tab-content').hide();

				$('.cate_container a').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
				$('.current').show();
			})
		})

	</script>
</head>

<body>
	<!-- 헤더 상민이꺼 jsp 불러오기 -->
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section>
		<article>
			<img id="main_img" src="resources/upload/online_main.PNG"
				width="100%" height="350px">
		</article>
		<div class="wrap">
			<!-- 카테고리바 섹션 -->
			<span class="cate">
				<div class="cate_container">
					<c:set var="tabNum" value="1"/>
					<a class="category tab-link current" data-tab="tab-${tabNum}" id="t${tabNum}">전체보기</a>
					<c:forEach var="cate" items="${cateList}">
						<c:set var="tabNum" value="${tabNum + 1}"/>
						<a class="category tab-link" data-tab="tab-${tabNum}" id="t${tabNum}">${cate.cts_name}</a>
					</c:forEach>
				</div>
			</span>
			<!-- 클래스 섬네일 카드 섹션 (탭으로 구분됨)-->
			<div id="tab-1" class="tab-content current">
				<span class="sumnail">
					<div class="row topList">
						<div class="blank"></div>
						<h1>지금, 인기 TOP10</h1>
						<c:forEach var="on" items="${top10list}" begin="0" end="9">
							<a class="atag_sum" href="./onlineInfo?onc_code=${on.onc_code}">
								<div class="sumnail_box">
									<div class="class_img_div">
										<img class="class_img"
											src="resources/upload/${on.f_sysname}">
									</div>
									<div>
										<div class="categories">${on.cts_name}</div>
										<span>・</span>
										<div class="teacher_name">${on.onc_teacher}</div>
									</div>
									<div class="class_explain">${on.onc_title}</div>
									<div class="class_likes">
										<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
												fill="#bdc2c6"></path>
										</svg>
									</div>
									<div class="class_likes">${on.l_count}</div>
									<div class="hr"></div>
									<div class="class_price">
										<strong> <fmt:formatNumber value="${on.onc_sale}"
												pattern="#,###" />원
										</strong>
									</div>
									<div class="class_bottom">
										<div class="class_startdate">
											<fmt:formatDate value="${on.onc_sdate}" pattern="yyyy.MM.dd" />
											부터 수강 가능
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
						<button type="button" class="next_btn" color="transparent">
							<span class="next_btn_span"> <svg width="24" height="24"
									fill="none" viewBox="0 0 24 24">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M8.5 18.5l6-6.5-6-6.5L10 4l7.5 8-7.5 8-1.5-1.5z"
										fill="#1b1c1d"></path>
								</svg></span>
						</button>
					</div>
					<div class="row">
						<div class="blank"></div>
						<h1>최근 업데이트 클래스</h1>
						<h5>크리에이터가 최근 등록한 클래스예요.</h5>
						<c:forEach var="on" items="${onList}" begin="0" end="11">
							<a class="atag_sum" href="./onlineInfo?onc_code=${on.onc_code}">
								<div class="sumnail_box">
									<div class="class_img_div">
										<img class="class_img"
											src="resources/upload/${on.f_sysname }">
									</div>
									<div>
										<div class="categories">${on.cts_name}</div>
										<span>・</span>
										<div class="teacher_name">${on.onc_teacher}</div>
									</div>
									<div class="class_explain">${on.onc_title}</div>
									<div class="class_likes">
										<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
												fill="#bdc2c6"></path>
										</svg>
									</div>
									<div class="class_likes">${on.l_count}</div>
									<div class="hr"></div>
									<div class="class_price">
										<strong> <fmt:formatNumber value="${on.onc_sale}"
												pattern="#,###" />원
										</strong>
									</div>
									<div class="class_bottom">
										<div class="class_startdate">
											<fmt:formatDate value="${on.onc_sdate}" pattern="yyyy.MM.dd" />
											부터 수강 가능
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
				</span>
			</div>
			<div id="tab-2" class="tab-content">
				<span class="sumnail">
					<div class="row">
						<div class="blank"></div>
						<h1>미술</h1>
						<h3 class="allClass">전체 클래스</h3>
						<c:forEach var="on" items="${onListCa}" begin="0" end="11">
							<a class="atag_sum" href="./onlineInfo?onc_code=${on.onc_code}">
								<div class="sumnail_box">
									<div class="class_img_div">
										<img class="class_img"
											src="resources/upload/${on.f_sysname }">
									</div>
									<div>
										<div class="categories">${on.cts_name}</div>
										<span>・</span>
										<div class="teacher_name">${on.onc_teacher}</div>
									</div>
									<div class="class_explain">${on.onc_title}</div>
									<div class="class_likes">
										<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
												fill="#bdc2c6"></path>
										</svg>
									</div>
									<div class="class_likes">${on.l_count}</div>
									<div class="hr"></div>
									<div class="class_price">
										<strong> <fmt:formatNumber value="${on.onc_sale}"
												pattern="#,###" />원
										</strong>
									</div>
									<div class="class_bottom">
										<div class="class_startdate">
											<fmt:formatDate value="${on.onc_sdate}" pattern="yyyy.MM.dd" />
											부터 수강 가능
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
				</span>
			</div>
			<div id="tab-3" class="tab-content">
				<span class="sumnail">
					<div class="row">
						<div class="blank"></div>
						<h1>공예</h1>
						<h3 class="allClass">전체 클래스</h3>
						<c:forEach var="on" items="${onListCb}">
							<a class="atag_sum" href="./onlineInfo?onc_code=${on.onc_code}">
								<div class="sumnail_box">
									<div class="class_img_div">
										<img class="class_img"
											src="resources/upload/${on.f_sysname }">
									</div>
									<div>
										<div class="categories">${on.cts_name}</div>
										<span>・</span>
										<div class="teacher_name">${on.onc_teacher}</div>
									</div>
									<div class="class_explain">${on.onc_title}</div>
									<div class="class_likes">
										<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
												fill="#bdc2c6"></path>
										</svg>
									</div>
									<div class="class_likes">${on.l_count}</div>
									<div class="hr"></div>
									<div class="class_price">
										<strong> <fmt:formatNumber value="${on.onc_sale}"
												pattern="#,###" />원
										</strong>
									</div>
									<div class="class_bottom">
										<div class="class_startdate">
											<fmt:formatDate value="${on.onc_sdate}" pattern="yyyy.MM.dd" />
											부터 수강 가능
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
				</span>
			</div>
			<div id="tab-4" class="tab-content">
				<span class="sumnail">
					<div class="row">
						<div class="blank"></div>
						<h1>디지털 드로잉</h1>
						<h3 class="allClass">전체 클래스</h3>
						<c:forEach var="on" items="${onListCc}">
							<a class="atag_sum" href="./onlineInfo?onc_code=${on.onc_code}">
								<div class="sumnail_box">
									<div class="class_img_div">
										<img class="class_img"
											src="resources/upload/${on.f_sysname }">
									</div>
									<div>
										<div class="categories">${on.cts_name}</div>
										<span>・</span>
										<div class="teacher_name">${on.onc_teacher}</div>
									</div>
									<div class="class_explain">${on.onc_title}</div>
									<div class="class_likes">
										<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
												fill="#bdc2c6"></path>
										</svg>
									</div>
									<div class="class_likes">${on.l_count}</div>
									<div class="hr"></div>
									<div class="class_price">
										<strong> <fmt:formatNumber value="${on.onc_sale}"
												pattern="#,###" />원
										</strong>
									</div>
									<div class="class_bottom">
										<div class="class_startdate">
											<fmt:formatDate value="${on.onc_sdate}" pattern="yyyy.MM.dd" />
											부터 수강 가능
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
				</span>
			</div>
			<div id="tab-5" class="tab-content">
				<span class="sumnail">
					<div class="row">
						<div class="blank"></div>
						<h1>운동</h1>
						<h3 class="allClass">전체 클래스</h3>
						<c:forEach var="on" items="${onListCd}">
							<a class="atag_sum" href="./onlineInfo?onc_code=${on.onc_code}">
								<div class="sumnail_box">
									<div class="class_img_div">
										<img class="class_img"
											src="resources/upload/${on.f_sysname }">
									</div>
									<div>
										<div class="categories">${on.cts_name}</div>
										<span>・</span>
										<div class="teacher_name">${on.onc_teacher}</div>
									</div>
									<div class="class_explain">${on.onc_title}</div>
									<div class="class_likes">
										<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
												fill="#bdc2c6"></path>
										</svg>
									</div>
									<div class="class_likes">${on.l_count}</div>
									<div class="hr"></div>
									<div class="class_price">
										<strong> <fmt:formatNumber value="${on.onc_sale}"
												pattern="#,###" />원
										</strong>
									</div>
									<div class="class_bottom">
										<div class="class_startdate">
											<fmt:formatDate value="${on.onc_sdate}" pattern="yyyy.MM.dd" />
											부터 수강 가능
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
				</span>
			</div>
			<div id="tab-6" class="tab-content">
				<span class="sumnail">
					<div class="row">
						<div class="blank"></div>
						<h1>요리</h1>
						<h3 class="allClass">전체 클래스</h3>
						<c:forEach var="on" items="${onListCe}">
							<a class="atag_sum" href="./onlineInfo?onc_code=${on.onc_code}">
								<div class="sumnail_box">
									<div class="class_img_div">
										<img class="class_img"
											src="resources/upload/${on.f_sysname}">
									</div>
									<div>
										<div class="categories">${on.cts_name}</div>
										<span>・</span>
										<div class="teacher_name">${on.onc_teacher}</div>
									</div>
									<div class="class_explain">${on.onc_title}</div>
									<div class="class_likes">
										<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
												fill="#bdc2c6"></path>
										</svg>
									</div>
									<div class="class_likes">${on.l_count}</div>
									<div class="hr"></div>
									<div class="class_price">
										<strong> <fmt:formatNumber value="${on.onc_sale}"
												pattern="#,###" />원
										</strong>
									</div>
									<div class="class_bottom">
										<div class="class_startdate">
											<fmt:formatDate value="${on.onc_sdate}" pattern="yyyy.MM.dd" />
											부터 수강 가능
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
				</span>
			</div>
			<div id="tab-7" class="tab-content">
				<span class="sumnail">
					<div class="row">
						<div class="blank"></div>
						<h1>프로그래밍</h1>
						<h3 class="allClass">전체 클래스</h3>
						<c:forEach var="on" items="${onListCf}">
							<a class="atag_sum" href="./onlineInfo?onc_code=${on.onc_code}">
								<div class="sumnail_box">
									<div class="class_img_div">
										<img class="class_img"
											src="resources/upload/${on.f_sysname}">
									</div>
									<div>
										<div class="categories">${on.cts_name}</div>
										<span>・</span>
										<div class="teacher_name">${on.onc_teacher}</div>
									</div>
									<div class="class_explain">${on.onc_title}</div>
									<div class="class_likes">
										<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
												fill="#bdc2c6"></path>
										</svg>
									</div>
									<div class="class_likes">${on.l_count}</div>
									<div class="hr"></div>
									<div class="class_price">
										<strong> <fmt:formatNumber value="${on.onc_sale}"
												pattern="#,###" />원
										</strong>
									</div>
									<div class="class_bottom">
										<div class="class_startdate">
											<fmt:formatDate value="${on.onc_sdate}" pattern="yyyy.MM.dd" />
											부터 수강 가능
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
				</span>
			</div>
		</div>
	</section>
	<div class="footer_wrap" style="right: 0;">
		<footer class="footer">
			<jsp:include page="../footer.jsp"></jsp:include>
		</footer>
	</div>
</body>

</html>