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
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
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
			<div class="page-title">상품 등록</div>
			<form action="./dMyNewProd" method="post" enctype="multipart/form-data">
				<div class="class_form" id="onc_form">
					<div class="class_info_form">
						<div class="class_profile_image">
							<img src="resources/images/default.jpg" alt="" class="img-circle"
								width="200px" height="200px" id="profile_img"><br>
							<div>
								<label for="thumbnail">썸네일</label> 
								<input type="file" class="image_file_thumb" name="pthumbnail">
							</div>
							<div>
								<label for="spec">상세 이미지</label> 
								<input type="file" class="image_file" id="spec" name="pspec" multiple="multiple">
							</div>
							<div>
								<div class="spec_images_wrap"></div>
							</div>
							<div>
								<label for="content">내용 이미지</label> 
								<input type="file" class="image_file" name="pcontent">
							</div>
						</div>
						<div>
							<span class="class_info_title">상품 제목</span><br> <input
								type="text" name="p_title"><br>
							<p></p>
							<span class="class_info_title">카테고리</span> <select
								name="p_cts_code">
								<option value="ca">art</option>
								<option value="cb">craft</option>
								<option value="cc">digital drawing</option>
								<option value="cd">exercise</option>
								<option value="ce">programming</option>
								<option value="cf">cooking</option>
							</select><br>
							<p></p>
							<span class="class_info_title">가격</span> <input type="number"
								name="p_price" placeholder="가격"><br>
							<p></p>
							<span class="class_info_title">수량</span> <input type="number"
								name="p_amount" placeholder="수량"><br>
							<p></p>
						</div>
						<div style="float:right; margin-top:10px;">
							<input type="submit" class="my_default_btn" value="상품등록">
						</div>
					</div>
				</div>
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