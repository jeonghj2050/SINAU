<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU 온라인 강의</title>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="resources/css/style.css?a">
<link rel="stylesheet" href="resources/css/mypage.css">
<script>
        $(function(){
            $('li').click(function(){
                $('li').removeClass('item-selected');
                $(this).addClass('item-selected');
            })
        });
    </script>
<script type="text/javascript">
	$(document).ready(function () {
	    $("#onc_form").show();
	    $("#ofc_form").hide();
	    // 라디오버튼 클릭시 이벤트 발생
	    $("input:radio[name=class_sort]").click(function () {
	        if ($("input[name=class_sort]:checked").val() == "ofc") {
	            $("#ofc_form").show();
	            $("#onc_form").hide();
	        } else if ($("input[name=class_sort]:checked").val() == "onc") {
	            $("#onc_form").show();
	            $("#ofc_form").hide();
	        }
	    });
	});
	
	$(function(){
		$(".c_myclass_info").hide();
		$(".c_myclass_info:first").show();
		$("#mytab li").click(function(){
			var tabName=$(this).attr('name');
			$(".c_myclass_info").hide();
			$("#"+tabName).show();
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
		<article>
			<div class="page-title">내 클래스</div>
			<div role="tabpanel">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist" id="mytab">
					<c:forEach var="ccInfo" items="${ccInfoList}">	
					<li role="presentation" name="${ccInfo.onc_code}">
						<a href="#${ccInfo.onc_code}" aria-controls="home" role="tab" data-toggle="tab">${ccInfo.onc_code}</a>
					</li>
					</c:forEach>
					<c:forEach var="cofInfo" items="${cofInfoList}">	
					<li role="presentation" name="${cofInfo.ofc_code}">
						<a href="#${cofInfo.ofc_code}" aria-controls="home" role="tab" data-toggle="tab">${cofInfo.ofc_code}</a>
					</li>
					</c:forEach>
				</ul>
				<c:forEach var="ccInfo" items="${ccInfoList}">
					<div class="c_myclass_info" id="${ccInfo.onc_code}">
						<img src="resources/upload/${ccInfo.f_sysname} " alt="">
						<div class="c_myclass_detail">
							<div style="font-size: 13pt; font-weight: bold;">${ccInfo.onc_title }</div>
							<div>${ccInfo.onc_content}</div>
							<div>${ccInfo.onc_rstnum }명 / ${ccInfo.onc_stnum }명</div>
						</div>
						<div style="float:right;">
							<c:if test="${ccInfo.onc_rstnum le 0 }">
								<button class="my_default_btn" onclick="location.href='./cMyClassDel?p_code=${ccInfo.onc_code}'">강의 삭제</button>
							</c:if>
							<button class="my_default_btn" onclick="location.href='./cMyClassUp?up_p_code=${ccInfo.onc_code}'">강의 수정</button>
						</div>
						<p class="mypage_sub_title" style="clear:both;">등록 정보</p>
						<div class="c_myclass_stuList">
							<table class="table">
								<tr>
									<th>이메일</th>
									<th>이름</th>
								</tr>
								<c:forEach var="constuInfo" items="${contuInfoList}">
									<tr>
										<td>${constuInfo.m_email}</td>
										<td>${constuInfo.m_name}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</c:forEach>
				<c:forEach var="cofInfo" items="${cofInfoList}">
					<div class="c_myclass_info" id="${cofInfo.ofc_code}">
						<img src="resources/upload/${cofInfo.f_sysname} " alt="">
						<div class="c_myclass_detail">
							<div style="font-size: 13pt; font-weight: bold;">${cofInfo.ofc_title }</div>
							<div>${cofInfo.ofc_content}</div>
							<div>${cofInfo.ofc_rstnum }명 / ${cofInfo.ofc_stnum }명</div>
						</div>
						<div style="float:right;">
							<c:if test="${cofInfo.ofc_rstnum le 0 }">
								<button class="my_default_btn" onclick="location.href='./cMyClassDel?p_code=${cofInfo.ofc_code}'">강의 삭제</button>
							</c:if>
							<button class="my_default_btn" onclick="location.href='./cMyClassUp?up_p_code=${cofInfo.ofc_code}'">강의 수정</button>
						</div>
						<p class="mypage_sub_title" style="clear:both;">등록 정보</p>
						<div class="c_myclass_stuList">
							<table class="table">
								<tr>
									<th>이메일</th>
									<th>이름</th>
								</tr>
								<c:forEach var="coffstuInfo" items="${cofftuInfoList}">
									<tr>
										<td>${coffstuInfo.m_email}</td>
										<td>${coffstuInfo.m_name}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</c:forEach>
			</div>
		</article>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>