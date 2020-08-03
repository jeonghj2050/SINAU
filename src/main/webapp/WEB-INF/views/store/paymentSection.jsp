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
<link rel="stylesheet" href="resources/css/paymentSection.css">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<div class="paymentSection">
		<div class="teacher_name">${pInfoPay.p_dealer}</div>
		<div class="class_explain">${pInfoPay.p_title}</div>
		<div class="lable_container">
			<div class="categories">
				<div class="cate_lable">${pInfoPay.cts_name}</div>
			</div>
		</div>
		<div class="class_price">
			<strong><fmt:formatNumber pattern="###,###,###"
					value="${pInfoPay.p_price}" />원</strong>
		</div>
		<div class="hr"></div>
		<div class="like_container">
			<div class="btn_div">
				<c:choose>
					<c:when test="${mb.m_email == null}">
						<button type="button" class="likebtn unfilled_heart"
							color="default" fill="false" data-test-id="wishlist-button"
							data-test-group="sales-product-info-table-row">
							<div class="sc-fzqARJ eozcfK">
								<svg width="18" height="18" fill="none" viewBox="0 0 24 24">
                                    <path fill-rule="evenodd"
										clip-rule="evenodd"
										d="M20.5 9c0-2-1.5-3.9-3.7-3.9-2.3 0-3.8 1.63-4.8 3.33-1-1.7-2.5-3.33-4.8-3.33C5 5.1 3.5 6.867 3.5 9c0 4.62 4.949 7.667 8.5 9.623 3.551-1.956 8.5-5.003 8.5-9.623zm-19-.176C1.5 5.607 3.962 3 7 3c2.7 0 4 1 5 2.2C13 4 14.3 3 17 3c3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
										fill="#1b1c1d"></path>
                                </svg>
							</div>
							<span class="like_num"><span>${pInfoPay.l_count}</span></span>
						</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="likebtn full_heart" color="default"
							fill="false">
							<div class="sc-fzqARJ eozcfK">
								<svg width="18" height="18" fill="none" viewBox="0 0 24 24">
                                    <path fill-rule="evenodd"
										clip-rule="evenodd"
										d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z"
										fill="#1b1c1d"></path>
                                </svg>
							</div>
							<span class="like_num"><span>${pInfoPay.l_count}</span></span>
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
								fill="#1b1c1d"></path>
                                </svg>
					</div>
					<span class="like_num">공유하기</span>

				</button>
			</div>
		</div>
		<button type="button" class="class_submitbtn" color="orange"
			fill="true">
			<span class="sc-fzoyTs jZUSDr"> <span>구매하기</span></span>
		</button>
		<div>
			<p class="refund_alert"></p>
		</div>
	</div>
	<!-- 공유하기 모달 -->
	<div class="sc-pDbHj jvrfBM sc-pZCuu fVtWky show2">
		<div class="sc-oTaid fgxYOw" style="min-height: 0px;">
			<div class="sc-paWVw gzcrzB">
				<h3 class="sc-fzplWN rzudF sc-pjTqr jJFvBj">공유하기</h3>
				<button type="button"
					class="sc-fzqNqU fsyYOM sc-fzqPZZ bDLHXT closer"
					color="transparent">
					<span class="sc-fzoyTs jZUSDr"><svg width="24" height="24"
							fill="none" viewBox="0 0 24 24">
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

</body>
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
	});
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