<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 유투브 리스트 페이지</title>
<link rel="stylesheet" href="resources/css/adstyle.css?ver=1.2">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<header>
 		<jsp:include page="../adHeader.jsp"></jsp:include>
	</header>
	<section>
			<h2 class="login-header">고객 센터</h2>
            <div class="cate_container">
                <a class="category" href="./servicecenter_main">FAQ</a>
                <a class="category" href="./servicecenter_question">1 : 1문의</a>
			<a class="category" href="./servicecenter_refund">환불내역</a>
            </div>
			<div class="data-area">
				<div class="title-row">
					<div class="t-no">번호</div>
					<div class="t-category">분류</div>
					<div class="t-title">제목</div>
					<div class="t-name">작성자</div>
					<div class="t-date">작성일</div>
					<div class="t-anfield">답변여부</div>
				</div><br>
				<c:forEach var="qitem" items="${qList}">
				<div class="data-row">
					<div class="t-no">${qitem.q_num}</div>
					<div class="t-code" style="display:none;">${qitem.q_code}</div>
					<div class="t-category">${qitem.cts_name}</div>
					<div class="t-title"><a href="contents?q_code=${qitem.q_code}">
						${qitem.q_title}</a></div>
					<div class="t-name">${qitem.m_name}</div>
					<div class="t-date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qitem.q_date}"/></div>
					<div class="t-anfield">
					<c:if test="${qitem.q_anfield eq null }">
						미답변
					</c:if>
					<c:if test="${qitem.q_anfield ne null }">
						답변완료
					</c:if>
					</div>
				</div>
				</c:forEach>
				</div>
			<div class="btn-area">
				<button class="wr-btn" onclick="location.href='./servicecenter_write'">글쓰기</button>
			</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>