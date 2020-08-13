<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="top-bar">
	<div class="content">
		<a href="./adMApproval"><img class="logo" src="resources/images/SINAU_logo.png"></a>
		 <input type="text" class="search"></input>
		<nav class="top-right">
			<ul>
				<li class="suc" id="mname">테스트님</li>
				<li class="suc"><a href="./logout">로그아웃</a></li>
				<!-- <li class="bef"><a href="./loginFrm">로그인</a></li> -->
				<li class="bef"><a href="./joinFrm">회원가입</a></li>
				<!-- <li class="suc"><a href="./mypage">마이페이지</a></li> -->
			</ul>
		</nav>
	</div>
	<div class="menu">
		<nav class="menu-bar">
			<ul>
				<li class="menu"><a href="./adMApproval">회원관리</a></li>
				<li class="menu"><a href="./adPLecture">게시글관리</a></li>
				<li class="menu"><a href="./adSQna">고객센터</a></li>
			</ul>
		</nav>
		<nav class="menu-bar1">
			<ul class="sub">
				<li class="adminlogo">관리자모드</li>
			</ul>
		</nav>
	</div>
</div>


<script type="text/javascript">-
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