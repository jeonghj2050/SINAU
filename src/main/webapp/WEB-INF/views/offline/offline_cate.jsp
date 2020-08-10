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
	href="/resources/css/offline/offline_main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="/resources/css/offline/offline_cate_1.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="/resources/css/offline/offline_main.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="/resources/css/style.css" />
<script type="text/javascript">
/* $(document).ready(function(){
	$(".filter_btn").click(function(){
 	var filter1 = $('input:radio[name=filter1]:checked').val();
 	var data1 = {"ft_cts_code":ft_cts_code}
 	
 	var filter2 = $('input:radio[name=filter2]:checked').val();
 	var data2 = {"ft_cts_code":ft_cts_code}
 	
 	var filter3 = $('input:radio[name=filter3]:checked').val();
 	var data3 = {"ft_cts_code":ft_cts_code}
 	
 	
 	log.info(data1 + "" + data2 + "" + data3);
 	
 	$.ajax({
 		url : "getFilter",
 		type : "post",
		data : data,
		dataType : "JSON",
		success : function(data){
			if(filter1  "fa"){
				
			}
				
		}
 	})
 	alret(filter1)
	});
}); */
</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section>
	<div class="show1">
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
					<h1>${ctsInfo.cts_name}</h1>
					<h5>전체클래스</h5>
					<div id="filter">
						<img src="/resources/images/offline/sort.png">검색 필터
					</div>
					<div id="new">
						<c:forEach var="offCateList" items="${offCateList}">
							<div>
								<a href="info?ofc_code=${offCateList.ofc_code}">
									<div class="class_img">
										<img src="/resources/upload/${offCateList.f_sysname}" alt="">
									</div>
									<article class="on-info1">
										<li id="sub-cate">${offCateList.cts_name}</li>
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
		</div>
<%-- 		<div class="filter_modal">
			<div class="filter_modal-wrap">
				<form name="filter" action="filter" method="get">
					<div class="filter_text">검색 필터</div>
					<div class="filter1">
						<c:forEach var="filter1" items="${filter1}" varStatus="status">
							<input type="radio" class="filter1" name="filter1"
								value="${filter1.ft_cts_code}">${filter1.ft_cts_name}<br>
						</c:forEach>
					</div>
					<div class="filter2">
						<c:forEach var="filter2" items="${filter2}" varStatus="status">
							<input type="radio" class="filter2" name="filter2"
								value="${filter2.ft_cts_code}">${filter2.ft_cts_name}<br>
						</c:forEach>
					</div>
					<div class="filter3">
						<c:forEach var="filter3" items="${filter3}" varStatus="status">
							<input type="radio" class="filter3" name="filter3"
								value="${filter3.ft_cts_code}">${filter3.ft_cts_name}<br>
						</c:forEach>
					</div>
					<input type="hidden" name="cts_code" value="${ctsInfo.cts_code}">
					<input type="submit" class="filter_btn" value="검색">
				</form>
			</div>
		</div> --%>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
	$(document).ready(function() {

		$('.show1').show();
		$('.filter_modal').hide();

		$('#filter').click(function() {
			$('.filter_modal').show(); //클릭 시 두 번째 요소 표시
			return false;
		});

		$('.filter_btn').click(function() {
			$('.filter_modal').hide();
			return false;
		});
	});
</script>
</html>