<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript">
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
			<div class="page-title">강의 등록</div>
			<div class="class_sort">
				<div>
					온라인<input type="radio" name="class_sort" value="onc" checked>
				</div>
				<div>
					오프라인<input type="radio" name="class_sort" value="ofc">
				</div>
			</div>
			<form action="./cMyNewClass" method="post" enctype="multipart/form-data">
				<div class="class_form" id="onc_form">
				<div class="class_info_form">
					<div class="class_profile_image">
						<img src="resources/images/default.jpg" alt="" class="img-circle"
							width="200px" height="200px" id="profile_img"><br>
						<div>
							<label for="file"></label> <input type="file" name="files"
								id="class_profile"> <input type="hidden" id="filecheck"
								value="0" name="fileCheck" required>
						</div>
					</div>
					<div>
						<span class="class_info_title">강의 제목</span><br> 
						<input type="text" name="onc_title" required> <br>
						<p></p>
						<span class="class_info_title">강의 소개</span>
						<textarea name="onc_content" id="" rows="6" required></textarea>
						<p></p>
						<span class="class_info_title">카테고리</span> 
						<select
							name="onc_cts_code" required>
							<option value="ca">art</option>
							<option value="cb">craft</option>
							<option value="cc">digital drawing</option>
							<option value="cd">exercise</option>
							<option value="ce">programming</option>
							<option value="cf">cooking</option>
						</select><br>
						<p></p>
						<span class="class_info_title">난이도</span> <input type="radio"
							name="onc_level" value="초급">초급 <input type="radio"
							name="onc_level" value="중급">중금 <input type="radio"
							name="onc_level" value="고급">고급 <br>
						<p></p>
						<span class="class_info_title">가격</span> <input type="number"
							name="onc_sale" placeholder="가격" required><br>
						<p></p>
						<span class="class_info_title">수강 인원</span> <input type="number"
							name="onc_stnum" placeholder="수강 인원" required><br>
						<p></p>
						<span class="class_info_title">시작일</span> <input type="date"
							name="onc_sdate" required> <span class="class_info_title">종료일</span>
						<input type="date" name="onc_edate" required>

					</div>
					<button class="my_default_btn" style="float: right;margin-top:20px;"
							id="addClassVideoFile" type="button" >강의 추가</button>
					<div class="class_video_list">
						<table id="vf_list">
							<tr>
								<th>강의제목</th>
								<th>강의내용</th>
								<th>동영상</th>
							</tr>
							<tr>
								<td><input type="text" name="v_title" id="" required></td>
								<td><input type="text" name="v_content" id="" required></td>
								<td><input type="file" name="video_files" id="" required></td>
							</tr>
						</table>
						
					</div>
				</div>
			</div>
			<input type="submit" class="my_default_btn" style="float: right;" name="강의 등록"></input>
			</form>
		</article>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script>
    $("#addClassVideoFile").click(function(){
        $('#vf_list > tbody:last').append('<tr> <td><input type="text" name="v_title" id="" required>  </td>'+
                                '<td>  <input type="text" name="v_content" id="" required> </td>'+
                                '<td> <input type="file" name="vf_oriname" id="" required> </td> </tr>');

    });
</script>
</html>