<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>오프라인 카테고리</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/offline/offline_main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/offline/offline_cate_1.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/offline/offline_main.css" />
<script type="text/javascript"></script>
</head>
<body>
	<header>
		<jsp:include page="../../header.jsp"></jsp:include>
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
				<article class="child2">
					<div class="blank"></div>
					<h1>${offCateName}</h1>
					<h5>전체클래스</h5>
					<div id="filter">
						<img src="../../../resources/images/offline/sort.png">인기순
					</div>
					<div id="new">
						<c:forEach var="offCateList" items="${offCateList}">
							<div>
								<a href="info?ofc_code=${off.ofc_code}">
									<div class="class_img">
										<img
											src="/resources/images/offline/sum/${offCateList.f_oriname}"
											alt="">
									</div>
									<article class="on-info1">
										<li id="sub-cate">${offCateList.ofc_cts_name}</li>
										<li>ㆍ</li>
										<li id="creator-name">${offCateList.ofc_teacher}</li>
										<div id="online-name">${offCateList.ofc_title}</div>
										<div id="class_likes">
											<svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd"
													clip-rule="evenodd"
													d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
													fill="#bdc2c6"></path></svg>
										</div>
										<div id="class_likes">${offCateList.l_count}</div>
										<div id="hr"></div>
										<div id="online-price">
											<fmt:setLocale value="ko_KR" />
											<fmt:formatNumber type="currency"
												value="${offCateList.ofc_sale}" />
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
	<footer>
		<jsp:include page="../../footer.jsp"></jsp:include>
	</footer>
</body>
</html>