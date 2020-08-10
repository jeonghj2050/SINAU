<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html lang="en">
<head>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<meta name="viewport" http-equiv="Content-Type"
	content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="/resources/css/offline/offline_info.css" />

<link rel="stylesheet" type="text/css" media="screen"
	href="/resources/css/offline/style2.css" />

<title>오프라인 상세</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$('.show2').hide(); //페이지를 로드할 때 숨길 요소
		$('.full_heart').hide();
		$('.sharebtn').click(function() {
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
		console.log("${m_email}");
		
	});
</script>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section class="off_info">
		<div class="main-image">
			<div id="info-img1">
				<img id="img1" src="resources/upload/${offInfoSpec.col1}">
			</div>
			<div id="info-img2">
				<img id="img2" src="resources/upload/${offInfoSpec.col2}">
			</div>
			<div id="info-img3">
				<img id="img3" src="resources/upload/${offInfoSpec.col3}">
			</div>
		</div>
		<div class="info-wrap">
			<div class="all-info">
				<div class="info-l">
					<div class="text-info">
						<img src="resources/upload/${offInfo.f_sysname}">
					</div>
					<div class="sinfo_ddate">
						<div class="sp_title">배송 일정</div>
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
					<div class="sinfo_refund">
						<div class="sp_title">환불 신청</div>
						<div class="refund">
							<div class="refund_info">
								<div class="refund_img">
									<img src="resources/images/offline/refund.png" width="30px"
										height="30px">
								</div>
								<div class="refund_info2">
									상품 개봉 및 훼손 없이, 배송 완료 후 <span>7일 이내</span>인 경우에만 환불이 가능합니다.
								</div>
							</div>
						</div>
					</div>
					<!-- F&Q -->
					<div class="faq" style="float: left;">
						<hr width="950px" style="float: left;">
						<div class="sp_title"
							style="height: 20px; margin: 15px 0px 5px 3px;">FAQ</div>
						<div class=sinfo_faq>
							<div class="accordion">
								<input type="radio" name="accordion" id="answer01"> <label
									for="answer01">Q.고객센터의 상담 시간을 알고 싶어요.<em></em></label>
								<div>
									<p>
										- 상담 시간 : 평일 오전 9시 30분 ~ 오후 6시 (점심시간 : 오전 11시 30분 ~ 오후 1시 30분
										/ 주말, 공휴일 휴무)<br> - 전화 연결이 어려운 경우 카카오 상담톡으로 문의를 남겨주시면 확인
										후 정성껏 답변드리겠습니다.<br> ※ 문의량이 많을 경우 상담 연결 및 답변이 지연될 수 있습니다.
									</p>
								</div>
								<input type="radio" name="accordion" id="answer02"> <label
									for="answer02">Q. 배송 전 취소 하고 싶어요!<em></em></label>
								<div>
									<p>
										- 주문 당일 취소를 원하시는 고객님께서는 사이트에서 취소 요청을 해주신 뒤, 고객센터로 문의하여 취소 접수를
										부탁드립니다.<br> - 취소 접수를 하지 않은 건에 대해서는 상품이 출고되어 주문 취소가 불가합니다.
										이 경우 부득이하게 반품으로 처리 될 수 있습니다
									</p>
								</div>
								<input type="radio" name="accordion" id="answer03"> <label
									for="answer03">Q. 교환/반품 신청은 어떻게 하나요?<em></em></label>
								<div>
									<p>
										- 수령일 기준 7일 이내에 교환/반품에 대한 청약철회 의사를 밝혀주시면 처리가 가능합니다.<br> -
										교환/반품 절차 : 마이페이지 → 주문내역 → 교환/반품 신청 → 수거기사님 방문예정<br> -
										고객센터로 신청 부탁드립니다.<br> - 구매하신 제품의 AS를 원하는 경우에도 고객센터로 연락
										부탁드립니다.
									</p>
								</div>
								<input type="radio" name="accordion" id="answer04"> <label
									for="answer04">Q.교환/반품시 배송비는 어떻게 되나요?<em></em></label>
								<div>
									<p>
										- 단순 변심으로 인한 교환/환불 시 왕복 배송비 발생 됩니다.<br> - 제품 불량으로 인한
										교환/환불 시 배송비는 발생되지 않습니다.<br> - 교환으로 인한 차액 발생시 구매하신 쇼핑몰 또는
										카카오 상담톡으로 문의주시면 도와드리겠습니다.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="AffixProductHeader__Container-sc-1l73jdk-0 fTIePJ">
					<div
						class="ProductHeader__Header-az1cmu-0 kfQyeR AffixProductHeader__StyledProductHeader-sc-1l73jdk-1 ghdzuI">
						<div class="teacher_name">by.${offInfo.ofc_teacher}</div>
						<div class="class_explain">${offInfo.ofc_title}</div>
						<div class="lable_container">
							<div class="categories">
								<div class="cate_lable">${offInfo.cts_name}</div>
							</div>
							<div class="class_startdate">${offInfo.sc_place}</div>
						</div>
						<div class="class_price">
							<strong><fmt:formatNumber type="currency"
									value="${offInfo.ofc_sale}" /></strong>
						</div>
						<div class="hr"></div>
						<div class="like_container">
							<div class="btn_div">
								<c:choose>
                 <c:when test="${mb.m_email eq null}">
                    <!-- 비 로그인 상태일 시 <a href='javascript: login_need();'> -->
                   <button type="button" class="likebtn unfilled_heart" color="default" fill="false"
                               data-test-id="wishlist-button" data-test-group="sales-product-info-table-row"  
                               onclick="location.href='./loginFrm'" id="like_img">
                               <div class="sc-fzqARJ eozcfK">
                                   <svg width="18" height="18" fill="none" viewBox="0 0 24 24">
                                       <path fill-rule="evenodd" clip-rule="evenodd"
                                           d="M20.5 9c0-2-1.5-3.9-3.7-3.9-2.3 0-3.8 1.63-4.8 3.33-1-1.7-2.5-3.33-4.8-3.33C5 5.1 3.5 6.867 3.5 9c0 4.62 4.949 7.667 8.5 9.623 3.551-1.956 8.5-5.003 8.5-9.623zm-19-.176C1.5 5.607 3.962 3 7 3c2.7 0 4 1 5 2.2C13 4 14.3 3 17 3c3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
                                           fill="#1b1c1d"></path>
                                   </svg></div>
                               <span class="like_num"><span id="nlike_prt">${onInfo.l_count}</span></span>
                           </button>
                 
                 </c:when>
                 <c:otherwise>
                 <!-- 로그인 이메일 있을 경우 -->
                      <button type="button" class="likebtn unfilled_heart" color="default" fill="false"
                               data-test-id="wishlist-button" data-test-group="sales-product-info-table-row"  
                               onclick="like_func()" id="like_img">
                               <div class="sc-fzqARJ eozcfK">
                                   <svg width="18" height="18" fill="none" viewBox="0 0 24 24">
                                       <path fill-rule="evenodd" clip-rule="evenodd"
                                           d="M20.5 9c0-2-1.5-3.9-3.7-3.9-2.3 0-3.8 1.63-4.8 3.33-1-1.7-2.5-3.33-4.8-3.33C5 5.1 3.5 6.867 3.5 9c0 4.62 4.949 7.667 8.5 9.623 3.551-1.956 8.5-5.003 8.5-9.623zm-19-.176C1.5 5.607 3.962 3 7 3c2.7 0 4 1 5 2.2C13 4 14.3 3 17 3c3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
                                           fill="#1b1c1d"></path>
                                   </svg></div>
                               <span class="like_num"><span id="nlike_prt">${onInfo.l_count}</span></span>
                           </button>
                           
                            <button type="button" class="likebtn full_heart" color="default" fill="false"
                             onclick="like_cancle()">
                                  <div class="sc-fzqARJ eozcfK">
                                      <svg width="18" height="18" fill="none" viewBox="0 0 24 24">
                                          <path fill-rule="evenodd" clip-rule="evenodd"
                                              d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
                                              fill="#1b1c1d"></path>
                                      </svg></div>
                                  <span class="like_num"><span id="like_prt">${onInfo.l_count}</span></span>
                              </button>
                         
                 </c:otherwise>
               </c:choose>

							</div>
							<div class="btn_div">
								<button type="button" class="likebtn sharebtn" color="default"
									fill="false">
									<div class="sc-fzqARJ eozcfK">
										<svg width="18" height="18" fill="none" viewBox="0 0 24 24">
                                            <path fill-rule="evenodd"
												clip-rule="evenodd"
												d="M20 19v-7h2v8a1 1 0 01-1 1H3a1 1 0 01-1-1v-8h2v7h16zM13 5.829l3.586 3.587L18 8 12 2 6 8.001l1.414 1.415L11 5.829V16h2V5.83z"
												fill="#1b1c1d"></path></svg>
									</div>
									<span class="like_num">공유하기</span>
								</button>
							</div>
						</div>
						<c:if test="${m_email == ''}">
							<button type="button" class="class_submitbtn" color="red"
								id="apply" fill="true">
								<a onclic="alret();"> <span class="sc-fzoyTs jZUSDr"
									id="apply"><span>클래스 신청하기</span> </span></a>
							</button>
						</c:if>
						<c:if test="${m_email != ''}">
							<form name="ofcFrm" id="ofcFrm" action="apply" method="get">
								<input type="hidden" name="m_email" value="${m_email}">
								<input type="hidden" name="ofc_code" value="${offInfo.ofc_code}">
								<div class="class_submitbtn" color="orange" idid="apply"
									fill="true">
									<span class="sc-fzoyTs jZUSDr" id="apply"><span>
												<input type="submit" value="클래스 신청하기"></span> </span>
									
								</div>
							</form>

						</c:if>

					</div>
				</div>
				<div class="sc-pDbHj jvrfBM sc-pZCuu fVtWky show2">
					<div class="sc-oTaid fgxYOw" style="min-height: 0px;">
						<div class="sc-paWVw gzcrzB">
							<h3 class="sc-fzplWN rzudF sc-pjTqr jJFvBj">공유하기</h3>
							<button type="button"
								class="sc-fzqNqU fsyYOM sc-fzqPZZ bDLHXT closer"
								color="transparent">
								<span class="sc-fzoyTs jZUSDr"><svg width="24"
										height="24" fill="none" viewBox="0 0 24 24">
                                        <path
											d="M18.5 4L12 10.5 5.5 4 4 5.5l6.5 6.5L4 18.5 5.5 20l6.5-6.5 6.5 6.5 1.5-1.5-6.5-6.5L20 5.5 18.5 4z"
											fill="#1b1c1d"></path></svg></span>
							</button>
						</div>
						<div class="sc-qQlgh bJEPkb">
							<div class="ShareModalBottomSheet__Container-kk26a5-0 cSqgOv">
								<div class="ShareButton__Container-f3i5k7-0 llVJRo">
									<a href="#"
										onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;"
										target="_blank" alt="Share on kakaostory">
										<div class="ShareButton__Button-f3i5k7-1 ipUSgi">
											<svg width="24" height="24" viewBox="0 0 24 24">
											<path fill="#1B1C1D" fill-rule="evenodd"
													d="M12 4c-4.97 0-9 3.185-9 7.115 0 2.557 1.707 4.8 4.27 6.054-.188.702-.682 2.545-.78 2.94-.123.49.178.483.376.351.155-.103 2.466-1.675 3.464-2.353.541.08 1.1.123 1.67.123 4.97 0 9-3.186 9-7.115C21 7.185 16.97 4 12 4"></path></svg>
										</div>
									</a>
								</div>
								<div class="ShareButton__Container-f3i5k7-0 llVJRo">
									<a href="#"
										onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
										target="_blank" alt="Share on Twitter">

										<div class="ShareButton__Button-f3i5k7-1 gFdtJW">
											<svg viewBox="0 0 64 64" width="36" height="36">
											<g>
											<path fill="#FFF"
													d="M48,22.1c-1.2,0.5-2.4,0.9-3.8,1c1.4-0.8,2.4-2.1,2.9-3.6c-1.3,0.8-2.7,1.3-4.2,1.6 C41.7,19.8,40,19,38.2,19c-3.6,0-6.6,2.9-6.6,6.6c0,0.5,0.1,1,0.2,1.5c-5.5-0.3-10.3-2.9-13.5-6.9c-0.6,1-0.9,2.1-0.9,3.3 c0,2.3,1.2,4.3,2.9,5.5c-1.1,0-2.1-0.3-3-0.8c0,0,0,0.1,0,0.1c0,3.2,2.3,5.8,5.3,6.4c-0.6,0.1-1.1,0.2-1.7,0.2c-0.4,0-0.8,0-1.2-0.1 c0.8,2.6,3.3,4.5,6.1,4.6c-2.2,1.8-5.1,2.8-8.2,2.8c-0.5,0-1.1,0-1.6-0.1c2.9,1.9,6.4,2.9,10.1,2.9c12.1,0,18.7-10,18.7-18.7 c0-0.3,0-0.6,0-0.8C46,24.5,47.1,23.4,48,22.1z"></path></g></svg>
										</div>
									</a>
								</div>
								<div class="ShareButton__Container-f3i5k7-0 llVJRo">
									<a href="#"
										onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
										target="_blank" alt="Share on Facebook">
										<div class="ShareButton__Button-f3i5k7-1 jdAwxw">
											<svg width="24" height="24" viewBox="0 0 24 24">
											<path fill="#FFF" fill-rule="evenodd"
													d="M20.007 3H3.993A.993.993 0 003 3.993v16.014c0 .549.444.993.993.993h8.621v-6.97h-2.347v-2.716h2.347V9.308c0-2.324 1.42-3.589 3.494-3.589.994 0 1.848.072 2.096.106v2.43h-1.44c-1.125 0-1.344.54-1.344 1.327v1.733h2.689l-.349 2.722h-2.34V21h4.587a.993.993 0 00.993-.993V3.993A.993.993 0 0020.007 3"></path></svg>
										</div>
									</a>
								</div>
								<div class="ShareButton__Container-f3i5k7-0 llVJRo">
									<a href="#"
										onClick="javascript:window.clipboardData.setData('Text', location.href)"
										id="sh-link">
										<div class="ShareButton__LinkButton-f3i5k7-2 dYmVXl">
											<svg width="20" height="20" fill="none" viewBox="0 0 24 24">
											<path fill-rule="evenodd" clip-rule="evenodd"
													d="M14 8a1 1 0 011-1h3a5 5 0 010 10h-3a1 1 0 110-2h3a3 3 0 100-6h-3a1 1 0 01-1-1zm-4 8a1 1 0 01-1 1H6A5 5 0 016 7h3a1 1 0 010 2H6a3 3 0 100 6h3a1 1 0 011 1zm-3-4a1 1 0 011-1h8a1 1 0 110 2H8a1 1 0 01-1-1z"
													fill="#1B1C1D"></path></svg>
											<span class="ShareButton__LinkText-f3i5k7-3 gcriev">링크
												복사하기</span>
										</div>
									</a>
								</div>
							</div>
						</div>
						<div class="sc-pAYXY fmggLq"></div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>

