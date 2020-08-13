<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/adstyle.css">

<head>
<meta charset="UTF-8">
<title>관리자 페이지 게시글관리(강의)</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	var codetemp = '';
	var target = document.getElementById("selectBox");
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
		$('.fsyYOM').click(function() {
			$('.popupD').hide();
		})
		$('#pn').click(function() {
			$('.popupD').hide();
		})
		$('#py').click(function() {
			console.log(codetemp);
			$('.popupD').hide();
			$('#del').hide();
			$('#dComple').show();

			location.href = './delLec?code=' + codetemp;
			codetemp = '';
		})
		$('select>option').click(function() {

			console.log(name);
			$(this).addClass('set');
		})

	})
</script>
<script type="text/javascript">
$(document).ready(function(){
	var chk = "${check}";
	
	if(chk == "1"){
		alert("글 등록  실패!");
		location.reload(true);
	}
	if(chk == "2"){
		alert("글 등록 성공!");
		location.reload(true);
	}
	if(chk == "3"){
		alert("글 삭제 성공!");
		location.reload(true);
	}
	
});
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
				<a href="./adPLecture"><b>강의</b></a>
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
						<select name=onc_cts_code id="onc_cts_code" class="select">
							<option value="all" <c:set var="sel_code" value="all"/>>필터
								선택</option>
							<c:forEach var="cts" items="${pcts}">
								<option value="${cts.cts_code}"><c:out
										value="${cts.cts_name}" /></option>
							</c:forEach>
						</select>
						<button id="set" onclick="set1('${cts.cts_code}')">적용</button>
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
							<input type="hidden" class="sel_cts_code">
							<div class="test1"></div>
							<c:forEach var="bitem" items="${onc}">
								<div class="view" id="vieww">
									<div class="on-no lecture1">${bitem.onc_num}</div>
									<div class="on-email lecture2">${bitem.onc_m_email}</div>
									<div class="on-cname lecture3">${bitem.onc_teacher}</div>
									<div class="on-title lecture4">${bitem.onc_title}</div>
									<div class="on-date lecture5">${bitem.onc_update}</div>
									<div class="on-del lecture6">
										<p id="del">
											<button class="btn-del"
												onclick="btnclick('${bitem.onc_code}')">
												<b>삭제</b>
											</button>
										</p>
									</div>
									<div class="on-cts lecture7" style="display:none" id="ctsCode">${bitem.onc_cts_code}</div>
								</div>
							</c:forEach>

						</div>
					</div>
					<%-- <div class="btn-area">
						<div class="paging">${paging}</div>
					</div> --%>
				</div>
				<!-- 게시글강의 - 오프라인 -->
				<div id="tab-2" class="tab-content">
					<div class="lecture-2">
						<select name=ofc_cts_code id="ofc_cts_code" class="select">
							<option value="all" <c:set var="sel_code" value="all"/>>필터
								선택</option>
							<c:forEach var="cts" items="${pcts}">
								<option value="${cts.cts_code}"><c:out
										value="${cts.cts_name}" /></option>
							</c:forEach>
						</select>
						<button id="set" onclick="set2('${cts.cts_code}')">적용</button>
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
						<div class="datelist onlist">
							<c:forEach var="bitem" items="${ofc}">
							<div class="view2" id="vieww">
								<div class="of-no lecture1">${bitem.ofc_num}</div>
								<div class="of-email lecture2">${bitem.ofc_m_email}</div>
								<div class="of-cname lecture3">${bitem.ofc_teacher}</div>
								<div class="of-title lecture4">${bitem.ofc_title}</div>
								<div class="of-date lecture5">${bitem.ofc_update}</div>
								<div class="of-del lecture6">
									<p id="del">
										<button class="btn-del"
											onclick="btnclick('${bitem.ofc_code}')">
											<b>삭제</b>
										</button>
									</p>
								</div>
								<div class="of-cts lecture7" style="display:none" id="ctsCode">${bitem.ofc_cts_code}</div>
							</div>
							</c:forEach>
						</div>
					</div>
					<%-- <div class="btn-area">
						<div class="paging">${paging}</div>
					</div> --%>
				</div>
				<!-- 게시글강의 - 유튜브 -->
				<div id="tab-3" class="tab-content">
               <div class="lecture-3">
                  <div class="lyoutube">
                     <b>
                        <div class="yb-no lecture1">번호</div>                        
                        <div class="yb-title lecture4">강의명</div>
                        <div class="yb-cname lecture3">크리에이터</div>
                        <div class="yb-email lecture2">카테고리</div>
                        <div class="yb-date lecture5">개시일시</div>
                        <div class="yb-del lecture6">삭제</div>
                     </b>
                  </div>
                  <div class="datelist">
                     <c:forEach var="bitem" items="${pc}">
                        <div class="yb-no lecture1">${bitem.y_num}</div>
                        <div class="yb-title lecture4">${bitem.y_title}</div>
                        <div class="yb-cname lecture3">${bitem.y_profile}</div>
                        <div class="yb-email lecture2">${bitem.cts_name}</div>                        
                        <div class="yb-date lecture5">${bitem.y_update}</div>
                        <div class="yb-del lecture6">
                           <p id="del1">
                              <button class="btn-del" onclick="btnclick('${bitem.y_code}')">
                                 <b>삭제</b>
                              </button>
                              <button class="btn-write" id="upbtn" onclick="location.href='./youtubeupdate?y_code=${bitem.y_code}'">
                              수정
                              </button>
                           </p>
                        </div>
                     </c:forEach>
                  </div>
                  <button class="btn-insert" onclick="location.href='./youtubeinsert'">
                  등록
                  </button>
               </div>
               <%-- <div class="btn-area">
                  <div class="paging">${paging}</div>
               </div> --%>
            </div>
				<%-- <div id="tab-3" class="tab-content">
					<div class="lecture-3">
						<div class="lyoutube">
							<b>
								<div class="yb-no lecture1">번호</div>								
								<div class="yb-title lecture4">강의명</div>
								<div class="yb-cname lecture3">크리에이터</div>
								<div class="yb-email lecture2">카테고리</div>
								<div class="yb-date lecture5">개시일시</div>
								<div class="yb-del lecture6">삭제</div>
							</b>
						</div>
						<div class="datelist">
							<c:forEach var="bitem" items="${pc}">
								<div class="yb-no lecture1">${bitem.y_num}</div>
								<div class="yb-title lecture4">${bitem.y_title}</div>
								<div class="yb-cname lecture3">${bitem.y_profile}</div>
								<div class="yb-email lecture2">${bitem.cts_name}</div>								
								<div class="yb-date lecture5">${bitem.y_update}</div>
								<div class="yb-del lecture6">
									<p id="del1">
										<button class="btn-del" onclick="btnclick('${bitem.y_code}')">
											<b>삭제</b>
										</button>
										<button class="btn-write" id="upbtn" onclick="location.href='./youtubeupdate?y_code=${bitem.y_code}'">
										수정
										</button>
									</p>
								</div>
							</c:forEach>
						</div>
						<button class="btn-insert" onclick="location.href='./youtubeinsert'">
						등록
						</button>
					</div>
					<div class="btn-area">
						<div class="paging">${paging}</div>
					</div>
				</div>
			</div>
		</div>--%>
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
		</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
	/* $('#onc_cts_code')
			.change(
					function() {
						var sel_cts = $('#onc_cts_code option:selected').val();
						$('.sel_cts_code').val(sel_cts);
						var html1 = '<c:if test="${bitem.cts_code eq '+sel_cts+'}">'
								+ '<div class="of-no lecture1">${bitem.ofc_num}</div>'
								+ '<div class="of-email lecture2">${bitem.ofc_m_email}</div>'
								+ '<div class="of-cname lecture3">${bitem.ofc_teacher}</div>'
								+ '<div class="of-title lecture4">${bitem.ofc_title}</div>'
								+ '<div class="of-date lecture5">${bitem.ofc_update}</div>'
								+ '<div class="of-del lecture6">'
								+ '<p id="del">'
								+ '<button class="btn-del" onclick="btnclick('
								+ '${bitem.ofc_code}'
								+ ')">'
								+ '<b>삭제</b>'
								+ '</button></p></div>' +

								'</c:if>dfsdfdsfdf';

						$('.test1').html(html1);
						console.log(html1);

					}); */
	function btnclick(code) {
		console.log(code);
		codetemp = code;
		$('.popupD').show();
	}
	function set1(cts) {
		var name = $('#onc_cts_code option:selected').val();
		var onccode = ctslist = cts;
		console.log(name);
		if (name == "all") {
			$('.view').show();
			//}else if(name[idx].NAME == "ca"){
			//$('.datelist').show();
		} else {
			$('.view').hide();
			console.log(name);
			$(".view:contains('"+name+"')").show();

		}
	}
		function set2(cts) {
			var name = $('#ofc_cts_code option:selected').val();
			var onccode = ctslist = cts;
			console.log(name);
			if (name == "all") {
				$('.view2').show();
				//}else if(name[idx].NAME == "ca"){
				//$('.datelist').show();
			} else {
				$('.view2').hide();
				console.log(name);
				$(".view2:contains('"+name+"')").show();

			}
		// location.href='./ctsOn?cts='+name; 
		//ctslist = '';
	}
</script>
</html>