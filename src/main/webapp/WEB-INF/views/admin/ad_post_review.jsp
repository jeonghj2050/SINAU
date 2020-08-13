<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/adstyle.css?ver=1.3">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>관리자 페이지 게시글관리(리뷰)</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
var codetemp = '';
	$(document).ready(function() {
		$('.popupD').hide();

		//$('.btn-1').click(function() {
		//	$('.popupD').show();
		//})
		$('.fsyYOM').click(function() {
			$('.popupD').hide();
		})
		$('#pn').click(function() {
			$('.popupD').hide();
		})
		$('#py').click(function() {
			console.log(codetemp);
			$('.popupD').hide();
			$('.btn-1').hide();
			
			location.href='./delRe?code='+codetemp;
			codetemp = '';
		})
	})
</script>
</head>
<body>
	<!-- 나중에 헤더는 따로 뺄것 -->
	<header>
		<jsp:include page="../adHeader.jsp"></jsp:include>
	</header>
	<section>
		<div class="postCate menuCate">
			<h2 id="adPManagement">
				<b><ins>게시글관리</ins></b>
			</h2>
			<div class="adPLecture">
				<a href="./adPLecture">강의</a>
			</div>
			<div class="adPStore">
				<a href="./adPStore">판매</a>
			</div>
			<div class="adPReview">
				<a href="./adPReview"><b>댓글리뷰</b></a>
			</div>
		</div>
		<div class="adRcate">
			<ul class="tabs">
				<li class="tab-1" id="r1">스토어</li>
			</ul>

			<div class="adRpost listCss">
				<div class="rivewTitle padding10 tool">
					<div class="rNum review1">번호</div>
					<div class="rEmail review2">이메일</div>
					<div class="rName review3">이름</div>
					<div class="rReview review4">댓글</div>
					<div class="rDate review5">개시일시</div>
					<div class="rDelete review6">삭제</div>
				</div>
				<div class="listBorder">
					<div class="dateList padding10">
						<c:forEach var="bitem" items="${review}">
							<div class="rNum review1">${bitem.prv_num}</div>
							<div class="rEmail review2">${bitem.prv_m_email}</div>
							<div class="rName review3">${bitem.m_name}</div>
							<div class="rReview review4">${bitem.prv_content}</div>
							<div class="rDate review5">${bitem.prv_date}</div>
							<div class="rDelete review6">
								<p id="del">
									<button class="btn-1" onclick="btnclick('${bitem.prv_code}')">
										<b>삭제</b>
									</button>
								</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="popupD">
			<div class="popDel">
				<button type="button" class="sc-fzqNqU fsyYOM sc-fzqPZZ bDLHXT"
					color="transparent">
					<span class="sc-fzoyTs jZUSDr"><svg width="24" height="24"
							fill="none" viewBox="0 0 24 24">
							<path
								d="M18.5 4L12 10.5 5.5 4 4 5.5l6.5 6.5L4 18.5 5.5 20l6.5-6.5 6.5 6.5 1.5-1.5-6.5-6.5L20 5.5 18.5 4z"
								fill="#1b1c1d"></path></svg></span>
				</button>
				<p>삭제하시겠습니까?</p>
				<div class="btnNy">
					<button id="py" class="pyn">예</button>
					<button id="pn" class="pyn">아니요</button>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
function btnclick(code){
	console.log(code);
	codetemp = code;
	$('.popupD').show();
}
</script>
</html>