<script>
	function alret() {
		alret("로그인이 필요합니다.");
		href = ('/loginFrm');
	};
</script>
<script type=text/javascript>
	$(document)
			.on(
					"click",
					"#sh-link",
					function(e) {
						// 링크복사 시 화면 크기 고정
						$('html')
								.find('meta[name=viewport]')
								.attr(
										'content',
										'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no');
						var html = "<input id='clip_target' type='text' value='' style='position:absolute;top:-9999em;'/>";

						$(this).append(html);
						var input_clip = document.getElementById("clip_target");
						//현재 url 가져오기 
						var _url = $(location).attr('href');
						$("#clip_target").val(_url);
						if (navigator.userAgent.match(/(iPod|iPhone|iPad)/)) {
							var editable = input_clip.contentEditable;

							var readOnly = input_clip.readOnly;
							input_clip.contentEditable = true;
							input_clip.readOnly = false;

							var range = document.createRange();
							range.selectNodeContents(input_clip);

							var selection = window.getSelection();
							selection.removeAllRanges();
							selection.addRange(range);
							input_clip.setSelectionRange(0, 999999);

							input_clip.contentEditable = editable;
							input_clip.readOnly = readOnly;

						} else {
							input_clip.select();
						}
						try {
							var successful = document.execCommand('copy');
							input_clip.blur();
							if (successful) {
								alert("URL이 복사 되었습니다. 원하시는 곳에 붙여넣기 해 주세요.");
								// 링크복사 시 화면 크기 고정 

								$('html')
										.find('meta[name=viewport]')
										.attr(
												'content',
												'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes');
							} else {
								alert('이 브라우저는 지원하지 않습니다.');
							}
						} catch (err) {
							alert('이 브라우저는 지원하지 않습니다.');
						}
					});
</script>
</html>
