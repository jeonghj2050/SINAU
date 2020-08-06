<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	var name="${mb.m_group}";
	console.log(name);
</script>
<nav>
	<div>
		<div>
			<a href="./mypageUpdate"> <img
				src="resources/upload/${ memImg.mimg_sysname }" alt=""
				width="140px" height="110px" class="img-circle">
			</a>
		</div>
		<div>
			<button class="my_default_btn"
				onclick="location.href='./mypageCoupon'">쿠폰</button>
			<span>경고누적횟수 : 0</span>
		</div>
	</div>
	<ul class="list-group">
		<c:choose>
			<c:when test="${mb.m_group eq'cm'}">
				<li class="list-group-item"><a href="./cMypage">내 클래스</a></li>
				<li class="list-group-item"><a href="./cMypageQnA">질문게시판</a></li>
				<li class="list-group-item"><a href="./cMyNewClass">내 강의 등록/수정</a></li>
				<hr>
			</c:when>
		</c:choose>
		<c:if test="${mb.m_group eq 'dm'}">
			<li class="list-group-item"><a href="./dMypage">등록된 상품</a></li>
		</c:if>
		<c:if test="${mb.m_group eq 'cm' || mb.m_group eq 'nm'}">
			<li class="list-group-item"><a href="./mypage">온라인 강의</a></li>
			<li class="list-group-item"><a href="./mypageOffline">오프라인 강의</a></li>
			<li class="list-group-item"><a href="./mypageOrder">내 주문내역</a></li>
			<li class="list-group-item"><a href="./like">좋아요</a></li>
		</c:if>
		
	</ul>
</nav>
