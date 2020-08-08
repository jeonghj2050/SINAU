<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유튜브 등록 페이지</title>
<link rel="stylesheet" href="resources/css/adstyle.css?ver=1.1">
</head>
<body>
<header>
		<jsp:include page="../adHeader.jsp"></jsp:include>
	</header>
	<section>
		<div class="menuCate">
			<h2 id="adPManagement">
				<b><ins>게시글관리</ins></b>
			</h2>
			<div class="adPLecture">
				<a href="./adPLecture">강의</a>
			</div>
			<div class="adPStore">
				<a href="./adPStore">판매</a>
			</div>
			<div class="adPReview">
				<a href="./adPReview">댓글리뷰</a>
			</div>
		</div>
		<form name="writeFrm" action="youtubeWrite" class="insert-form"
			method="post" enctype="multipart/form-data">
			<h3>유튜브 강좌 등록</h3>
			<div class="write-top">
			<a class="t">title : </a> <input type="text" class="write-input" name="q_title" autofocus placeholder="제목" required>
			<a>meail : </a><input type="text" class="memail" name="q_m_email" value="${mb.m_email}" >
			</div>
			<a style="margin-left:720px;">카테고리 :</a>
			<select class="category" name="q_cts_code">
  				<option value="qc">강좌 문의</option>
  				<option value="qpro">상품 문의</option>
  				<option value="qpay">결제 문의</option>
  				<option value="qre">환불 문의</option>
  				<option value="qde">배송 문의</option>
  				<option value="qet" selected="selected">기타 문의</option>
			</select>
			
			<textarea name="q_content" class="contents"
				placeholder="내용을 적어주세요..."></textarea>
			<div class="filebox"> 
				<input type="file" name="files" id="file"> 
				<input type="hidden" id="filecheck"	value="0" name="fileCheck">
			</div>
			<div class="btn-btn">
				<input class="btn-update" type="submit" value="문의하기"> <input
					class="btn-reset" type="reset" value="다시 작성"> <input
					class="btn-back" type="button" value="취소"
					onclick="location.href='./ad_post_lecture'">
			</div>
		</form>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>