<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					
				<c:forEach var="offCate" items="${offCate}">
					<li id="off1"><a href="cate?cts_code=${offCate.cts_code}">${offCate.cts_name}</a></li>
				</c:forEach>
			</div>
			<article class="childart">
				<article class="child1">
					<div class="blank"></div>
					<h1>지금, 인기 TOP10</h1>
					<div id="lista1" class="als-container">
						<span class="als-prev"><img
							src="/resources/images/offline/thin_left_arrow_333.png"
							alt="prev" title="previous" /></span>
						<div class="als-viewport">
							<ul class="als-wrapper">

								<c:forEach var="offList" items="${offList}" begin="4" end="14"
									step="1">
									<li class="als-item"><a
										href="info?ofc_code=${offList.ofc_code}">
											<div class="s_sumnail">
												<div class="s_class_img">
													<img
														src="resources/images/offline/sum/${offList.f_oriname}">
												</div>
												<div class="s_sumnail-txt">
													<div class="s_sumnail-txt-top">
														<div id="s_sub-cate">${offList.ofc_cts_name}</div>
														<div id="s_not">ㆍ&nbsp;</div>
														<div id="s_creator-name">${offList.ofc_teacher}</div>
													</div>
													<div id="s_online-name">${offList.ofc_title}</div>
													<div id="s_class_likes">
														<svg width="15" height="15" fill="none"
															viewBox="0 0 24 18">
                                                                <path
																fill-rule="evenodd" clip-rule="evenodd"
																d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
																fill="#bdc2c6"></path></svg>
													</div>
													<div id="s_class_likes">${offList.l_count}</div>
													<div id="s_hr"></div>
													<div id="s_online-price">
														<fmt:setLocale value="ko_KR" />
														<fmt:formatNumber type="currency"
															value="${offList.ofc_sale}" />
													</div>
												</div>
											</div>
									</a></li>
								</c:forEach>
							</ul>
						</div>
						<span class="als-next"><img
							src="resources/images/offline/thin_right_arrow_333.png"
							alt="next" title="next" /></span>
					</div>
				</article>

				<article class="child2">
					<div class="blank"></div>
					<h1>최근 업데이트 클래스</h1>
					<h5>크리에이터가 최근 등록한 클래스예요.</h5>
					<div id="new">
						<c:forEach var="off" items="${offList}" begin="0" end="11" step="1">
							<div>
						<a href="info?ofc_code=${off.ofc_code}">
								<div class="class_img">
									<img src="/resources/images/offline/sum/${off.f_oriname}"
										alt="">
								</div>
								<article class="on-info1">
									<li id="sub-cate">${off.ofc_cts_name}</li>
									<li>ㆍ</li>
									<li id="creator-name">${off.ofc_teacher}</li> 
									<div id="online-name">${off.ofc_title}</div>
									<div id="class_likes">
										<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd"
												clip-rule="evenodd"
												d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
												fill="#bdc2c6"></path></svg>
									</div>
									<div id="class_likes">${off.l_count}</div>
									<div id="hr"></div>
									<div id="online-price">
										<fmt:setLocale value="ko_KR" />
										<fmt:formatNumber type="currency" value="${off.ofc_sale}" />
									</div>
								</article>
							</a>
							</div>
						</c:forEach>
					</div>
				</article>
			</article>
		</article>
	</section>
	   <div class="footer_wrap" style="right: 0;">
      <footer class="footer"><jsp:include page="../footer.jsp"></jsp:include></footer>
   </div>
</body>
</html>