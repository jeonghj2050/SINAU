<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유튜브 등록 페이지</title>
<link rel="stylesheet" href="resources/css/adstyle.css?ver=1.3">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

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
			<h2>유튜브 강좌 등록</h2>
			<div class="write-top2">
			<a>유튜브채널이름 : </a><input type="text" class="y_profile" name="y_profile" autofocus placeholder="닉네임">
			<div class="category11">
			<a>카테고리 :</a>
			<select class="category" name="y_cts_code">
  				<option value="ya">미술</option>
  				<option value="yd">디지털</option>
  				<option value="yh">건강/헬스</option>
  				<option value="yp">프로그래밍</option>
  				<option value="yc">요리</option>
  			</select>
  			</div>
			</div>
			<div class="write-top">
			<a class="t">제목 : </a> <input type="text" class="y_title" name="y_title" autofocus placeholder="제목">
			<a>부제목 : </a><input type="text" class="y_subtitle" name="y_subtitle" autofocus placeholder="부제목">
			</div>
			<div class="write-top3">
			<a>동영상 링크 : </a><input type="text" class="y_url" name="y_url" autofocus placeholder="메인동영상링크">
			<a>유투버 채널 링크 : </a><input type="text" class="y_userurl" name="y_userurl" autofocus placeholder="메인 페이지링크">
			</div>
			<textarea name="y_content" class="y_contents"
				autofocus placeholder="강좌 소개글  (100자 이내)"></textarea>
			<a>동영상 soure : </a><input type="text" class="y_videosoure" name="y_videosoure" autofocus placeholder="동영상 소스">
			<div class="filebox">
				<img src="resources/images/user.png" alt=""
				class="img-circle" width="100px" height="100px" id="profile_img"><br>
				<a>프로필이미지 등록</a> 
				<input type="file" name="files" id="file"> 				
				<input class="upload-name" value="파일선택" readonly>
				<input type="hidden" id="filecheck"	value="0" name="fileCheck">
			</div>
			<div class="btn-btn">
				<input class="btn-update" type="submit" value="등록"> <input
					class="btn-reset" type="reset" value="다시 작성"> <input
					class="btn-back" type="button" value="취소"
					onclick="location.href='./adPLecture'">
			</div>
		</form>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script  type="text/javascript">
$(document).ready(function(){
	$('#photo').change(function(event){
		var tmppath=URL.createObjectURL(event.target.files[0]);
		$('#m_photo').attr('src',tmppath);
	})
});
</script>
<script type="text/javascript">
	var sel_file;
	$(document).ready(function() {
		$("#member_profile").on("change", fileSelect);
	});

	function fileSelect(e) {
		if ($("#member_profile").val() == "") {
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
<script type="text/javascript">
$("#file1").on('change',function(){
	var fileName1 = $("#file1").val();
	$(".upload-name1").val(fileName1);
	
	if(fileName1 == ""){
		console.log("empty");
		$("#filecheck1").val(0);
	}
	else{
		console.log("not empty");
		$("#filecheck1").val(1);
	}
});
</script>
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
<script  type="text/javascript">
	function mgcheck(){
	//form 태그의 내용을 전부 가져오기
	var frm = document.writeFrm;
	
	//submit 버튼을 뺀 나머지 input태그의 개수
	var length = frm.length - 1;
	
	//input 태그 중에 입력이 안된 요소를 확인
	for(var i = 0; i < length; i++){
		if(frm[i].value == "" 
				|| frm[i].value == null){
			alert(frm[i].title + " 입력!");
			frm[i].focus();
			return false;//action이 실행 안됨.
		}
	}
	//모든 input에 입력이 다 되었을 경우.
	return true;//action이 실행됨.
}
</script>
</html>