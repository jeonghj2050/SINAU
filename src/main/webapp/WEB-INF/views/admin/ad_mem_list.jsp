<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 페이지 (정보수정)</title>
<link rel="stylesheet" href="resources/css/adstyle.css?ver=1.3">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	var emailtemp = '';
	var ti = 'tab-1';
	$(document).ready(function() {
		$('.tab-content').hide();
		$('.popupD').hide();
		$('#dComple').hide();
		$('.current').show();
		$('ul.tabs li:first-child').addClass('on')
		$('ul.tabs li').click(function() {
			$('ul.tabs li').removeClass('on')
			$(this).addClass('on')
			var tab_id = $(this).attr('data-tab');
			ti = tab_id;
			$('.tab-content').hide();

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
			$('.current').show();
		})
		//팝업부분

		//$('.btn-1').click(function(){
		//	$('.popupD').show();
		//})
		$('.fsyYOM').click(function() {
			$('.popupD').hide();
		})
		$('#pn').click(function() {
			$('.popupD').hide();
		})
		$('#py').click(function() {
			console.log(emailtemp);
			$('.popupD').hide();
			$('#del').hide();
			$('#dComple').show();

			location.href = './delTemp?email=' + emailtemp + '&tabId=' + ti;
			emailtemp = '';
		})
		ti = '${tabId}';
	});
</script>
</head>
<body>
	<!-- 나중에 헤더는 따로 뺄것 -->
	<header>
		<jsp:include page="../adHeader.jsp"></jsp:include>
	</header>
	<section>
		<div class="mAprovalCate">
			<h2 id="mManagement">
				<b><ins>회원관리</ins></b>
			</h2>
			<div class="joinApproval">
				<a href="./adMApproval">가입승인</a>
			</div>
			<div class="information">
				<a href="./adMList">정보수정</a>
			</div>
		</div>



		<!-- 카테고리란 -->
		<div class="adcategory">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1" id="i1">크리에이터</li>
				<li class="tab-link" data-tab="tab-2" id="i2">판매자</li>
				<li class="tab-link" data-tab="tab-3" id="i3">일반회원</li>
			</ul>
			<div class="information">
				<!-- 크리에이터 회원 정보란 -->
				<div id="tab-1" class="tab-content current">
					<div class="information-1">
						<div class="infocreator">
							<b>
								<div class="ic-no informationNum">번호</div>
								<div class="ic-email informationEmail">이메일</div>
								<div class="ic-name informationName">이름</div>
								<div class="ic-phone informationPhone">연락처</div>
								<div class="ic-joindate informationBirth">생년월일</div>
								<div class="ic-joinstatus informationStatus">신고횟수</div>
								<div class="ic-delete informationDel">삭제</div>
							</b>
						</div>
						<div class="datelist">
							<c:forEach var="mList2" items="${cList2}">
								<div class="ic-no informationNum">${mList2.m_cmnum}</div>
								<div class="ic-email informationEmail">${mList2.m_email}</div>
								<div class="ic-name informationName">${mList2.m_name}</div>
								<div class="ic-phone informationPhone">${mList2.m_phone}</div>
								<div class="ic-joindate informationBirth">${mList2.m_birth}</div>
								<div class="ic-joinstatus informationStatus">1</div>
								<div class="ic-delete informationDel">
									<p id="del">
										<button class="btn-1" onclick="btnclick('${mList2.m_email}')">
											<b>삭제</b>
										</button>
									</p>
									<p id="dComple">
										<b>삭제완료</b>
									</p>
								</div>
							</c:forEach>
						</div>
						<div class="btn-area">
							<div class="paging">${paging}</div>
						</div>
					</div>

				</div>
				<!-- 판매자 회원 정보란 -->
				<div id="tab-2" class="tab-content">
					<div class="information-2">
						<div class="infodealer">
							<b>
								<div class="id-no informationNum">번호</div>
								<div class="id-email informationEmail">이메일</div>
								<div class="id-name informationName">이름</div>
								<div class="id-phone informationPhone">연락처</div>
								<div class="id-joindate informationBirth">생년월일</div>
								<div class="id-joinstatus informationStatus">신고횟수</div>
								<div class="id-delete informationDel">삭제</div>
							</b>
						</div>
						<div class="datelist">
							<c:forEach var="mList2" items="${dList2}">
								<div class="id-no informationNum">${mList2.m_dmnum}</div>
								<div class="id-email informationEmail">${mList2.m_email}</div>
								<div class="id-name informationName">${mList2.m_name}</div>
								<div class="id-phone informationPhone">${mList2.m_phone}</div>
								<div class="id-joindate informationBirth">${mList2.m_birth}</div>
								<div class="id-joinstatus informationStatus">3</div>
								<div class="id-delete informationDel">
									<p id="del">
										<button class="btn-1" onclick="btnclick('${mList2.m_email}')">
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
				<!-- 일반회원 정보란 -->
				<div id="tab-3" class="tab-content">
					<div class="information-3">
						<div class="infomember">
							<b>
								<div class="im-no informationNum">번호</div>
								<div class="im-email informationEmail">이메일</div>
								<div class="im-name informationName">이름</div>
								<div class="im-phone informationPhone">연락처</div>
								<div class="im-joindate informationBirth">생년월일</div>
								<div class="im-joinstatus informationStatus">신고횟수</div>
								<div class="im-delete informationDel">삭제</div>
							</b>
						</div>
						<div class="datelist">
							<c:set var="num"
								value="${searchVo.totalCount - ((searchVo.curPage+1) * 10) }" />
							<c:forEach var="mList2" items="${nList2}">
								<div class="im-no informationNum">${mList2.m_nmnum}</div>
								<div class="im-email informationEmail">${mList2.m_email}</div>
								<div class="im-name informationName">${mList2.m_name}</div>
								<div class="im-phone informationPhone">${mList2.m_phone}</div>
								<div class="im-joindate informationBirth">${mList2.m_birth}</div>
								<div class="im-joinstatus informationStatus">2</div>
								<div class="im-delete informationDel">
									<p id="del">
										<button class="btn-1" onclick="btnclick('${mList2.m_email}')">
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
	function btnclick(email) {
		console.log(email);
		emailtemp = email;
		$('.popupD').show();
	}
</script>
</html>