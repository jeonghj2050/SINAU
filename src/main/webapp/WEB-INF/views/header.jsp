<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="top-bar">
	<div class="content">
		<img class="logo" src="resources/images/SINAU_logo.png"
			onclick="gohome();"> <input type="text" class="search"></input>
		<nav class="top-right">
			<ul>
				<li class="suc" id="mname">테스트님</li>
				<li class="suc"><a href="./logout">로그아웃</a></li>
				<li class="bef"><a href="./loginFrm">로그인</a></li>
				<li class="bef"><a href="./joinFrm">회원가입</a></li>
				<c:choose>
					<c:when test="${mb.m_group eq'cm'}">
						<li class="suc"><a href="./cMypage">마이페이지</a></li>
					</c:when>
				</c:choose>
				<c:if test="${mb.m_group eq 'nm'}">
					<li class="suc"><a href="./mypage">마이페이지</a></li>
				</c:if>
				<c:if test="${mb.m_group eq 'dm'}">
					<li class="suc"><a href="./dMypage">마이페이지</a></li>
				</c:if>
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