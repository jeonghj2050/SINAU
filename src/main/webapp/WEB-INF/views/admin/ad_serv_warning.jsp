<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/adstyle.css">
<head>
<meta charset="UTF-8">
<title>관리자 페이지 고객센터(신고)</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<!-- 나중에 헤더는 따로 뺄것 -->
	<header>
		<jsp:include page="../adHeader.jsp"></jsp:include>
	</header>
	<section>
		<div class="servCate menuCate">
			<h2 id="adSManagement">
				<b><ins>고객센터</ins></b>
			</h2>
			<div class="adSQna">
				<a href="./adSQna">Q&A</a>
			</div>
			<div class="adSWarning">
				<a href="./adSWarning"><b>신고</b></a>
			</div>
		</div>

		<div class="servW listCss">
			<div class="line">
				<div class="servWTitle padding10 tline">
					<div class="sw-num servW1">번호</div>
					<div class="sw-context servW2">내용</div>
					<div class="sw-name servW3">이름</div>
					<div class="sw-date servW4">작성일</div>
					<div class="sw-result servW5">처리결과</div>
				</div>
				<div class="servBorder">
					<div class="servWList padding10">
					<c:forEach var="bitem" items="${warning}">
						<div class="sw-num servW1">${bitem.w_num}</div>
					<div class="sw-context servW2">${bitem.contentnum}</div>
					<div class="sw-name servW3">${bitem.name}</div>
					<div class="sw-date servW4">${bitem.dates}</div>
					<div class="sw-result servW5">${bitem.states}</div>
					</c:forEach>
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