<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css?a">
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
</head>
<body>
	<div class="wrap">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<section>
			<div class="content">
				<form name="joinFrm" class="login-form" action="memInsert"
					method="post" onsubmit="return check()">
					<h2 class="login-header">회원 가입</h2>
					<input type="text" class="login-input" id="email" title="이메일" name="m_email" autofocus placeholder="이메일"> 
					<input type="button" class="idcheck-btn" value="중복확인" onclick="idcheck()">
					<input type="password" class="login-input" title="비밀번호" name="m_pwd" placeholder="비밀번호"> 
					<input type="text"name="m_name" class="login-input" title="이름" placeholder="이름">
					<input type="text" name="m_phone" class="login-input" title="연락처" placeholder="연락처">
					<input type="text" name="m_birth" class="login-input" title="생일" placeholder="생일">
					<input type="text" name="m_license" class="login-input" title="사업자번호" placeholder="사업자번호"> 
					<input type="submit" class="login-btn" value="가입">
				</form>
			</div>
		</section>
		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
<script type="text/javascript">
	function check() {
		//form 태그의 내용을 전부 가져오기
		var frm = document.joinFrm;

		//submit 버튼을 뺀 나머지 input태그의 개수
		var length = frm.length - 1;

		//input 태그 중에 입력이 안된 요소를 확인
		for (var i = 0; i < 5 ; i++) {
			if (frm[i].value == "" || frm[i].value == null) {
				alert(frm[i].title + " 입력!");
				frm[i].focus();
				return false;//action이 실행 안됨.
			}
		}
		//모든 input에 입력이 다 되었을 경우.
		return true;//action이 실행됨.
	}

	//아이디 중복 여부 확인 함수
	//이 함수의 ajax를 실행하기 위해서 
	//인터셉터 대상에서 제외해야 함.
	//servlet-context.xml에 exclude-mapping을 처리.
	function idcheck() {
		var email = $('#memail').val();
		if (email == "") {
			alert("아이디를 입력하세요.");
			$('#memail').focus();
			return;
		}
		var ckObj = {
			"memail" : email
		};
		console.log(ckObj);

		$.ajax({
			url : "emailCheck",
			type : "get",
			data : ckObj,
			success : function(data) {
				if (data == "success") {
					alert('E-mail 사용 가능');
				} else {
					alert('사용할 수 없는 ID');
					$('#memail').val('');//입력 초기화
					$('#memail').focus();//ID 부분에 포커스 주기
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
</script>
</html>
