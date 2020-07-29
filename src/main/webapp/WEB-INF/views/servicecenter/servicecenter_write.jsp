<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 센터</title>
<link rel="stylesheet" href="resources/css/servicecenter.css?a">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
		<form name="writeFrm" action="boardWrite" class="write-form"
			method="post" enctype="multipart/form-data">
			<h3>문의글 작성</h3>
			<div class="write-top">
			<a class="t">title : </a><input type="text" class="write-input" name="p_title" autofocus
				placeholder="제목" required>
			<a>meail : </a><input type="text" class="memail" name="p_m_email" value="${mb.m_email}" >
			</div>
			<a style="margin-left:740px;">카테고리 :</a>
			<select class="category" name="p_cts_code">
  				<option value="qc">qc</option>
  				<option value="상품">상품</option>
  				<option value="결제">결제</option>
  				<option value="환불">환불</option>
  				<option value="배송">배송</option>
  				<option value="기타" selected="selected">기타</option>
			</select>
			
			<textarea name="p_content" class="contents"
				placeholder="내용을 적어주세요..."></textarea>
			<div class="btn-btn">
				<input class="btn-update" type="submit" value="문의하기"> <input
					class="btn-reset" type="reset" value="다시 작성"> <input
					class="btn-back" type="button" value="취소"
					onclick="location.href='./servicecenter_question'">
			</div>
		</form>
	</section>
	<footer>
		<jsp:include page="servicecenter_footer.jsp"></jsp:include>
	</footer>
</body>
</html>