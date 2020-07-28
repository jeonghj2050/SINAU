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

<script type="text/javascript">
$(document).ready(function(){
	var chk = "${check}";
	
	if(chk == "1"){
		alert("글 등록 실패!");
	}
	
	if("${mb.m_email}" != '') {
	var name = "${mb.m_name}";
	$('#mname').html(name + '님');
	$('.suc').css('display','block');
	$('.bef').css('display','none');
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
			<a class="category" href="">Q & A</a> <a class="category" href="">신고</a>
		</div>
		<form name="writeFrm" action="boardWrite" class="write-form"
			method="post" enctype="multipart/form-data">
			<div class="write-top">
			<a>title : </a><input type="text" class="write-input" name="btitle" autofocus
				placeholder="제목" required>
			<a>meail : </a><input type="text" name="email" value="${mb.m_email}">
			</div>
			<textarea name="bcontents" rows="15" class="write-input ta"
				placeholder="내용을 적어주세요..."></textarea>
			<div class="filebox">
				<label for="file">업로드</label> <input type="file" name="files"
					id="file"> <input class="upload-name" value="파일선택" readonly>
				<input type="hidden" id="filecheck" value="0" name="fileCheck">
			</div>

			<div class="btn-area">
				<input class="btn-write" type="submit" value="W"> <input
					class="btn-write" type="reset" value="C"> <input
					class="btn-write" type="button" value="B"
					onclick="location.href='./list?pageNum=${pageNum}'">
			</div>
		</form>
	</section>
</body>
</html>