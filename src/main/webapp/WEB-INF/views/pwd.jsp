<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
<style type="text/css">
html {
	background-color: #f1f1f1 
}
.id {
	background-color: #ddd;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="resources/css/home.css?a">
<style>
</style>
</head>
<body>
	<div class="ibbox">
		<div class="memberinfo-header">
			<h1>
				<a href="./">SINAU</a>
			</h1>
			<h2>
				<a>이메일/비밀번호 찾기</a>
			</h2>
		</div>
		<div class="member_box">
			<div class="member_tab">
				<a href="id" class="id">이메일 찾기</a> 
				<a href="pwd">비밀번호 찾기</a>
			</div>
			<div class="member_content">
				<div class="contents">
					<form class="memberinfo-form" action="pwdfind" method="post">
						<input type="text" class="idfind" id="memail" name="email" placeholder="이메일">
						<input type="password" class="idfind" id="password1" name="pwd" placeholder="새 비밀번호">
						<input type="password" class="idfind" id="password2" name="pwd2" placeholder="새 비밀번호 재확인">
						<span style="height: 25px;"></span>
						<font id="chkNotice1" size="2"></font><br>
						<input type="submit" class="pw-btn" value="비밀번호 변경">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function validate() {
	
	var objPwd1 = document.getElementById("password1");
	var objPwd2 = document.getElementById("password2");
	
	var regul2 = /^[a-zA-Z0-9]{4,12}$/;
	
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
	function check(re,what,message){//정규화데이터,아이템 id,메세지
        if (re.test(what.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
        //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
            return true;
        }
        alert(message);
        what.value = "";
        what.focus();
    }
}
</script>
<script  type="text/javascript">
$(function(){
    $('#password1').keyup(function(){
      $('#chkNotice').html('');
      $('#password2').val('');
    });

    $('#password2').keyup(function(){
        if($('#password1').val() != $('#password2').val()){
          $('#chkNotice1').html('비밀번호 일치하지 않음');
          $('#chkNotice1').attr('color', '#f82a2aa3');
        } else{
          $('#chkNotice1').html('비밀번호 일치함');
          $('#chkNotice1').attr('color', '#199894b3');
        }
    });
});
</script>
</html>