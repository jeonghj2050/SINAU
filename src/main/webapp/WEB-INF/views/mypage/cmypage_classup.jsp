<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU 강의 수정</title>
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
		$(".image_file").on("change", fileSelect);
	});
	$(document).ready(function() {
		$(".image_file_thumb").on("change", fileSelectThumb);
	});
	$(document).ready(function(){
		$('#uspec').on("change",handleMultiThumb);
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
			<div class="page-title">강의 수정</div>
			<div class="class_sort">
				<div style="background-color:rgb(204,204,204);">온라인</div>
			</div>
			
			<form method="post" enctype="multipart/form-data">
				<c:if test="${sort eq 'onc' }">
					<div class="class_sort">
						<div style="background-color: rgb(204, 204, 204);">온라인</div>
					</div>
					<input type="hidden" value=${classInfo.onc_code } name="onc_code" />
					<input type="hidden" value="onc" name="class_sort" />
					<div class="class_form" id="onc_form">
						<div class="class_info_form">
							<div class="class_profile_image">
								<img src="resources/upload/${classInfo.f_sysname }" alt=""
									class="img-circle" width="200px" height="200px"
									id="profile_img"><br>
							</div>
							<div>
								<span class="class_info_title">강의 제목</span><br> <input
									type="text" name="onc_title" value="${classInfo.onc_title }">
								<br>
								<p></p>
								<span class="class_info_title">강의 소개</span>
								<textarea name="onc_content" id="" rows="6">${classInfo.onc_content }</textarea>
								<p></p>
								<span class="class_info_title">카테고리</span> <select
									name="onc_cts_code">
									<option value="ca"
										<c:if test="${classInfo.onc_cts_code eq 'ca'}">selected</c:if>>미술</option>
									<option value="cb"
										<c:if test="${classInfo.onc_cts_code eq 'cb'}">selected</c:if>>공예</option>
									<option value="cc"
										<c:if test="${classInfo.onc_cts_code eq 'cc'}">selected</c:if>>디지털
										드로잉</option>
									<option value="cd"
										<c:if test="${classInfo.onc_cts_code eq 'cd'}">selected</c:if>>운동</option>
									<option value="ce"
										<c:if test="${classInfo.onc_cts_code eq 'ce'}">selected</c:if>>요리</option>
									<option value="cf"
										<c:if test="${classInfo.onc_cts_code eq 'cf'}">selected</c:if>>프로그래밍</option>
								</select><br>
								<p></p>
								<span class="class_info_title">난이도</span> <input type="radio"
									name="onc_level" value="초급"
									<c:if test="${classInfo.onc_level eq '초급'}">checked</c:if>>초급
								<input type="radio" name="onc_level" value="중급"
									<c:if test="${classInfo.onc_level eq '중급'}">checked</c:if>>중금
								<input type="radio" name="onc_level" value="고급"
									<c:if test="${classInfo.onc_level eq '고급'}">checked</c:if>>고급
								<br>
								<p></p>
								<span class="class_info_title">가격</span> <input type="number"
									name="onc_sale" placeholder="가격" value=${classInfo.onc_sale }><br>
								<p></p>
								<span class="class_info_title">수강 인원</span> <input type="number"
									name="onc_stnum" placeholder="수강 인원"
									value="${classInfo.onc_stnum }"><br>
								<p></p>
								<span class="class_info_title">시작일</span> <input type="date"
									name="onc_sdate"
									value="<fmt:formatDate pattern="yyyy-MM-dd" value="${classInfo.onc_sdate}"/>">
								<span class="class_info_title">종료일</span> <input type="date"
									name="onc_edate"
									value="<fmt:formatDate pattern="yyyy-MM-dd" value="${classInfo.onc_edate}"/>">
								<button type="submit" class="my_default_btn"
									style="float: right;" formaction="./cMyClassOnInfo">강의
									수정</button>
							</div>
							<button class="my_default_btn"
								style="float: right; margin-top: 20px;" id="addClassVideoFile"
								type="button">동영상 폼 추가</button>
							<div class="class_video_list">
								<table id="vf_list">
									<tr>
										<th>동영상제목</th>
										<th>동영상내용</th>
										<th>동영상</th>
									</tr>
									<c:forEach var="video" items="${videoList }">
										<tr class=${video.vf_code }>
										
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					<div>
						<span class="class_info_title">강의 제목</span><br> 
						<input type="text" name="onc_title" value="${classInfo.onc_title }" > <br>
						<p></p>
						<span class="class_info_title">강의 소개</span>
						<textarea name="onc_content" id="" rows="6" >${classInfo.onc_content }</textarea>
						<p></p>
						<span class="class_info_title">카테고리</span> 
						<select name="onc_cts_code" >
							<option value="ca"<c:if test="${classInfo.onc_cts_code eq 'ca'}">selected</c:if>>미술</option>
							<option value="cb"<c:if test="${classInfo.onc_cts_code eq 'cb'}">selected</c:if>>공예</option>
							<option value="cc"<c:if test="${classInfo.onc_cts_code eq 'cc'}">selected</c:if>>디지털 드로잉</option>
							<option value="cd"<c:if test="${classInfo.onc_cts_code eq 'cd'}">selected</c:if>>운동</option>
							<option value="ce"<c:if test="${classInfo.onc_cts_code eq 'ce'}">selected</c:if>>요리</option>
							<option value="cf"<c:if test="${classInfo.onc_cts_code eq 'cf'}">selected</c:if>>프로그래밍</option>
						</select><br>
						<p></p>
						<span class="class_info_title">난이도</span> 
						<input type="radio" name="onc_level" value="초급" <c:if test="${classInfo.onc_level eq '초급'}">checked</c:if>>초급
						<input type="radio" name="onc_level" value="중급" <c:if test="${classInfo.onc_level eq '중급'}">checked</c:if>>중금 
						<input type="radio" name="onc_level" value="고급" <c:if test="${classInfo.onc_level eq '고급'}">checked</c:if>>고급 <br>
						<p></p>
						<span class="class_info_title">가격</span> <input type="number"
							name="onc_sale" placeholder="가격" value=${classInfo.onc_sale } ><br>
						<p></p>
						<span class="class_info_title">수강 인원</span> <input type="number"
							name="onc_stnum" placeholder="수강 인원" value="${classInfo.onc_stnum }" ><br>
						<p></p>
						<span class="class_info_title">시작일</span> 
						<input type="date" name="onc_sdate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${classInfo.onc_sdate}"/>" > 
						<span class="class_info_title">종료일</span>
						<input type="date" name="onc_edate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${classInfo.onc_edate}"/>" >
						<button type="submit" class="my_default_btn" style="float:right;" formaction="./cMyClassOnInfo">강의 수정</button>
					</div>
					<button class="my_default_btn" style="float: right;margin-top:20px;"
							id="addClassVideoFile" type="button" >동영상 폼 추가</button>
					<div class="class_video_list">
						<table id="vf_list">
							<tr>
								<th>동영상제목</th>
								<th>동영상내용</th>
								<th>동영상</th>
							</tr>			
							<c:forEach var="video" items="${videoList }">
								<tr class=${video.vf_code }>
									<input type="hidden" name="vf_v_code" value ="${videoList[0].vf_v_code }"></input>
									<td><input type="text" name="v_title" class="v_title" value="${video.v_title }" ></td>
									<td><input type="text" name="v_content" class="v_content"  value="${video.v_content }" ></td>
									<td><span id="vf_oriname">${video.vf_oriname }</span><button type="button" onclick="deleteFile(this)">삭제</button>
									<button type="button" onclick="updateFile(this)">수정</button>
									<input type="file" name="video_files" >
									</td>
								</tr>
							</c:forEach>
							
						</table>
						
					</div>														
				</div>
			</div>
			<button type="submit" class="my_default_btn" style="float: right;" formaction="./cMyClassVideo">동영상 등록</button>
			
			</form>
		</article>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
    $("#addClassVideoFile").click(function(){
        $('#vf_list > tbody:last').append('<tr> <td><input type="text" name="uv_title" >  </td>'+
                                '<td>  <input type="text" name="uv_content" > </td>'+
                                '<td> <input type="file" name="upvideo_files" > </td> </tr>');

    });
    
    /* 특정 파일을 db에서 삭제하고 해당 컬럼을 제거 */
    function deleteFile(obj){
    	/* 삭제 할 파일 코드 */
    	var vf_code=$(obj).parent().parent().attr('class');
    
    	var objData={"vf_code":vf_code};
    	
    	$.ajax({
    		url:"deleteClassVideo",
    		type:"post",
    		data:objData,
    		dataType:"json",
    		success:function(data){
    			var tr=$(obj).parent().parent();
    		    tr.remove();
    		    
    			if(data.equals('success')){
    				alert('동영상 삭제 완료');
    			}else{
    				alert('동영상 삭제 실패');
    			}
    		},
    		error : function(error){
				console.log(error);
			}
    	});
    }
    /* 특정 파일을 db에서 수정*/
    function updateFile(obj){
    	/* 수정 할 파일 코드 */
    	var vf_code=$(obj).parent().parent().attr('class');
    	var v_title=$('.'+vf_code+' .v_title').val();
    	var v_content=$('.'+vf_code+' .v_content').val();
    	
    	var formData=new FormData();
    	var inputFile=$('.'+vf_code+' input[name="video_files"]');
    	
    	var files=inputFile[0].files;
    	console.log(files)
    	
    	for(var i=0;i<files.length;i++){
    		formData.append('updateFiles',files[i]);
    	}

    	formData.append("vf_code",vf_code);
    	formData.append("v_title",v_title);
    	formData.append("v_content",v_content);
    	
    	$.ajax({
    		contentType:false,
    		processData:false,
    		url:"updateClassVideo",
    		type:"post",
    		data:formData,
    		success:function(data){
    			var video=data;
    			
    			var videoInfo='<tr class="'+video.vf_code+'>'+
					'<input type="hidden" name="'+video.vf_v_code+'" value ="'+video.vf_v_code+'"></input>'+
					'<td><input type="text" name="v_title" value="'+video.v_title+'" ></td>'+
					'<td><input type="text" name="v_content"  value="'+video.v_content +'" ></td>'+
					'<td>'+video.vf_oriname+'<button type="button" onclick="deleteFile(this)">삭제</button>'+
					'<button type="button" onclick="updateFile(this)">수정</button>'+
					'<input type="file" name="video_files"  >'+
					'</td></tr>'
				
    			$('.'+vf_code+' .v_title').val(video.v_title);
    			$('.'+vf_code+' .v_content').val(video.v_content);
    			$('.'+vf_code+' #vf_oriname').html(video.vf_oriname);
				inputFile.val('');
    		},
    		error : function(error){
				console.log(error);
			}
    	});
    }
</script>
</html>