<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/css/style.css?a">
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
</head>
<body>
	<div class="content">
		<form name="joinFrm" class="join-form" action="memberInsert" method="post" onsubmit="return check()">
			<h1 class="join-header">SINAU</h1>
			<h3 class="join-header1">회원 가입</h3>
		<div class="reaiobutton">
			<input type="radio" name="radio" id="r1" value="0"><label for="r1">일반</label>
			<input type="radio" name="radio" id="r2" value="1"><label for="r2">크리에이터</label>
  			<input type="radio" name="radio" id="r3" value="2"><label for="r3">판매자</label>
		</div>
			<input type="text" class="login-input" id="memail" title="이메일"	name="m_email" placeholder="이메일"> 
			<input type="button" class="idcheck-btn" value="중복확인" onclick="idcheck()">
			<input type="text" name="m_name" class="login-input" title="이름" 	placeholder="이름"> 
			<input type="password"	class="login-input" title="비밀번호" name="m_pwd" placeholder="비밀번호">
			<input type="text" name="m_phone" class="login-input" title="연락처"	placeholder="연락처"> 
			<input type="text" name="m_birth" class="login-input" title="생년월일" placeholder="생년월일"> 
			<input type="text" name="m_license" class="login-input" title="사업자번호"	placeholder="사업자번호">
			<input type="submit" class="login-btn" value="회원 가입">
			<input type="text" name="m_group" class="group" value="">
			<input type="hidden" name="m_state" class="state" value="1">
		</form>
	</div>
</body>
<script type="text/javascript">
	function check() {
		//form 태그의 내용을 전부 가져오기
		var frm = document.joinFrm;

		//submit 버튼을 뺀 나머지 input태그의 개수
		var length = frm.length - 1;

		//input 태그 중에 입력이 안된 요소를 확인
		for (var i = 0; i < 9; i++) {
			if (frm[i].value == "" || frm[i].value == null) {
				alert(frm[i].title + " 입력!");
				frm[i].focus();
				return false;//action이 실행 안됨.
			} 
		}
		//모든 input에 입력이 다 되었을 경우.
		return true;//action이 실행됨.
	}

	function idcheck() {
		var id = $('#memail').val();
		if (id == "") {
			alert("이메일을 입력하세요.");
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
					alert('사용 가능한 이메일입니다.');
				} else {
					alert('중복된 이메일입니다.');
					$('#memail').val('');//입력 초기화
					$('#	ㅂmemail').focus();//ID 부분에 포커스 주기
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
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
</html>
