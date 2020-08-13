<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/adstyle.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>관리자 페이지 (가입승인)</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
var emailtemp = '';
var emailtemp2 = '';
var ti='tab-1';
	$(document).ready(function() {
		$('.tab-content').hide();
		$('.popupN').hide();
		$('#Atrue').hide();
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
		//$('.btn-2').click(function(){
		//	$('.popupN').show();
		//})
		
		//$('.btn-1').click(function(){
		//	$('#yn').hide();
		//	$('#Atrue').show();
		//})
		$('.fsyYOM').click(function(){
			$('.popupN').hide();
		})
		$('#pn').click(function(){
			$('.popupN').hide();
		})
		$('#py').click(function(){
			$('.popupN').hide();
			$('#yn').hide();
			
			location.href='./delNAp?email='+emailtemp+'&tabId='+ti;
			emailtemp = '';
		})
		ti = '${tabId}';
	})
</script>
<style type="text/css">
*{
font-family: 'Nanum Gothic Coding', monospace;
}
</style>
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
				<a href="./adMApproval"><b>가입승인</b></a>
			</div>
			<div class="information">
				<a href="./adMList">정보수정</a>
			</div>
		</div>



		<!-- 카테고리란 -->
		<div class="adcategory">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1" id="t1">크리에이터</li>
				<li class="tab-link" data-tab="tab-2" id="t2">판매자</li>
				<!-- <li class="tab-link" data-tab="tab-3" id="t3">유튜버</li> -->
			</ul>
			<div class="approval">
				<!-- 크리에이터 회원 승인란 -->
				<div id="tab-1" class="tab-content current">
					<div class="approval-1">
						<div class="adcreator">
							<b>
								<div class="c-no approvalNum">번호</div>
								<div class="c-email approvalEmail">이메일</div>
								<div class="c-name approvalName">이름</div>
								<div class="c-phone approvalPhone">연락처</div>
								<div class="c-joindate approvalBirth">생년월일</div>
								<div class="c-joinstatus approvalState">승인여부</div>
							</b>
						</div>
						<div class="datelist">
							<c:forEach var="mlist" items="${cList1}">
								<div class="c-no approvalNum">${mlist.m_cmnum}</div>
								<div class="c-email approvalEmail">${mlist.m_email}</div>
								<div class="c-name approvalName">${mlist.m_name}</div>
								<div class="c-phone approvalPhone">${mlist.m_phone}</div>
								<div class="c-joindate approvalBirth">${mlist.m_birth}</div>
								<div class="c-joinstatus approvalState">
									<p id="yn">
										<button class="btn-1" onclick="approval('${mlist.m_email}')">
											<b>승인</b>
										</button>
										<button class="btn-2" onclick="btnclick('${mlist.m_email}')">
											<b>거절</b>
										</button>
									</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<%-- <div class="btn-area">
						<div class="paging">${paging}</div>
					</div> --%>
				</div>
				<!-- 판매자 회원 승인란 -->
				<div id="tab-2" class="tab-content">
					<div class="approval-2">
						<div class="addealer">
							<b>
								<div class="d-no approvalNum">번호</div>
								<div class="d-email approvalEmail">이메일</div>
								<div class="d-name approvalName">이름</div>
								<div class="d-phone approvalPhone">연락처</div>
								<div class="d-joindate approvalBirth">생년월일</div>
								<div class="d-joinstatus approvalState">승인여부</div>
							</b>
						</div>
						<div class="datelist">
							<c:forEach var="mlist" items="${dList1}">
								<div class="d-no approvalNum">${mlist.m_dmnum}</div>
								<div class="d-email approvalEmail">${mlist.m_email}</div>
								<div class="d-name approvalName">${mlist.m_name}</div>
								<div class="d-phone approvalPhone">${mlist.m_phone}</div>
								<div class="d-joindate approvalBirth">${mlist.m_birth}</div>
								<div class="d-joinstatus approvalState">
								<p id="yn">
										<button class="btn-1" onclick="approval('${mlist.m_email}')">
											<b>승인</b>
										</button>
										<button class="btn-2" onclick="btnclick('${mlist.m_email}')">
											<b>거절</b>
										</button>
									</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<%-- <div class="btn-area">
						<div class="paging">${paging}</div>
					</div> --%>
				</div>
				<!-- 유튜버 회원 승인란 -->
				<%-- <div id="tab-3" class="tab-content">
					<div class="approval-3">
						<div class="adyoutube">
							<b>
								<div class="y-no ">번호</div>
								<div class="y-email">이메일</div>
								<div class="y-name">이름</div>
								<div class="y-phone">연락처</div>
								<div class="y-joindate">가입일시</div>
								<div class="y-joinstatus">승인여부</div>
							</b>
						</div>
						<div class="datelist">
							<c:forEach var="bitem" items="${bList}">
								<div class="y-no ">3</div>
								<div class="y-email">333a@aaa.aaa</div>
								<div class="y-name">길sss</div>
								<div class="y-phone">qwd1254</div>
								<div class="y-joindate">2020.07.22</div>
								<div class="y-joinstatus">
								<p id="yn">
										<button class="btn-1">
											<b>승인</b>
										</button>
										<button class="btn-2" onclick="btnclick('${mlist.m_email}')">
											<b>거절</b>
										</button>
									</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="btn-area">
						<div class="paging">${paging}</div>
					</div>
				</div> --%>
			</div>
		</div>
		<div class="popupN">
			<div class="popNo">
				<button type="button" class="sc-fzqNqU fsyYOM sc-fzqPZZ bDLHXT" 
				color="transparent"><span class="sc-fzoyTs jZUSDr">
				<svg width="24" height="24" fill="none" viewBox="0 0 24 24">
				<path d="M18.5 4L12 10.5 5.5 4 4 5.5l6.5 6.5L4 18.5 5.5 20l6.5-6.5 6.5 6.5 1.5-1.5-6.5-6.5L20 
				5.5 18.5 4z" fill="#1b1c1d"></path></svg></span></button>
				<p id="refuse">크리에이터/판매자에 적합하지않아 삭제합니다.</p>
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


function btnclick(email){
	console.log(email);
	emailtemp = email;
	$('.popupN').show();
	
	var paging = $('.paging')
	consol.log(paging)
}
function approval(email){
	console.log(email);
	emailtemp2 = email;
	
	location.href='./memApproval?email='+emailtemp2+'&tabId='+ti;
	emailtemp2 = '';
}
ti = '${tabId}';
</script>
</html>