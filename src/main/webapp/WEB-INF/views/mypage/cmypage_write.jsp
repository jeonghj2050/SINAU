<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU 강의 등록</title>
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
	 $(document).ready(function () {
         $("#onc_form").show();
         $("#ofc_form").hide();
         // 라디오버튼 클릭시 이벤트 발생
         $("input:radio[name=class_sort]").click(function () {
             if ($("input[name=class_sort]:checked").val() == "ofc") {
                 $("#ofc_form").show();
                 $("#onc_form").hide();
             } else if ($("input[name=class_sort]:checked").val() == "onc") {
                 $("#onc_form").show();
                 $("#ofc_form").hide();
             }
         });
     });
</script>
<script type="text/javascript">
	var sel_file;
	$(document).ready(function() {
		$(".image_file").on("change", fileSelect);
	});
	$(document).ready(function() {
		$(".image_file_thumb").on("change", fileSelectThumb);
	});
	$(document).ready(function(){
		$('#spec').on("change",handleMultiThumb);
	});
	function fileSelect(e) {
		if ($(".image_file").val() == "") {
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
		});
	}
	function fileSelectThumb(e) {
		if ($(".image_file_thumb").val() == "") {
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
	
	function handleMultiThumb(e) {
		$('.spec_images_wrap').html('');
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
				var img_html="<img src='" +e.target.result + "'/>";
				$('.spec_images_wrap').append(img_html);
			}
			reader.readAsDataURL(f);
		});
	}
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

			<form action="./cMyNewClass" method="post"
				enctype="multipart/form-data">
				<div class="class_sort">
					<div>
						온라인<input type="radio" name="class_sort" value="onc" checked>
					</div>
					<div>
						오프라인<input type="radio" name="class_sort" value="ofc">
					</div>
				</div>
				<div class="class_form" id="onc_form">
					<div class="class_info_form">
						<div class="class_profile_image">
							<img src="resources/images/default.jpg" alt="" class="img-circle"
								width="200px" height="200px" id="profile_img"><br>
							<div>
								<label for="thumbnail">썸네일</label> <input type="file"
									class="image_file_thumb" name="thumbnail" id="thumbnail"
									>
							</div>
							<div>
								<label for="spec">상세 이미지</label> <input type="file"
									class="image_file" name="spec" id="spec" multiple="multiple"
									>
							</div>
							<div>
								<div class="spec_images_wrap"></div>
							</div>
							<div>
								<label for="content">내용 이미지</label> <input type="file"
									class="image_file" name="content" id="content" >
							</div>
						</div>
						<div>
							<span class="class_info_title">강의 제목</span><br> <input
								type="text" name="onc_title" > <br>
							<p></p>
							<span class="class_info_title">강의 소개</span>
							<textarea name="onc_content" id="" rows="6" ></textarea>
							<p></p>
							<span class="class_info_title">카테고리</span> <select
								name="onc_cts_code" >
								<option value="ca">미술</option>
								<option value="cb">공예</option>
								<option value="cc">디지털 드로잉</option>
								<option value="cd">운동</option>
								<option value="ce">요리</option>
								<option value="cf">프로그래밍</option>
							</select><br>
							<p></p>
							<span class="class_info_title">난이도</span> <input type="radio"
								name="onc_level" value="초급">초급 <input type="radio"
								name="onc_level" value="중급">중급 <input type="radio"
								name="onc_level" value="고급">고급 <br>
							<p></p>
							<span class="class_info_title">가격</span> <input type="number"
								name="onc_sale" placeholder="가격" ><br>
							<p></p>
							<span class="class_info_title">수강 인원</span> <input type="number"
								name="onc_stnum" placeholder="수강 인원" ><br>
							<p></p>
							<span class="class_info_title">시작일</span> <input type="date"
								name="onc_sdate" > <span
								class="class_info_title">종료일</span> <input type="date"
								name="onc_edate" >

						</div>
						<button class="my_default_btn"
							style="float: right; margin-top: 20px;" id="addClassVideoFile"
							type="button">강의 추가</button>
						<div class="class_video_list">
							<table id="vf_list">
								<tr>
									<th>강의제목</th>
									<th>강의내용</th>
									<th>동영상</th>
								</tr>
								<tr>
									<td><input type="text" name="v_title" ></td>
									<td><input type="text" name="v_content" ></td>
									<td><input type="file" name="video_files" >
										<button type="button" class="glyphicon glyphicon-remove"
											onclick="deleteClassForm(this)"></button></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="class_form" id="ofc_form">
					<div class="class_info_form">
						<div class="class_profile_image">
							<img src="resources/images/default.jpg" alt="" class="img-circle"
								width="200px" height="200px" id="profile_img"><br>
							<div>
								<label for="thumbnail">썸네일</label> <input type="file"
									class="image_file_thumb" name="ofthumbnail" 
									>
							</div>
							<div>
								<label for="spec">상세 이미지</label> <input type="file"
									class="image_file" name="ofspec"multiple="multiple"
									>
							</div>
							<div>
								<div class="spec_images_wrap"></div>
							</div>
							<div>
								<label for="content">내용 이미지</label> <input type="file"
									class="image_file" name="ofcontent" >
							</div>
						</div>
						<div>
							<span class="class_info_title">강의 제목</span><br> <input
								type="text" name="ofc_title" > <br>
							<p></p>
							<span class="class_info_title">강의 소개</span>
							<textarea name="ofc_content" id="" rows="6" ></textarea>
							<p></p>
							<span class="class_info_title">카테고리</span> <select
								name="ofc_cts_code" >
								<option value="ca">미술</option>
								<option value="cb">공예</option>
								<option value="cc">디지털 드로잉</option>
								<option value="cd">운동</option>
								<option value="ce">요리</option>
								<option value="cf">프로그래밍</option>
							</select><br>
							<p></p>
							<span class="class_info_title">난이도</span> <input type="radio"
								name="ofc_level" value="초급">초급 <input type="radio"
								name="ofc_level" value="중급">중급 <input type="radio"
								name="ofc_level" value="고급">고급 <br>
							<p></p>
							<span class="class_info_title">가격</span> <input type="number"
								name="ofc_sale" placeholder="가격" ><br>
							<p></p>
							<span class="class_info_title">수강 인원</span> <input type="number"
								name="ofc_stnum" placeholder="수강 인원" ><br>
							<p></p>
						</div>
						<button class="my_default_btn"
							style="float: right; margin-top: 20px;" id="addClassSchedule" type="button">일정 추가</button>
						<div class="class_schedule_list">
							<table id="sche_list" class="table">
								<tr>
									<th>강의일정</th>
									<th>장소</th>

								</tr>
								<tr>
									<td><input type="datetime-local" name="sc_time" ></td>
									<td><input type="text" name="sc_place" >
									<button type="button" class="glyphicon glyphicon-remove"
											onclick="deleteClassForm(this)"></button></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<input type="submit" class="my_default_btn" style="float: right;"
					name="강의 등록"></input>
			</form>
		</article>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script>
	$("#addClassVideoFile").click(
					function() {
						$('#vf_list > tbody:last')
								.append(
										'<tr> <td><input type="text" name="v_title" >  </td>'
												+ '<td>  <input type="text" name="v_content" > </td>'
												+ '<td> <input type="file" name="video_files"  > '
												+ '<button type="button" class="glyphicon glyphicon-remove" onclick="deleteClassForm(this)"></button></td> </tr>');

					});
	$("#addClassSchedule").click(
			function() {
				$('#sche_list > tbody:last')
						.append(
								'<tr> <td><input type="datetime-local" name="sc_time" >  </td>'
										+ '<td>  <input type="text" name="sc_place" > '
										+ '<button type="button" class="glyphicon glyphicon-remove" onclick="deleteClassForm(this)"></button></td> </tr>');

			});
	function deleteClassForm(obj) {
		var tr = $(obj).parent().parent();

		tr.remove();
	}
</script>
</html>