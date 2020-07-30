<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="resources/css/style.css?a">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
html {
	background-color: #f1f1f1 
}
#modal {
  display : none;
  position:relative;

  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
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
			<h1 class="join-header"><a href="./">SINAU</a></h1>
			<h3 class="join-header1"><a href="./">로그인</a></h3>
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