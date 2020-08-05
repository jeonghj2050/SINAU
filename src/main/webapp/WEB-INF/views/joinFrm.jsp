<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/css/store.css?a">
<style type="text/css">
html {
	background-color: #f1f1f1 
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var msg = "${msg}";
	console.log(msg);
	if (msg != "") {
		alert(msg);
		location.reload(true);
	}
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
</head>
<body>
	<div class="content1">
		<h1 class="join-header">SINAU</h1>
			<h3 class="join-header1">회원 가입</h3>
		<div class="reaiobutton">
			<input type="radio" name="radio" id="r1" value="0"><label for="r1">일반</label>&nbsp;
			<input type="radio" name="radio" id="r2" value="1"><label for="r2">크리에이터</label>&nbsp;
  			<input type="radio" name="radio" id="r3" value="2"><label for="r3">판매자</label>
		</div><br>	
		<form name="joinFrm" id="join" class="join-form" action="memberInsert" method="post" onsubmit="return check()">
		
		<!-- <div class="img-box">
				<img class="img" id=m_photo name="m_photo" src="resources/images/user.png" width="100" height="100"><br>
				<input type="file" name="filename1" size=40>
		</div> -->
		<div class="profile_image">
						<img src="resources/images/user.png" alt=""
							class="img-circle" width="100px" height="100px" id="profile_img"><br>
						<div>
							<label for="file"></label> <input type="file" name="files"
								id="member_profile"> <input type="hidden" id="filecheck"
								value="0" name="fileCheck">
						</div>
						</div>
			<input type="text" class="login-input" id="memail" title="이메일"	name="m_email" placeholder="이메일  ex)example@ooooo.com">
			<br>
			<font id="chkNotice1" size="2"></font>
			<input type="button" class="idcheck-btn" value="중복확인" onclick="idcheck()"><br>
			<input type="text" name="m_name" id="mname" class="login-input" title="이름" 	placeholder="이름"> 
			<input type="password"	id="password1" class="login-input" title="비밀번호" name="m_pwd" placeholder="비밀번호">
			<input type="password"	id="password2" class="login-input" title="비밀번호 재확인" placeholder="비밀번호확인"><br>
				<span style="height: 25px;"></span>
				<font id="chkNotice" size="2"></font><br>
			<input type="text" id="phone" name="m_phone" class="login-input" title="연락처"	placeholder="연락처 ex)01000000000"> 
			<input type="text" id="birth" name="m_birth" class="login-input" title="생년월일" placeholder="생년월일  ex)00000000">
			<input type="text" id="license" name="m_license" class="login-input" title="사업자번호"	placeholder="사업자번호"><br>
			<input type="submit" class="login-btn" value="회원 가입"><input type="reset" class="relgoin-btn" value="다시 작성">
			<input type="text" name="m_group" class="group" value="">
			<input type="hidden" name="m_state" class="state" value="1">
		</form>
	</div>
</body>
<script type="text/javascript">
function idcheck() {
	var id = $('#memail').val();
	if (id == "") {
		$('#memail').focus();
		return;
	}
	var ckObj = {
		"memail" : id
	};
	console.log(ckObj);

		$.ajax({
			url : "idCheck",
			type : "get",
			data : ckObj,
			success : function(data) {
				if (data == "success") {
					$('#chkNotice1').html('사용가능한 이메일입니다');
			        $('#chkNotice1').attr('color', '#199894b3');
				} else {
					$('#memail').val('');//입력 초기화
					$('#memail').focus();//ID 부분에 포커스 주기
					$('#chkNotice1').html('중복된 이메일입니다');
			        $('#chkNotice1').attr('color', '#f82a2aa3');
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
}
</script>
<script  type="text/javascript">
	$(document).ready(function(){
		 
	    // 라디오버튼 클릭시 이벤트 발생
	    $("input:radio[name=radio]").click(function(){
	 
	        if($("input[name=radio]:checked").val() == "2"){
	            $("input:text[name=m_license]").attr("disabled",false);
	              $("input:text[name=m_group]").attr("value", "dm");
	            // radio 버튼의 value 값이 1이라면 활성화
	 
	        }else if($("input[name=radio]:checked").val() == "1"){
	              $("input:text[name=m_license]").attr("disabled",true);
	              $("input:text[name=m_group]").attr("value", "cm");
	            // radio 버튼의 value 값이 0이라면 비활성화
	        }else if($("input[name=radio]:checked").val() == "0"){
	              $("input:text[name=m_license]").attr("disabled",true);
	              $("input:text[name=m_group]").attr("value", "nm");
		            // radio 버튼의 value 값이 0이라면 비활성화
		        }
	    });
	});
</script>
<script  type="text/javascript">
	$(function(){
	    $('#password1').keyup(function(){
	      $('#chkNotice').html('');
	      $('#password2').val('');
	    });

	    $('#password2').keyup(function(){
	        if($('#password1').val() != $('#password2').val()){
	          $('#chkNotice').html('비밀번호 일치하지 않음');
	          $('#chkNotice').attr('color', '#f82a2aa3');
	        } else{
	          $('#chkNotice').html('비밀번호 일치함');
	          $('#chkNotice').attr('color', '#199894b3');
	        }
	    });
	});
</script>

<script  type="text/javascript">
	function mgcheck(){
	//form 태그의 내용을 전부 가져오기
	var frm = document.joinFrm;
	
	//submit 버튼을 뺀 나머지 input태그의 개수
	var length = frm.length - 1;
	
	//input 태그 중에 입력이 안된 요소를 확인
	for(var i = 0; i < 11; i++){
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
<script  type="text/javascript">
$(document).ready(function(){
	$('#photo').change(function(event){
		var tmppath=URL.createObjectURL(event.target.files[0]);
		$('#m_photo').attr('src',tmppath);
	});
});
</script>
</html>
