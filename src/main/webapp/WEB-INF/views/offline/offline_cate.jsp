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

	$(document).on('click','.fliter_submit', function() {
						var filter = $('input[name=filter]:checked',
								'#filterFrm').val();
						var cts_code = $('.cts_code').val();
						console.log(filter);
						console.log(cts_code);

						var data = {
							"filter" : filter,
							"cts_code" : cts_code
						}

						$.ajax({
									url : "getFilter",
									type : "post",
									data : data,
									dataType : "JSON",
									success : function(data, values) {
										console.log("성공");
										console.log(data);

										$("#new").html('');
										$('.filter_modal').hide();
										for (var i = 0; i < data.offCateList.length; i++) {
											var flist = data.offCateList[i];
											
											var ofc_code = flist.ofc_code;
											var f_sysname = flist.f_sysname;
											var cts_name = flist.cts_name;
											var ofc_teacher = flist.ofc_teacher;
											var ofc_title =  flist.ofc_title;
											var l_count = flist.l_count;
											var ofc_sale = flist.ofc_sale;
											
											ofc_sale = ofc_sale.toLocaleString();


											var clist = '<div id="new_wrap">';											
											
											clist += '<a href="info?ofc_code='
													+ ofc_code
													+ '">'
													+ '<div class="class_img">'
													+ '<img src="/resources/upload/' + f_sysname + '" alt=""></div>'
													+ '<article class="on-info1">'
													+ '<li id="sub-cate">'
													+ cts_name
													+ '</li>'
													+ '<li>ㆍ</li>'
													+ '<li id="creator-name">'
													+ ofc_teacher
													+ '</li>'
													+ '<div id="online-name">'
													+ ofc_title
													+ '</div>'
													+ '<div id="class_likes">'
													+ '<svg width="15" height="15" fill="none" viewBox="0 0 24 18">'
													+ '<path fill-rule="evenodd" clip-rule="evenodd"' +  
	                                    'd="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"' +
										'fill="#bdc2c6"></path></svg></div>'
													+ '<div id="class_likes">'
													+ l_count + '</div>'
													+ '<div id="hr"></div>'
													+ '<div id="online-price" >'
													+ ofc_sale
													+ '원</div>'
													+ '</article></a>'
											clist += "</div>";
											
										console.log(ofc_code, f_sysname, cts_name, ofc_teacher, ofc_title, l_count, ofc_sale);
											$("#new").append(clist);
										}
										

									},
									error : function() {
										console.log("실패");
										$('.filter_modal').hide();
									}
								});

					});
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
								<div id="new_wrap">
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
											 <fmt:formatNumber pattern="###,###,###"
							value="${offCateList.ofc_sale}" />원
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
		<div class="filter_modal">
			<div class="filter_modal-wrap">
				<form name="filterFrm" id="filterFrm">
					<div class="filter_text">검색 필터</div>
					<div class="filter1">
						<input type="hidden" class="cts_code" value="${ctsInfo.cts_code}">
						<input type="radio" class="filter" name="filter" value="best"><span>인기순</span><br>
						<input type="radio" class="filter" name="filter" value="update"><span>최신순</span><br>
						<input type="radio" class="filter" name="filter" value="like"><span>좋아요순</span><br>
						<input type="button" class="fliter_submit" value="검색"
							style="cursur: pointer;">
					</div>
				</form>
			</div>
		</div>
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