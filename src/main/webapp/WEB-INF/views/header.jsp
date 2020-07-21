<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="top-bar"> 
		<div class="content">
			<img class="logo" src="resources/images/SINAU_logo.png" 
				onclick="gohome();">
			<input type="text" class="search"></input>
			<nav class="top-right">
				<ul>
					<li class="suc" id="mname">테스트님</li>
					<li class="bef"><a href="./loginFrm">로그인</a></li>
					<li class="suc"><a href="./logout">로그아웃</a></li>
					<li class="bef"><a href="./joinFrm">회원가입</a></li>
				</ul>
			</nav>
		</div>
		<div class="menu">
			<nav class="menu-bar">
				<ul>
					<li class="menu"><a href="./online">온라인</a></li>
					<li class="menu"><a href="./offline">오프라인</a></li>
					<li class="menu"><a href="./store">스토어</a></li>
				</ul>
			</nav>
			<nav class="menu-bar1">
				<ul class="sub">
					<li class="menusub"><a href="./youtube">유투버</a></li>
				</ul>
			</nav>
		</div>
	</div>
	
	
<script>
function gohome(){
	var id = '${mb.m_id}';
	
	if(id == ''){
		location.href='./';
	}	
	else if(id != ''){
		location.href='./list';
	}
}
</script>