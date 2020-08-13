<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유튜브 상세페이지</title>
<link rel="stylesheet" href="resources/css/home.css?b">
<link rel="stylesheet" href="resources/css/youtube.css?b">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section>
		<div class="question-content">
			<div class="question-form">
				<div class="y_videosoure">${youtube.y_viedosoure}</div>
				<div class="total">
				<div class="main_content">
				<div class="y_title1">제목 : </div><div class="y_title">${youtube.y_title}</div>
				<div class="y_content1">상세설명 : </div><div class="y_content">${youtube.y_content}</div>
				<div class="y_url"><a href="${youtube.y_url}">메인동영상 링크  &lt;-- 클릭</a></div>
				</div>
				
				<div class="sub_content">
				<img src="resources/upload/${youtube.f_sysname}" width="100px"
								height="100px">			
				<div class="y_profile">이름 : ${youtube.y_profile}</div>
				<div class="cts_name">카테고리 : ${youtube.cts_name}</div>			
				<div class="y_update">게시일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${youtube.y_update}"/></div>	
				<div class="y_userurl"><a href="${youtube.y_userurl}">유튜버 채널 링크  &lt;-- 클릭</a></div>
				</div>
				<div class="sub2_content">
				<div class="y_view">조회수 : ${youtube.y_view}</div>
				</div>
				
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>