<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="resources/css/style.css?a">
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
section {
	width : 1300px;
	height: 800px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	<section>
		<div class="loginbox">
			<form class="login-form" action="access" method="post">
				<h1 class="login-header">로그인</h1>
				<br>
				<br>
				<h4>E-MAIL</h4>
				<input type="text" class="login_input"
					name="m_email"></input><br>
				<h4>PASSWORD</h4>
				<input type="password" class="login-input" 
				name="m_pwd"><br>
				<a href="">비밀번호가 기억나지 않으세요?</a>
				<a href="./joinFrm">SINAU 회원가입</a><br>
				<input type="submit" class="login-btn" value="로그인">
			</form>
		</div>
	</section>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>