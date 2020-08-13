<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/css/home.css?a">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
	
<style type="text/css">
html {
   background-color: #f1f1f1 
}
</style>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var msg = "${msg}";
	console.log(msg);
	if(msg != ""){
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
			<input type="radio" name="radio" id="r1" value="0" checked="checked"><label for="r1">일반</label>&nbsp;
			<input type="radio" name="radio" id="r2" value="1"><label for="r2">크리에이터</label>&nbsp;
  			<input type="radio" name="radio" id="r3" value="2"><label for="r3">판매자</label>
		</div><br>	
		<form name="joinFrm" id="join" class="join-form" action="memberInsert" method="post" onsubmit="return validate()"enctype="multipart/form-data">
		
		<!-- <div class="img-box">
				<img class="img" id=m_photo name="m_photo" src="resources/images/user.png" width="100" height="100"><br>
				<input type="file" name="filename1" size=40>
		</div> -->
		<div class="profile_image">
						<img src="resources/images/user.png" alt=""
							class="img-circle" width="100px" height="100px" id="profile_img"><br>
						<div>
							<label for="file"></label> 
							<input type="file" name="files" id="member_profile" title="프로필이미지"> 
							<input type="hidden" id="filecheck" value="0" name="fileCheck">
						</div>
						</div>
			<input type="text" class="login-input" id="memail" title="이메일"	name="m_email" placeholder="이메일 ">
			<br>
			<font id="chkNotice1" size="2"></font>
			<input type="button" class="idcheck-btn" value="중복확인" onclick="idcheck()"><br>
			<input type="text" name="m_name" id="mname" class="login-input" title="이름" 	placeholder="이름"> 
			<input type="password"	id="password1" class="login-input" title="비밀번호" name="m_pwd" placeholder="비밀번호">
			<input type="password"	id="password2" class="login-input" title="비밀번호 재확인" placeholder="비밀번호확인"><br>
				<span style="height: 25px;"></span>
				<font id="chkNotice" size="2"></font><br>
			<input type="text" name="m_group" class="group" value="nm" title="회원 체크">
			<input type="text" name="m_state" class="state" value="2">
			<input type="text" id="phone" name="m_phone" class="login-input" title="연락처"	placeholder="연락처"> 
			<input type="text" id="birth" name="m_birth" class="login-input" title="생년월일" placeholder="생년월일">
			<input type="text" id="license" name="m_license" class="login-input" title="사업자번호"	placeholder="사업자번호" disabled><br>
			<input type="submit" class="login-btn" value="회원 가입"><input type="reset" class="relgoin-btn" value="다시 작성">
			
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
	              $("input:text[name=m_state]").attr("value", "1");
	            // radio 버튼의 value 값이 1이라면 활성화
	 
	        }else if($("input[name=radio]:checked").val() == "1"){
	              $("input:text[name=m_license]").attr("disabled",true);
	              $("input:text[name=m_group]").attr("value", "cm");
	              $("input:text[name=m_state]").attr("value", "1");
	            // radio 버튼의 value 값이 0이라면 비활성화
	        }else if($("input[name=radio]:checked").val() == "0"){
	              $("input:text[name=m_license]").attr("disabled",true);
	              $("input:text[name=m_group]").attr("value", "nm");
	              $("input:text[name=m_state]").attr("value", "2");
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
<script type="text/javascript">
function validate() {
	
	var objEmail = document.getElementById("memail");
	var objName = document.getElementById("mname");
	var objPwd1 = document.getElementById("password1");
	var objPwd2 = document.getElementById("password2");
	var objPhone = document.getElementById("phone");
	var objBirth = document.getElementById("birth");
	var objLicense = document.getElementById("license");
	var objGroup = document.getElementById("group");
	
	var regul1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	
	var regul2 = /^[a-zA-Z0-9]{5,20}$/;
	
	var regul3 = /^[가-힝a-zA-Z]{2,}$/;
	
	var regul4 = /^[0-9]{4,20}$/;
	
	if (!check(regul1,objEmail,"이메일을 잘못 입력 했습니다.ex)ooooooo@ooooo.ooo")) {
		$('#memail').val('');//입력 초기화
		$('#memail').focus();//입력 초기화
		return false;
	}
	
	if ((objEmail.value)== "") {
		alert("이메일을 입력해주세요.");
		$('#memail').focus();//ID 부분에 포커스 주기
		return false;
	}
	
	if (!check(regul3,objName, '이름이 잘못 되었습니다(특수문자 X)')) {
		$('#mname').val('');//입력 초기화
		$('#mname').focus();//입력 초기화
		return false;
	} 
	
	if ((objName.value)=="") {
		alert("이름을 입력해주세요.");
		$('#mname').focus();//ID 부분에 포커스 주기
		return false;
	}
	
	if((objPwd1.value)== "") {
		alert("비밀번호를 입력해 주세요");
		$('#password1').focus();//ID 부분에 포커스 주기
		return false;
	}
	
	if((objPwd2.value)== "") {
		alert("비밀번호를 재입력해주세요.");
		$('#password2').focus();//ID 부분에 포커스 주기
		return false;
	}
	
	if (!check(regul2,objPwd1, '비밀번호는 4~12자의 대소문자와 숫자로만 입력 가능합니다.')) {
		$('#password1').val('');//입력 초기화
        return false;
    }
	
	if (!check(regul4,objPhone, "전화번호를 잘못입력했습니다.")) {
		$('#mphone').val('');//입력 초기화
		$('#mphone').focus();//입력 초기화
		return false;
	}
	
	if ((objGroup.value)== "") {
		$('#chkNotice1').html('회원분류를 선택해 주세요.');
        $('#chkNotice1').attr('color', '#f82a2aa3');
        objGroup.focus();
        return false;
	}
	if ((objGroup.value) == "dm" && (objLicense.value)=="") {
		$('#chkNotice7').html('사업자번호를 입력바랍니다.');
        $('#chkNotice7').attr('color', '#f82a2aa3');
        objLicense.focus();
        return false;
	} 
	
    alert("회원가입이 완료되었습니다.");
}

function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
}
</script>

</html>
