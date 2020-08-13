<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객 센터</title>
<style type="text/css">
.t-code {
	display :none;
}
</style>
<link rel="stylesheet" href="resources/css/servicecenter.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var chk = "${check}";
	
	if(chk == "1"){
		alert("글 등록  실패!");
		location.reload(true);
	}
	if(chk == "2"){
		alert("글 등록 성공!");
		location.reload(true);
	}
	if(chk == "3"){
		alert("글 삭제 성공!");
		location.reload(true);
	}
	if("${mb.m_email}" != '') {
	var name = "${mb.m_name}";
	$('.wr-btn').css('display','block');
	}
});
</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section class="sectionover">
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