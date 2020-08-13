<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/adstyle.css?ver=1.3">
<head>
<meta charset="UTF-8">
<title>관리자 페이지 고객센터(qna)</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function qnaCode(code) {

		console.log(code);
		location.href = './adQna?code=' + code;

	}
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
				<a href="./adSQna"><b>Q&A</b></a>
			</div>
			<div class="adSWarning">
				<a href="./adSWarning">신고</a>
			</div>
		</div>

		<div class="servQ listCss">
			<div class="line">
				<div class="servTitle padding10 tline">
					<div class="sv-num servQ1">번호</div>
					<div class="sv-title servQ2">제목</div>
					<div class="sv-name servQ3">이름</div>
					<div class="sv-date servQ4">작성일</div>
					<!-- <div class="sv-count servQ5">조회수</div> -->
				</div>
				<div class="servBorder">
					<div class="servList">
						<c:forEach var="bitem" items="${qna}">
							<div class="code lists" onclick="qnaCode('${bitem.code}')">
								<div class="sv-num servQ1">${bitem.q_num}</div>
								<div class="sv-title servQ2">${bitem.title}</div>
								<div class="sv-name servQ3">${bitem.name}</div>
								<div class="sv-date servQ4">${bitem.dates}</div>
								<!-- <div class="sv-count servQ5">1</div> -->
							</div>
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