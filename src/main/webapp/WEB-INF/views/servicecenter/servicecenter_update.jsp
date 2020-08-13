<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 수정</title>
<link rel="stylesheet" href="resources/css/servicecenter.css?a">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section class="sectionover">
		<h2 class="login-header">고객 센터</h2>
		<div class="cate_container">
			<a class="category" href="./servicecenter_main">FAQ</a> <a
				class="category" href="./servicecenter_question">1 : 1문의</a>
			<a class="category" href="./servicecenter_refund">환불내역</a>
		</div>
		<div class="updatecontent">
			<form action="boardUpdate" method="post" class="update-form"
				enctype="multipart/form-data">
				<h3 class="login-header">문의글 수정</h3>
				<a class="t">title : </a>
				<input type="text" name="q_title" class="write-input" value="${question.q_title}" required> 
				<a>meail : </a>
				<input type="text" class="write-input" name="m_email" value="${mb.m_email}" > 
				<input type="hidden" name="q_code" value="${question.q_code}"> 
				<a style="margin-left: 65%;" class="catg">카테고리 :</a> 
				<select class="category" name="q_cts_code">
					<option value="qc">강좌 문의</option>
					<option value="qpro">상품 문의</option>
					<option value="qpay">결제 문의</option>
					<option value="qre">환불 문의</option>
					<option value="qde">배송 문의</option>
					<option value="qet">기타 문의</option>
				</select>
				<textarea name="q_content" rows="10" class="contents">${question.q_content}</textarea>
				<div class="filebox">
				<div class="befor-file" style="margin-bottom: 10px;">
					<c:if test="${empty bfList}">
						<label style="width: 100%;">파일변경</label>
					</c:if>
					<c:if test="${!empty bfList}">
						<c:forEach var="file" items="${bfList}">
						<label style="width: 100%;">
						<a href="./download?sysFileName=${file.f_sysname}">
						${file.f_oriname}</a></label>
						</c:forEach>
					</c:if>
				</div>
				<label for="file">파일변경</label> 
				<input type="file" name="files" id="file"> 
				<input class="upload-name" value="파일선택" readonly>
				<input type="hidden" id="filecheck"	value="0" name="fileCheck">
			</div>
				<div class="btn-area">
					<input class="btn-write" type="submit" value="저장"> 
					<input class="btn-write" type="button" value="취소"
						onclick="javascript:history.back();">
				</div>
			</form>
		</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
$("#file").on('change',function(){
	var fileName = $("#file").val();
	$(".upload-name").val(fileName);
	
	if(fileName == ""){
		console.log("empty");
		$("#filecheck").val(0);
	}
	else{
		console.log("not empty");
		$("#filecheck").val(1);
	}
});
</script>
</html>