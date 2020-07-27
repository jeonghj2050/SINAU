<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 센터</title>
<link rel="stylesheet" href="resources/css/servicecenter.css">
</head>
<body>
	<header>
		<jsp:include page="servicecenter_header.jsp"></jsp:include>
	</header>
	<section>
	<h2 class="login-header">게시글 목록</h2>
			<div class="data-area">
				<div class="title-row">
					<div class="t-no p-10">번호</div>
					<div class="t-title p-30">제목</div>
					<div class="t-name p-15">작성자</div>
					<div class="t-date p-30">작성일</div>
					<div class="t-view p-15">조회수</div>
				</div>
				<c:forEach var="bitem" items="${bList}">
				<div class="data-row">
					<div class="t-no p-10">${bitem.q_code}</div>
					<div class="t-title p-30"><a href="contents?qcode=${bitem.qcode}">
						${bitem.q_title}</a></div>
					<div class="t-name p-15">${bitem.mname}</div>
					<div class="t-date p-30">${bitem.qdate}</div>
					<div class="t-view p-15">${bitem.bviews}</div>
				</div>
				</c:forEach>
			</div>
			<div class="btn-area">
				<div class="paging">${paging}</div>
				<button class="wr-btn" onclick="location.href='./writeFrm'">글쓰기</button>
			</div>
	</section>
</body>
	
</html>