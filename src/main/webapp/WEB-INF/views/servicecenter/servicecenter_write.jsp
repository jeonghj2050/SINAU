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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">

<script type="text/javascript">
	var sel_file;
	$(document).ready(function() {
		$("#file").on("change", fileSelect);
	});

	function fileSelect(e) {
		if ($("#file").val() == "") {
			console.log("empty");
			$("#filecheck").val(0);
		} else {
			console.log("not empty");
			$("#filecheck").val(1);
		}

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("이미지 파일만 등록해주세요!!");
				return;
			}
			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#profile_img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);

		});
	}
</script>
<script  type="text/javascript">
$(document).ready(function(){
	$('#photo').change(function(event){
		var tmppath=URL.createObjectURL(event.target.files[0]);
		$('#m_photo').attr('src',tmppath);
	});
});
</script>
<script type="text/javascript">
$("#file").on('change',function(){
	var file = document.getElementById("file");
	console.log(file);
	var filelist = file.files;
	console.log(filelist);
	
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
		<form name="writeFrm" action="boardWrite" class="write-form"
			method="post" enctype="multipart/form-data">
			<h3>문의글 작성</h3>
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
					onclick="location.href='./servicecenter_question'">
			</div>
		</form>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>