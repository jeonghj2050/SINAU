<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="resources/css/style.css?a">
<style type="text/css">
html {
	background-color: #f1f1f1 
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
<style>
</style>
</head>
<body>
	<div class="loginbox">
		<form class="login-form" action="access" method="post">
			<h1 class="join-header">SINAU</h1>
			<h3 class="join-header1">로그인</h3>
			<h4>E-MAIL</h4>
			<input type="text" class="login_input" name="m_email" placeholder="example@naver.com"></input>
			<h4>PASSWORD</h4>
			<input type="password" class="login-input" name="m_pwd" placeholder="********"><br>
			<a href="">아이디 찾기</a>&nbsp;|&nbsp;<a href="">비밀번호 찾기</a>&nbsp;|&nbsp;<a href="./joinFrm">SINAU 회원가입</a><br>
			<input type="submit" class="login-btn" value="로그인">
			<hr width="350">
		<img src="resources/images/loginbottom.PNG">
		<p>최초 로그인 시 <br>
		<a href="">이용약관</a>과 <a href="">개인정보 처리방침</a>에 동의하는 것으로 간주합니다.</p>
		</form>
		
	</div>
</body>
</html>