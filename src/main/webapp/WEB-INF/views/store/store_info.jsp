<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/store_info.css">
<link rel="stylesheet" href="resources/css/style.css">
<title>Document</title>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<header><jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section>
		<div class="s_warp">
			<!-- 대표이미지 -->
			<div class="sinfo_img">
				<img src="resources/images/storeimg/spec/${pspec}">
				<!-- <div class="sinfo_img2"><img src="3.PNG"></div>
                <div class="sinfo_img3"><img src="5.PNG"></div> -->
			</div>
			<!-- 결제부분 -->
			<jsp:include page="../store/paymentSection.jsp"></jsp:include>

			<hr width="950px" style="float: left;">

			<!-- 상품소개 -->
			<div class="sinfo_detail">
				<div class="sp_title1">상품 소개</div>
				<img src="resources/images/storeimg/content/${pcont}" width="950px">
			</div>

			<!-- 상품리뷰 -->
			<hr width="950px" style="float: left;">
			<div class="sp_title1">상품 리뷰</div>
			<div class=sinfo_rvall>
				<div id="reply">
					<c:if test="${mb == null }">
					<p class="rp_p">
						소감을 남기시려면 <a href="loginFrm">로그인</a>해주세요
					</p>
					</c:if>

					<c:if test="${mb != null}">
					<div class="replyForm">
						<div class="userInfo">
							<span class="userName">${mb.m_email}</span>
						</div>
						<form role="form" method="post" autocomplete="off" name="rFrm"
							id="rFrm" class="write-form">
							<input type="hidden" name="prv_p_code" value="${p_code}">
							<!-- 로그인처리하고 바꾸기 -->
							<div class="input_text">
								<textarea name="prv_content" id="repCon"></textarea>
							</div>

							<div class="input_area">
								<button type="button" id="reply_btn" onclick="reviewInsert()">등록</button>
							</div>
						</form>
					</div>
					</c:if>

					<div class="replyList">
						<ol>
							<c:forEach var="r" items="${rList}">
								<li>
									<div class="userInfo" id="${r.prv_code}">
										<span class="userName">${r.prv_m_email}</span> <span
											class="date"> <fmt:formatDate value="${r.prv_date}"
												pattern="yyyy-MM-dd" />
										</span>
										<!-- 댓글삭제-->
										<c:if test="${r.prv_m_email == mb.m_email}">
										<button type="button" class="delelte_dtn"
											onclick="reviewDelete('${r.prv_code}',this)">
											<span class="delite_ico"> 
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x-circle"
													fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  										<path fill-rule="evenodd"
														d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
 										<path fill-rule="evenodd"
														d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z" />
 										<path fill-rule="evenodd"
														d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z" />
											</svg>
											</span>
										</button>
										</c:if>
										<c:if test="${r.prv_m_email != mb.m_email}">
										<button type="button" class="delelte_dtn otherreply"
											onclick="reviewDelete('${r.prv_code}',this)">
											<span class="delite_ico"> 
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x-circle"
													fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  										<path fill-rule="evenodd"
														d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
 										<path fill-rule="evenodd"
														d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z" />
 										<path fill-rule="evenodd"
														d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z" />
											</svg>
											</span>
										</button>
										</c:if>
										<!-- 댓글신고-->
										<button class="worning_dtn" data-toggle="modal"
											data-target="#exampleModal">
											<span class="warning_ico"> <svg width="1em"
													height="1em" viewBox="0 0 16 16"
													class="bi bi-exclamation-triangle" fill="currentColor"
													xmlns="http://www.w3.org/2000/svg">
 												 <path fill-rule="evenodd"
														d="M7.938 2.016a.146.146 0 0 0-.054.057L1.027 13.74a.176.176 0 0 0-.002.183c.016.03.037.05.054.06.015.01.034.017.066.017h13.713a.12.12 0 0 0 .066-.017.163.163 0 0 0 .055-.06.176.176 0 0 0-.003-.183L8.12 2.073a.146.146 0 0 0-.054-.057A.13.13 0 0 0 8.002 2a.13.13 0 0 0-.064.016zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z" />
  												 <path
														d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z" />
													</svg></span>
										</button>

									</div>
									<div class="replyContent">${r.prv_content }</div>
								</li>
							</c:forEach>
						</ol>
					</div>

				</div>

				<!-- 신고내역 모달  -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" action="boardWrite">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">신고</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								내용 해당 글/댓글 내용
								<hr>
								작성자 email
								<hr>
								사유<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
									name="chk_info" value="HTML">비방 및 욕설<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
									name="chk_info" value="CSS" checked="checked">부적절한 홍보
								게시물<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
									name="chk_info" value="웹디자인">음란성 또는 청소년에게 부적합한 내용<br>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 배송일정 -->
			<hr width="950px" style="float: left; border: rgba(255, 255, 255, 0)">
			<div class="sp_title">배송 일정</div>
			<div class="sinfo_ddate">
				<div class="ddate">
					<div class="ddate_info1">
						<svg width="1em" height="1em" viewBox="0 0 16 16"
							class="bi bi-patch-exclamation" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg"
							style="background-color: gainsboro; margin: 0px 5px;">
								<path
								d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
								<path fill-rule="evenodd"
								d="M10.273 2.513l-.921-.944.715-.698.622.637.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636a2.89 2.89 0 0 1 4.134 0l-.715.698a1.89 1.89 0 0 0-2.704 0l-.92.944-1.32-.016a1.89 1.89 0 0 0-1.911 1.912l.016 1.318-.944.921a1.89 1.89 0 0 0 0 2.704l.944.92-.016 1.32a1.89 1.89 0 0 0 1.912 1.911l1.318-.016.921.944a1.89 1.89 0 0 0 2.704 0l.92-.944 1.32.016a1.89 1.89 0 0 0 1.911-1.912l-.016-1.318.944-.921a1.89 1.89 0 0 0 0-2.704l-.944-.92.016-1.32a1.89 1.89 0 0 0-1.912-1.911l-1.318.016z" />
							</svg>
						알려드려요
						<div class="ddate_info2">배송 업체의 사정에 따라 2~7 영업일이 소요됩니다.</div>
					</div>
				</div>
			</div>

			<!-- 환불신청 -->
			<hr width="950px" style="float: left;">
			<div class="sp_title">환불 신청</div>
			<div class="sinfo_refund">

				<div class="refund">
					<div class="refund_info">
						<div class="refund_img">
							<img src="resources/images/storeimg/refund.PNG" width="30px"
								height="30px">
						</div>
						<div class="refund_info2">
							상품 개봉 및 훼손 없이, 배송 완료 후 <span>7일 이내</span>인 경우에만 환불이 가능합니다.
						</div>
					</div>
				</div>
			</div>

			<!-- F&Q -->
			<hr width="950px" style="float: left;">
			<div class="sp_title">FAQ</div>
			<div class=sinfo_faq>
				<div class="accordion">
					<input type="radio" name="accordion" id="answer01"> <label
						for="answer01">Q.고객센터의 상담 시간을 알고 싶어요.<em></em></label>
					<div>
						<p>
							- 상담 시간 : 평일 오전 9시 30분 ~ 오후 6시 (점심시간 : 오전 11시 30분 ~ 오후 1시 30분 /
							주말, 공휴일 휴무)<br> - 전화 연결이 어려운 경우 카카오 상담톡으로 문의를 남겨주시면 확인 후 정성껏
							답변드리겠습니다.<br> ※ 문의량이 많을 경우 상담 연결 및 답변이 지연될 수 있습니다.
						</p>
					</div>
					<input type="radio" name="accordion" id="answer02"> <label
						for="answer02">Q. 배송 전 취소 하고 싶어요!<em></em></label>
					<div>
						<p>
							- 주문 당일 취소를 원하시는 고객님께서는 사이트에서 취소 요청을 해주신 뒤, 고객센터로 문의하여 취소 접수를
							부탁드립니다.<br> - 취소 접수를 하지 않은 건에 대해서는 상품이 출고되어 주문 취소가 불가합니다. 이
							경우 부득이하게 반품으로 처리 될 수 있습니다
						</p>
					</div>
					<input type="radio" name="accordion" id="answer03"> <label
						for="answer03">Q. 교환/반품 신청은 어떻게 하나요?<em></em></label>
					<div>
						<p>
							- 수령일 기준 7일 이내에 교환/반품에 대한 청약철회 의사를 밝혀주시면 처리가 가능합니다.<br> -
							교환/반품 절차 : 마이페이지 → 주문내역 → 교환/반품 신청 → 수거기사님 방문예정<br> - 고객센터로
							신청 부탁드립니다.<br> - 구매하신 제품의 AS를 원하는 경우에도 고객센터로 연락 부탁드립니다.
						</p>
					</div>
					<input type="radio" name="accordion" id="answer04"> <label
						for="answer04">Q.교환/반품시 배송비는 어떻게 되나요?<em></em></label>
					<div>
						<p>
							- 단순 변심으로 인한 교환/환불 시 왕복 배송비 발생 됩니다.<br> - 제품 불량으로 인한 교환/환불 시
							배송비는 발생되지 않습니다.<br> - 교환으로 인한 차액 발생시 구매하신 쇼핑몰 또는 카카오 상담톡으로
							문의주시면 도와드리겠습니다.
						</p>
					</div>
				</div>
			</div>
	</section>
	<footer><jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script src="resources/javascript/jquery.serializeObject.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//  $('.show1').show(); //페이지를 로드할 때 표시할 요소
		$('.show2').hide(); //페이지를 로드할 때 숨길 요소
		$('.full_heart').hide();

		$('.sharebtn').click(function() {
			//   $ ('.show1').hide(); //클릭 시 첫 번째 요소 숨김
			$('.show2').show(); //클릭 시 두 번째 요소 표시
			return false;
		});

		$('.unfilled_heart').click(function() {
			$('.unfilled_heart').hide();
			$('.full_heart').show();
		});

		$('.full_heart').click(function() {
			$('.full_heart').hide();
			$('.unfilled_heart').show();
		});

		$('.closer').click(function() {
			$('.show2').hide();
			return false;
		});
		
		$('.otherreply').hide();
	});

	function reviewInsert(p_code) {
		//form의 데이터를 가져와서 json으로 변환
		var replyFrm = $('#rFrm').serializeObject();
		//추가 데이터 : 게시글번호, 작성자(로그인) id

		//세션에 저장한 로그인 회원 정보에서 id 추출
		replyFrm.prv_m_email = '${mb.m_email}';
		console.log(replyFrm);

				$.ajax({
					url : "reviewInsert",//요청 url(uri)
					type : "post",//전송 방식(get, post)
					data : replyFrm,//전송할 데이터
					dataType : "json",//데이터의 형식
					success : function(data) {
						//목록 전체를 하나의 문자열로 만들어서
						//한꺼번에 id가 rTable인 태그(요소)의
						//innerHTML에 출력.
						var rlist = '';
						var dlist = data.rList;
						var r_code = '';
						//var r_code=${r.prv_code};
						for (var i = 0; i < dlist.length; i++) {
							rlist +="<ol>" 
								+"<li data-prv_p_code='" + dlist[i].prv_p_code + "'>"
									+ "<div class='userInfo'>"
									+ "<span class='userName'>"
									+ dlist[i].prv_m_email
									+ "</span>"
									+ "<span class='date'>"
									+ dlist[i].prv_date
									+ "</span>"
									+"<button type='button' class='delelte_dtn'	onclick='reviewDelete("+dlist[i].prv_code+",this)'>"
									+"<span class='delite_ico'>" 
									+"<svg width='1em'height='1em' viewBox='0 0 16 16' class='bi bi-x-circle'fill='currentColor' xmlns='http://www.w3.org/2000/svg'>"
									+"<path fill-rule='evenodd'	d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z' />"
									+"<path fill-rule='evenodd'	d='M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z' />"
									+"<path fill-rule='evenodd' d='M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z' />"
									+"</svg>"
									+"</span>"
									+"</button>"
									+"<button class='worning_dtn' data-toggle='modal'data-target='#exampleModal'>"
									+"<span class='warning_ico'>" 
									+"<svg width='1em'height='1em' viewBox='0 0 16 16'class='bi bi-exclamation-triangle' fill='currentColor' xmlns='http://www.w3.org/2000/svg'>"
									+"<path fill-rule='evenodd'd='M7.938 2.016a.146.146 0 0 0-.054.057L1.027 13.74a.176.176 0 0 0-.002.183c.016.03.037.05.054.06.015.01.034.017.066.017h13.713a.12.12 0 0 0 .066-.017.163.163 0 0 0 .055-.06.176.176 0 0 0-.003-.183L8.12 2.073a.146.146 0 0 0-.054-.057A.13.13 0 0 0 8.002 2a.13.13 0 0 0-.064.016zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z' />"
									+"<path d='M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z'/>"
									+"</svg>"
									+"</span>"
									+"</button>"
									+ "</div>"
									+ "<div class='replyContent'>"
									+ dlist[i].prv_content + "</div>" + "</li>"+"</ol>";

						}
						
						$('.replyList').html(rlist);
						location.reload(true);
					},
					error : function(error) {
						alert("댓글 입력 실패");
					}
				});

		$('#repCon').val('');//댓글창 지우기
	}

//댓글 삭제
function reviewDelete(prv_code, obj) {
	console.log(prv_code);
	var deleteConfirm = confirm("정말 삭제 하시겠습니까")
	if (deleteConfirm) {
		var paramData = {
			"prv_code" : prv_code
		};

		$.ajax({
			url : "reviewDelete",
			type : "post",
			data : paramData,
			dataType : "json",//데이터의 형식
			success : function(result) {
				var oli=$(obj).parent().parent();
				oli.remove();
					/* var rlist = '';
					var dlist = result.rList;
					for (var i = 0; i < dlist.length; i++) {
						rlist += "<li data-prv_p_code='" + dlist[i].prv_p_code + "'>"
								+ "<div class='userInfo'>"
								+ "<span class='userName'>"
								+ dlist[i].prv_m_email
								+ "</span>"
								+ "<span class='date'>"
								+ dlist[i].prv_date
								+ "</span>"
								+ "</div>"
								+ "<div class='replyContent'>"
								+ dlist[i].prv_content + "</div>" + "</li>";

					} */
				location.reload(true);
			},
			error : function() {
				alert("로그인하셔야합니다.")
			}
		});
	}
}
</script>

</html>