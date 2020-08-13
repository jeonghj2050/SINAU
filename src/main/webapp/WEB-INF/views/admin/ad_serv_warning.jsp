<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/adstyle.css?ver1.3">
<head>
<meta charset="UTF-8">
<title>관리자 페이지 고객센터(신고)</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
var codetemp = '';
var codetemp2 = '';
	$(document).ready(function() {
		
		$('.popupN').hide();
		
		$('.fsyYOM').click(function(){
			$('.popupN').hide();
		})
		$('#pn').click(function(){
			$('.popupN').hide();
		})
		$('#py').click(function(){
			console.log(codetemp);
			$('.popupN').hide();
			
			location.href='./wNo?code='+codetemp;
			emailtemp = '';
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
		<div class="servCate menuCate">
			<h2 id="adSManagement">
				<b><ins>고객센터</ins></b>
			</h2>
			<div class="adSQna">
				<a href="./adSQna">Q&A</a>
			</div>
			<div class="adSWarning">
				<a href="./adSWarning"><b>신고</b></a>
			</div>
		</div>

		<div class="servW listCss">
			<div class="line">
				<div class="servWTitle padding10 tline">
					<div class="sw-num servW1">번호</div>
					<div class="sw-content servW11">사유</div>
					<div class="sw-context servW2">내용</div>
					<div class="sw-name servW3">이름</div>
					<div class="sw-date servW4">작성일</div>
					<div class="sw-result servW5">처리결과</div>
				</div>
				<div class="servBorder">
					<div class="servWList">
						<c:forEach var="bitem" items="${warning}">
						<div class="lineW lists" ${bitem.code}>
							<div class="sw-num servW1">${bitem.w_num}</div>
							<div class="sw-content servW11">${bitem.contents}</div>
							<div class="sw-context servW2">${bitem.prv_content}</div>
							<div class="sw-name servW3">${bitem.name}</div>
							<div class="sw-date servW4">${bitem.dates}</div>
							<div class="sw-result servW5">
								<c:choose>
								<c:when test="${bitem.states eq 1 }">
									<%-- <button class="btn-1" onclick="yes('${bitem.code}')">
										<b>승인</b>
									</button> --%>
									<button class="btn-2" onclick="no('${bitem.code}')">
										<b>비승인</b>
									</button>
									</c:when>
									<c:when test="${bitem.states eq 0 }">
										<b id="ok"> 복원처리 </b>
									</c:when>
								</c:choose>
							</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	<div class="popupN">
			<div class="popNo">
				<button type="button" class="sc-fzqNqU fsyYOM sc-fzqPZZ bDLHXT" color="transparent"><span class="sc-fzoyTs jZUSDr"><svg width="24" height="24" fill="none" viewBox="0 0 24 24"><path d="M18.5 4L12 10.5 5.5 4 4 5.5l6.5 6.5L4 18.5 5.5 20l6.5-6.5 6.5 6.5 1.5-1.5-6.5-6.5L20 5.5 18.5 4z" fill="#1b1c1d"></path></svg></span></button>
				<p id="refuse">신고사유가 미흡하여 댓글로 복원합니다.</p>
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
function no(code){
	console.log(code);
	codetemp = code;
	$('.popupN').show();
}
function yes(code){
	console.log(code);
	codetemp2 = code;
	
	location.href='./wYes?code='+codetemp2;
	codetemp2 = '';
}
</script>
</html>