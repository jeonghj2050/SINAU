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

.pwd {
	background-color: #ddd;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="resources/css/home.css?a">
</head>
<body>
	<div class="ibbox">
		<div class="memberinfo-header">
			<h1>
				<a href="./">SINAU</a>
			</h1>
			<h2>
				<a>이메일 찾기/비밀번호 변경</a>
			</h2>
		</div>
		<div class="member_box">
			<div class="member_tab">
				<a href="id">이메일 찾기</a> <a href="pwd" class="pwd">비밀번호 변경</a>
			</div>
			<div class="member_content">
				<div class="contents">
					<form class="memberinfo-form" action="idfind" method="post">
						<input type="text" class="idfind" id="mname" name="m_name"
							placeholder="이름"> <input type="text" class="idfind"
							id="mphone" name="m_phone" placeholder="전화번호"> <input
							type="submit" class="id-btn" value="이메일 찾기">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>