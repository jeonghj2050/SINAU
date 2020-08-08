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
			<h2>유튜브 강좌 등록</h2>
			<div class="write-top2">
			<a>유튜브채널이름 : </a><input type="text" class="y_profile" name="y_profile" autofocus placeholder="닉네임">
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
				autofocus placeholder="강좌 소개글"></textarea>
			<div class="filebox">
				
				<img src="resources/images/user.png" alt=""
				class="img-circle" width="100px" height="100px" id="profile_img"><br>
				<a>프로필이미지 등록</a> 
				<input type="file" name="files" id="file"> 
				<input type="hidden" id="filecheck"	value="1" name="fileCheck">
			</div>
			<div class="videobox">	
				<a>메인비디오 등록</a>
				<input type="file" name="files" id="file"> 
				<input type="hidden" id="filecheck"	value="0" name="fileCheck">
			</div>
			
			<div class="btn-btn">
				<input class="btn-update" type="submit" value="등록"> <input
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
</html>