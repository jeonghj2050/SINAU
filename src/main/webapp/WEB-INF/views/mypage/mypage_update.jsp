<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU 회원정보수정</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/mypage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(function() {
		$('li').click(function() {
			$('li').removeClass('item-selected');
			$(this).addClass('item-selected');
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
<script  type="text/javascript">
$(function(){
    $('#newPwd').keyup(function(){
      $('#chkNotice').html('');
      $('#newPwd2').val('');
    });

    $('#newPwd2').keyup(function(){
        if($('#newPwd').val() != $('#newPwd2').val()){
          $('#chkNotice').html('비밀번호 일치하지 않음');
          $('#chkNotice').attr('color', '#f82a2aa3');
        } else{
          $('#chkNotice').html('비밀번호 일치함');
          $('#chkNotice').attr('color', '#199894b3');
        }
    });
});
</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section class="mp_section">
		<jsp:include page="mypage_nav.jsp"></jsp:include>
		<article>
			<div class="page-title">회원정보 수정</div>
			<form action="/mypageUpdate" method="post">
				<div>
					<div class="profile_image">
						<img src="resources/upload/${ myInfo.mimg_sysname }" alt=""
							class="img-circle" width="200px" height="200px" id="profile_img"><br>
						<div>
							<label for="file"></label> <input type="file" name="files"
								id="member_profile"> <input type="hidden" id="filecheck"
								value="0" name="fileCheck">
						</div>
					</div>
					<div class="profile_update_box">
						<div>
							<span>이메일</span> <input type="text" value="${ myInfo.m_email}" readonly>
						</div>
						<div>
							<span>새 비밀번호</span> <input type="password" name="newPwd" id="newPwd">
						</div>
						<div>
							<span>새 비밀번호 확인</span> 
							<input type="password" id="newPwd2">
						</div>
						<div>
							<span style="height: 25px;"></span>
							<font id="chkNotice" size="2"></font>
						</div>
						
						<div>
							<span>핸드폰번호</span> 
							<input type="text" value="${ myInfo.m_phone}" readonly>
						</div>
						<div>
							<span>생년월일</span> 
							
							<input type="text" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${myInfo.m_birth}"/>" readonly>
						</div>
					</div>
					<div class="update-btn-box">
						<input type="submit" value="수정하기" class="my_default_btn">
					</div>
				</div>

			</form>
		</article>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>

</html>