<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 센터</title>
<link rel="stylesheet" href="resources/css/servicecenter.css?a">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script type="text/javascript">
$(document).ready(function(){
	var chk = "${check}";
	
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
		<jsp:include page="servicecenter_header.jsp"></jsp:include>
	</header>
	<section>
	<h2 class="login-header">고객 센터</h2>
            <div class="cate_container">
                <a class="category" href="./servicecenter_main">FAQ</a>
                <a class="category" href="./servicecenter_question">1 : 1문의</a>
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
					<div class="t-no">${qitem.q_code}</div>
					<div class="t-category">${qitem.cts_name}</div>
					<div class="t-title"><a href="contents?qcode=${qitem.q_code}">
						${qitem.q_title}</a></div>
					<div class="t-name">${qitem.m_name}</div>
					<div class="t-date">${qitem.q_date}</div>
					<div class="t-anfield">${qitem.q_anfield}</div>
				</div>
				</c:forEach>
			<div class="btn-area">
				<div class="paging">${paging}</div>
				<button class="wr-btn" onclick="location.href='./servicecenter_write'">글쓰기</button>
			</div>
				</div>
	</section>
	<footer>
		<jsp:include page="servicecenter_footer.jsp"></jsp:include>
	</footer>
</body>
</html>