<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="top-bar">
	<div class="content">
		<img class="logo" src="resources/images/SINAU_logo.png"
			onclick="gohome();"> <input type="text" class="search" placeholder="검색"></input>
		<nav class="top-right">
			<ul>
				<li class="suc" id="mname">테스트님</li>
				<li class="suc"><a href="./logout">로그아웃</a></li>
				<li class="bef"><a href="./loginFrm">로그인</a></li>
				<li class="bef"><a href="./joinFrm">회원가입</a></li>
				<li class="suc"><a href="./mypage">마이페이지</a></li>
			</ul>
		</nav>
	</div>
		<div class="menu">
		<nav class="menu-bar">
			<ul>
				<li class="menu"><a href="./online">회원 관리</a></li>
				<li class="menu"><a href="./offline">게시글 관리</a></li>
				<li class="menu"><a href="./servicecenter_main">고객센터</a></li>
			</ul>
		</nav>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	var id = '${mb.m_email}';
	 	
		if("${mb.m_email}" != '') {
			var name = "${mb.m_name}";
			$('#mname').html(name + '님');
			$('.suc').css('display','block');
			$('.bef').css('display','none');
			}
});
</script>
<script type="text/javascript">
function gohome(){
	var id = '${mb.m_email}';
	
	if(id == ''){
		location.href='./';
	}	
	else if(id != ''){
		location.href='./';
	}
} 
</script>