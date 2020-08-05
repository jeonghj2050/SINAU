<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/adstyle.css?ver=1.1">

<head>
<meta charset="UTF-8">
<title>관리자 페이지 게시글관리(강의)</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
var codetemp = '';
	$(document).ready(function() {
		$('.tab-content').hide();
		$('.current').show();
		$('.popupD').hide();
		$('#dComple').hide();
		$('ul.tabs li:first-child').addClass('on')
		$('ul.tabs li').click(function() {
			$('ul.tabs li').removeClass('on')
			$(this).addClass('on')
			var tab_id = $(this).attr('data-tab');
			$('.tab-content').hide();

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
			$('.current').show();
		})
		//팝업부분
		//$('.btn-del').click(function(){
		//	$('.popupD').show();
		//})
		$('.fsyYOM').click(function(){
			$('.popupD').hide();
		})
		$('#pn').click(function(){
			$('.popupD').hide();
		})
		$('#py').click(function(){
			console.log(codetemp);
			$('.popupD').hide();
			$('#del').hide();
			$('#dComple').show();
			
			location.href='./delLec?code='+codetemp;
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
		<div class="menuCate">
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
				<a href="./adPReview">댓글리뷰</a>
			</div>
		</div>



		<!-- 카테고리란 -->
		<div class="adPcategory">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1" id="l1">온라인</li>
				<li class="tab-link" data-tab="tab-2" id="l2">오프라인</li>
				<li class="tab-link" data-tab="tab-3" id="l3">유튜브</li>
			</ul>
			<div class="lecture">
				<!-- 게시글강의 - 온라인 -->
				<div id="tab-1" class="tab-content current">
					<div class="lecture-1">
					<select name=dropBox id="on">
						<option value=1 selected>전체
						<option value=2>공예
						<option value=3>디지털드로잉
						<option value=4>요리
						<option value=5>운동
						<option value=6>미술
					</select>
						<div class="lOnline">
							<b>
								<div class="on-no lecture1">번호</div>
								<div class="on-email lecture2">이메일</div>
								<div class="on-cname lecture3">크리에이터</div>
								<div class="on-title lecture4">강의명</div>
								<div class="on-date lecture5">개시일시</div>
								<div class="on-del lecture6">삭제</div>
							</b>
						</div>
						<div class="datelist">
							<c:forEach var="bitem" items="${onc}">
								<div class="on-no lecture1">${bitem.onc_num}</div>
								<div class="on-email lecture2">${bitem.onc_m_email}</div>
								<div class="on-cname lecture3">${bitem.onc_teacher}</div>
								<div class="on-title lecture4">${bitem.onc_title}</div>
								<div class="on-date lecture5">${bitem.onc_update}</div>
								<div class="on-del lecture6">
									<p id="del">
										<button class="btn-del" onclick="btnclick('${bitem.onc_code}')">
											<b>삭제</b>
										</button>
									</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="btn-area">
						<div class="paging">${paging}</div>
					</div>
				</div>
				<!-- 게시글강의 - 오프라인 -->
				<div id="tab-2" class="tab-content">
					<div class="lecture-2">
					<select name=dropBox id="on">
						<option value=1 selected>전체
						<option value=2>공예
						<option value=3>디지털드로잉
						<option value=4>요리
						<option value=5>운동
						<option value=6>미술
					</select>
						<div class="lOffline">
							<b>
								<div class="of-no lecture1">번호</div>
								<div class="of-email lecture2">이메일</div>
								<div class="of-cname lecture3">크리에이터</div>
								<div class="of-title lecture4">강의명</div>
								<div class="of-date lecture5">개시일시</div>
								<div class="of-del lecture6">삭제</div>
							</b>
						</div>
						<div class="datelist">
							<c:forEach var="bitem" items="${ofc}">
								<div class="of-no lecture1">${bitem.ofc_num}</div>
								<div class="of-email lecture2">${bitem.ofc_m_email}</div>
								<div class="of-cname lecture3">${bitem.ofc_teacher}</div>
								<div class="of-title lecture4">${bitem.ofc_title}</div>
								<div class="of-date lecture5">${bitem.ofc_update}</div>
								<div class="of-del lecture6">
									<p id="del">
										<button class="btn-del" onclick="btnclick('${bitem.ofc_code}')">
											<b>삭제</b>
										</button>
									</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="btn-area">
						<div class="paging">${paging}</div>
					</div>
				</div>
				<!-- 게시글강의 - 유튜브 -->
				<div id="tab-3" class="tab-content">
					<div class="lecture-3">
						<div class="lyoutube">
							<b>
								<div class="yb-no lecture1">번호</div>
								<div class="yb-email lecture2">이메일</div>
								<div class="yb-cname lecture3">크리에이터</div>
								<div class="yb-title lecture4">강의명</div>
								<div class="yb-date lecture5">개시일시</div>
								<div class="yb-del lecture6">삭제</div>
							</b>
						</div>
						<div class="datelist">
							<c:forEach var="bitem" items="${pc}">
								<div class="yb-no lecture1">${bitem.y_num}</div>
								<div class="yb-email lecture2">${bitem.y_m_email}</div>
								<div class="yb-cname lecture3">${bitem.y_profile}</div>
								<div class="yb-title lecture4">${bitem.y_title}</div>
								<div class="yb-date lecture5">${bitem.y_update}</div>
								<div class="yb-del lecture6">
									<p id="del">
										<button class="btn-del" onclick="btnclick('${bitem.y_code}')">
											<b>삭제</b>
										</button>
									</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="btn-area">
						<div class="paging">${paging}</div>
					</div>
				</div>
			</div>
		</div>
		<div class="popupD">
			<div class="popDel">
			<button type="button" class="sc-fzqNqU fsyYOM sc-fzqPZZ bDLHXT" color="transparent"><span class="sc-fzoyTs jZUSDr"><svg width="24" height="24" fill="none" viewBox="0 0 24 24"><path d="M18.5 4L12 10.5 5.5 4 4 5.5l6.5 6.5L4 18.5 5.5 20l6.5-6.5 6.5 6.5 1.5-1.5-6.5-6.5L20 5.5 18.5 4z" fill="#1b1c1d"></path></svg></span></button>
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