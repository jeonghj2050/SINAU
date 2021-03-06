<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html lang="en">
<head>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/payment/payment.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/style.css" />
<title>결제창</title>
<script>
	$(document).ready(function() {
		var sale;

		var cp = '${payCoupon[0].cpl_code}';
		var sort = '${sort}';
		
		console.log("dsfjl");
		console.log(cp);
		console.log(sort);

		if (cp == '') {
			$('#list1').hide();
			$('#list2').show();
		} else if (cp != '') {
			$('#list1').show();
			$('#list2').hide();
		}

		$("#res-submit").click(function() {
			var cplcode = $('input:radio[name=cpl_code]:checked').val();
			console.log(cplcode);
			alert("쿠폰이 적용되었습니다!");

			var data = {
				"cplcode" : cplcode
			}

			$(".cplcode").val(cplcode);

			$.ajax({
				url : "getCoupon",
				type : "post",
				data : data,
				dataType : "JSON",
				success : function(data) {
					if (sort == 'prod') {
						sale = '${prodList.p_price}';
					} else if (sort == 'onc') {
						sale = '${onList.onc_sale}';
						
					} else if (sort == 'ofc') {
						sale = '${offList.ofc_sale}';
					}
					console.log(data);
					var discount = (data * sale * 0.01);
					var price = sale - discount;
					var intPrice = parseInt(price);

					//확인 버튼 누르는 순간  id or class 값 가져와서 값을 data로 채워줘라			
					$(".pay-list-discount").html(discount + "원");
					$(".pay-list-disprice").html(price + "원");
					$(".ord_price").val(intPrice);

				},
				error : function(error) {
					alert("쿠폰 적용에 실패했습니다.");
				}
			});
		});
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section>
		<div class="show1">
			<div class="payment-top">
				<div class="payment-top-txt">결제하기</div>
			</div>
			<form name="payment" action="completion_pay" method="post"
				id="payForm">

				<div class="payment-center-wrap">
					<div class="payment-center">
						<c:if test='${sort eq "prod"}'>
							<div class="order-info">
								<h1>주문 정보</h1>
								<input type="hidden" name="ord_pcode" value="${prodList.p_code}">${prodList.p_title}
								<div class="pay-img">
									<img style="height: 200px; width: 200px; border-radius: 5px"
										id="pay-img" src="resources/upload/${prodList.f_sysname}">
								</div>
								<br>
							</div>
						</c:if>
						<c:if test='${sort eq "onc"}'>
							<div class="order-info">
								<h1>주문 정보</h1>
								<input type="hidden" name="ord_pcode" value="${onList.onc_code}">${onList.onc_title}
								<div class="pay-img">
									<img style="height: 200px; width: 200px; border-radius: 5px"
										id="pay-img" src="resources/upload/${onList.f_sysname}">
								</div>
								<br>
							</div>
						</c:if>
						<c:if test='${sort eq "ofc"}'>
							<div class="order-info">
								<h1>주문 정보</h1>
								<input type="hidden" name="ord_pcode" value="${offList.ofc_code}">${offList.ofc_title}
								<input type="hidden" name="sc_code" value="${sc_code}">
								<div class="pay-img">
									<img style="height: 200px; width: 200px; border-radius: 5px"
										id="pay-img" src="resources/upload/${offList.f_sysname}">
								</div>
								<br>
							</div>
						</c:if>
						<hr>
						<hr>
						<div class="del-info">
							<h1>배송 정보</h1>
							<form class="del-info">
								받으시는 분<br> <input type="text" name="ord_diposit"><br>
								주소<br> <input type="text" class="addr1"
									id="sample4_postcode" placeholder="우편번호"> <input
									type="button" onclick="sample4_execDaumPostcode()"
									value="우편번호 찾기"><br> <input type="text"
									class="addr2" id="sample4_roadAddress" placeholder="도로명주소">
								<!-- <span id="guide" style="color: #999; display: none"></span>  -->
								<input type="text" class="addr3" id="sample4_detailAddress"
									placeholder="상세주소"> <br> 배송 메시지<br> <input
									type="text" name="ord_memo"
									style="width: 485px; height: 100px; text-align: start;"><br>
								<input type="hidden" name="ord_addr" class="ord_addr">
							</form>
						</div>
						<hr>
						<div class="pay-list">
							<h1>결제 금액</h1>
							<div class="pay-list_l">
								<div>총 상품 금액</div>
								<div>배송비</div>
								<div>쿠폰 적용</div>
								<div>최종 가격</div>
							</div>
							<c:if test='${sort eq "prod"}'>
								<div class="pay-list_r">
									<div>${prodList.p_price}원</div>
									<div>무료</div>
									<div class="pay-list-discount">0원</div>
									<input type="hidden" class="ord_price" name="ord_price" value="${prodList.p_price}">
									<div class="pay-list-disprice">${prodList.p_price}원</div>
								</div>
								<input type="hidden" class="cplcode" name="cplcode">
							</c:if>
							<c:if test='${sort eq "onc"}'>
								<div class="pay-list_r">
									<div>${onList.onc_sale}원</div>
									<div>무료</div>
									<div class="pay-list-discount">0원</div>
									<input type="hidden" class="ord_price" name="ord_price" value="${onList.onc_sale}">
									<div class="pay-list-disprice">${onList.onc_sale}원</div>
								</div>
								<input type="hidden" class="cplcode" name="cplcode">
							</c:if>
							<c:if test='${sort eq "ofc"}'>
								<div class="pay-list_r">
									<div>${offList.ofc_sale}원</div>
									<div>무료</div>
									<div class="pay-list-discount">0원</div>
									<input type="hidden" class="ord_price" name="ord_price" value="${offList.ofc_sale}">
									<div class="pay-list-disprice">${offList.ofc_sale}원</div>
								</div>
								<input type="hidden" class="cplcode" name="cplcode">
							</c:if>
						</div>
						<div class="coupon">
							<button class="couponbtn">쿠폰 적용하기</button>
						</div>
						<hr>
						<div class="pay-how">
							<div class="pay1" tabindex="1">
								<img class="how-img" src="/resources/images/payment/card.png">
								<div class="how-txt">카드 결제</div>
							</div>
							<div class="pay2" tabindex="2">
								<img class="how-img"
									src="/resources/images/payment/passbook.png">
								<div class="how-txt">무통장 입금</div>
							</div>
						</div>
							<input type="submit" id="pay-submit" value="결제하기">
					</div>
				</div>
			</form>
		</div>

		<div class="modal">
			<div class="modal-wrap">
				<div class="coupon-header">쿠폰 할인 적용</div>
				<div class="coupon-body">
					<div>사용 가능한 쿠폰만 보여집니다.</div>
					<hr>
					<div class="coupon-apply">
						쿠폰 적용
						<div class="buy-list">
							<div class="buy-list-top">상품 목록</div>
							<div class="buy-list-body">
							<c:if test='${sort eq "prod"}'>
								<div>${prodList.p_title}</div>
								<div>${prodList.p_price}원</div>
							</c:if>
							<c:if test='${sort eq "onc"}'>
								<div>${onList.onc_title}</div>
								<div>${onList.onc_sale}원</div>
							</c:if>
							<c:if test='${sort eq "ofc"}'>
								<div>${offList.ofc_title}</div>
								<div>${offList.ofc_sale}원</div>
							</c:if>
							</div>
							<div class="buy-list-bottom">
								<div class="coupon-list" id="list1">
									<div class="coupon-list-title">쿠폰 목록</div>
									<div class="coupon-list-top">
										<div class="coupon-title-txt">쿠폰명</div>
										<div class="disper">할인</div>
									</div>
									<c:forEach var="payCoupon" items="${payCoupon}"
										varStatus="status">
										<div class="coupon-list-bottom">
											<input type="radio" class="coupon-sel" name="cpl_code"
												value="${payCoupon.cpl_code}">
											<div class="coupon-title">${payCoupon.cp_title}</div>
											<div class="disper">${payCoupon.cp_discount}</div>
										</div>
									</c:forEach>
								</div>
								<div class="coupon-list" id="list2">사용 가능한 쿠폰이 없습니다.</div>
							</div>
						</div>
						<div class="coupon-btn">
							<input type="button" id="res-submit" value="완료"> <input
								type="reset" id="res-cancel" value="취소">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js%22%3E%3C/script"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js%22%3E%3C/script"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		$("#payForm").submit(function() {
			var addr1 = $(".addr1").val();
			var addr2 = $(".addr2").val();
			var addr3 = $(".addr3").val();

			$(".ord_addr").val(addr1 + " " + addr2 + " " + addr3);

			console.log($(".ord_addr").val());
		}); // end submit()
	});
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();

	}
</script>
<script type="text/javascript">
	$(document).ready(function() {

		$('.show1').show();
		$('.modal').hide();

		$('.couponbtn').click(function() {
			$('.modal').show(); //클릭 시 두 번째 요소 표시
			return false;
		});

		$('.coupon-btn').click(function() {
			$('.modal').hide();
			$('.show1').show();
			return false;
		});
		$('.coupon-btn').click(function() {
			$('.modal').hide();
			$('.show1').show();
			return false;
		});
	});
</script>
</html>