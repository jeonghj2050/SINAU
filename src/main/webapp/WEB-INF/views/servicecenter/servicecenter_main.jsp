<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="resources/css/servicecenter.css?a">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.FAQ_tab li").click(function() {

			$("ul.FAQ_tab li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});

	});
	

</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section class="sectionover">
		<h2 class="login-header">고객 센터</h2>
		<div class="cate_container">
			<a class="category" href="./servicecenter_main">FAQ</a>
			<a class="category" href="./servicecenter_question">1 : 1문의</a>
			<a class="category" href="./servicecenter_refund">환불내역</a>
		</div>
		<div class="FAQ_box">
			<ul class="FAQ_tab">
				<li><a href="#tab1">강좌 관련</a></li>
				<li><a href="#tab2">상품 관련</a></li>
				<li><a href="#tab3">주문 결제</a></li>
				<li><a href="#tab4">주문 취소</a></li>
				<li><a href="#tab5">배송 안내</a></li>
				<li><a href="#tab6">회원 관련</a></li>
				<li><a href="#tab7">환불</a></li>
				<li><a href="#tab8">신고</a></li>
				<li><a href="#tab9">쿠폰 관련</a></li>
				<li><a href="#tab10">기타</a></li>
			</ul>
			<div class="FAQ_title">
				<div class="FAQ_num">번호</div>
				<div class="FAQ_content">내용</div>
			</div>
			<div class="tab_container">

				<div id="tab1" class="tab_content">
					
					<div class="contents">
						<a class="num">1</a><button onclick="fn_spread('hiddenContent01');">강좌 수강 도중 환불할수있나요?</button>
						<div id="hiddenContent01" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						강좌 수강도중 환불 가능합니다.</div>
						<a class="num">2</a><button onclick="fn_spread('hiddenContent02');">강좌 담당강사에서 물어보고싶은건 어디서 물어보나요?</button>
						<div id="hiddenContent02" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						강좌 페이지에서 1대1로 물어보실수있습니다.</div>
						<a class="num">3</a><button onclick="fn_spread('hiddenContent03');">강좌키트는 언제 받을수있나요?</button>
						<div id="hiddenContent03" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						오전 10시 이전에 수강 신청을 할 경우 당일배송이 되니 1~2일 뒤에 도착예정입니다.</div>
						<a class="num">4</a><button onclick="fn_spread('hiddenContent04');">수강기간이 끝나면 연장을 못하나요?</button>
						<div id="hiddenContent04" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						연장 가능합니다.</div>
						<a class="num">5</a><button onclick="fn_spread('hiddenContent05');">연장하면 처음듣을때와 같은 가격을 내야하나요?</button>
						<div id="hiddenContent05" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						아닙니다. 20%정도 세일된 가격으로 재수강이 가능합니다.</div>
						<a class="num">6</a><button onclick="fn_spread('hiddenContent06');">키트없이 수강 못하나요?</button>
						<div id="hiddenContent06" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						저흰 SINAU는 패키지로만 판매하니 키트없인 수강신청을 할 수 없습니다.</div>
						<a class="num">7</a><button onclick="fn_spread('hiddenContent07');">키트는 여러가지 구매할수 없나요?</button>
						<div id="hiddenContent07" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						대부분의 키트는 스토어에 판매중이니 구입이 가능합니다.</div>
						<a class="num">8</a><button onclick="fn_spread('hiddenContent08');">수강을 여러개 들을수 있나요?</button>
						<div id="hiddenContent08" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						수강 신청은 중복이 가능합니다.</div>
						<a class="num">9</a><button onclick="fn_spread('hiddenContent09');">수강기간이 끝나고 연장하면 기간만 연장되는건가요?</button>
						<div id="hiddenContent09" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						기간만 연장하실수도 있고 키트도 다시 받을수있습니다.</div>
					</div>
				</div>

				<div id="tab2" class="tab_content">
					<div class="contents">
						<a class="num">1</a><button onclick="fn_spread('hiddenContent10');">재고가 없어요. 언제쯤 구입할 수 있을까요?</button>
						<div id="hiddenContent10" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						일반적으로 입점 업체의 품절 상품 재입고 여부 및 일정은 무신사 스토어에서는 <br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;정확히 알기 어렵습니다. 재입고 여부는 상품 상세 페이지의 상품문의 게시판을<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;통하여 문의하시는 것이 가장 정확합니다. 재입고 알림을 등록하시면 재입고 알림 문자를<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;받아보실 수 있습니다.</div>
						<a class="num">2</a><button onclick="fn_spread('hiddenContent11');">가격이 떨어져 예전에 구매했을 때 보다 싸게 팔고 있는 경우 차액 환불이 되나요?</button>
						<div id="hiddenContent11" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						판매 가격의 변동에 따른 차액을 보상해드리지 않습니다.</div>
						<a class="num">3</a><button onclick="fn_spread('hiddenContent12');">사진과 제품의 실제 색상이 다른 것 같아요.</button>
						<div id="hiddenContent12" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						온라인의 특성상 상품 이미지는 출력되는 모니터 환경에 따라 조금씩<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp; 차이가 있을 수 있으며 이는 판매자 사유에 의한 교환 및 환불 대상이 아닙니다.</div>
						<a class="num">4</a><button onclick="fn_spread('hiddenContent13');">정식 수입상품과 병행수입상품은 무슨 차이인가요?</button>
						<div id="hiddenContent13" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>
						<a class="num">5</a><button onclick="fn_spread('hiddenContent14');">상품 문의는 어떻게 작성하나요?</button>
						<div id="hiddenContent14" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>
						<a class="num">6</a><button onclick="fn_spread('hiddenContent15');">캐리오버 제품이 무엇인가요?</button>
						<div id="hiddenContent15" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>
						<a class="num">7</a><button onclick="fn_spread('hiddenContent16');">상품 문의 작성 후 수정, 삭제할 수 있나요?</button>
						<div id="hiddenContent16" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>
						<a class="num">8</a><button onclick="fn_spread('hiddenContent17');">반품 주소지가 어떻게 되나요?</button>
						<div id="hiddenContent17" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>
					</div>
				</div>
				<div id="tab3" class="tab_content">
					<div class="contents">
						<a class="num">1</a><button onclick="fn_spread('hiddenContent20');">바로접속 ON 일시에만 회원 할인 혜택이 정상 제공됩니다.</button>
						<div id="hiddenContent20" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;	
						바로 접속 ON 은 SINAU 즐겨찾기 접속이나 SINAU URL을 입력하여 바로 접속한 경우에만 해당되며,<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;SINAU의 회원 할인 혜택을 받으실 수 있습니다. 바로 접속 OFF는 네이버 키워드 광고, 배너광고,<br> 
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;지식쇼핑 및 다음 쇼핑하우 등 광고를 통한 접속 시, 회원 할인 혜택이 제공되지 않으며, 적립금 사용이 불가능합니다.<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;또한 비회원으로 주문 시에도 회원 혜택이 적용되지 않으니 바로 접속 OFF 상태(광고 접속)에서 바로 접속 ON을<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;희망하시는 경우 모든 인터넷 창을 닫으신 후 즐겨찾기나  SINAU URL(http://localhost/)을 직접 입력하여 접속하시기 바랍니다.<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;위와 같은 경우에도 바로 접속 OFF 상태일 경우 아래 URL을 복사하여 주소창에 입력하셔서 접속, 새로 고침 해보시기 바랍니다.</div>
						<a class="num">2</a><button onclick="fn_spread('hiddenContent21');">복합결제가 가능한가요?</button>
						<div id="hiddenContent21" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						복합결제는 현재 지원하지 않습니다. 구매를 희망하시는 고객님들께서는 한 가지의 결제수단을 이용해 주시기 바랍니다.</div>
						<a class="num">3</a><button onclick="fn_spread('hiddenContent22');">주소 검색이 안돼요.</button>
						<div id="hiddenContent22" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;					
						주소지는 행정안전부의 [도로명 조회 사이트]에서 검색되는 주소를 기반으로 합니다.<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;띄어쓰기, 오타 여부 및 검색을 통해 실제 존재하는 주소인지 확인 부탁드립니다.<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;주소가 등록되어 있지 않다면 [도로명주소 도움센터]에 등록 요청을 해주시기 바랍니다.<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;단, 도로명은 건물에 부여되는 주소이므로 건물이 있지 않은 장소는 도로명 주소로 등록되지 않습니다.<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;도로명 조회 사이트에 등록되어 있으나 배송지 검색이 안될 경우 1:1문의글로 주소지와 함께 요청해주시기 바랍니다.<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;도로명 주소가 있지 않은 주소지는 등록이 불가능합니다.</div>
						<a class="num">4</a><button onclick="fn_spread('hiddenContent23');">주소지 건물명이 변경되었어요.</button>
						<div id="hiddenContent23" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						주소지는 행정안전부의 [도로명 조회 사이트]에서 검색되는 주소를 기반으로 합니다.<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;검색 시 건물명이 변경되어 있지 않은 경우 [도로명주소 도움센터]에 변경 요청을 해주시기 바랍니다.<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;도로명 조회 사이트에 등록되어 있으나 건물명이 검색되지 않을 경우 1:1문의글로 주소지와 함께 요청해주시기 바랍니다.</div>
						<a class="num">5</a><button onclick="fn_spread('hiddenContent24');">알림톡에서 계좌 입금을 할 수 있나요?</button>
						<div id="hiddenContent24" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						전송된 알림톡의 계좌번호를 탭 하면 계좌송금 메뉴가 나타납니다. 카카오페이의 계좌송금 기능을 통해 입금할 수 있습니다.<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;이 기능을 이용하기 위해선 사용할 계좌 인증 및 자동이체 출금동의 절차를 완료해야 합니다. 계좌 인증 및 동의는 카카오톡<br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp; > 더 보기 > 카카오페이 > 송금 > 계좌번호에서 계좌 추가를 진행하면 됩니다.</div>
						<a class="num">6</a><button onclick="fn_spread('hiddenContent25');">해외 카드로 결제 가능한가요?</button>
						<div id="hiddenContent25" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						대한민국 외에서 발급된 해외 카드(VISA, MasterCard, JCB만 해당)도 결제 가능합니다.</div>
						<a class="num">7</a><button onclick="fn_spread('hiddenContent26');">해외 카드도 부분 취소 가능한가요?</button>
						<div id="hiddenContent26" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						해외 카드는 부분 취소가 불가능합니다. 묶음 주문 시 유의해 주시기 바랍니다.</div>
						<a class="num">8</a><button onclick="fn_spread('hiddenContent27');">카드 및 현금 영수증, 거래 명세서는 어디에서 조회할 수 있나요?</button>
						<div id="hiddenContent27" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;
						주문 상세 내역의 최종 결제 정보에서 영수증 또는 거래 명세서 조회가 가능합니다.</div>				
					</div>
				</div>
				<div id="tab4" class="tab_content">
					<div class="contents">
						<a class="num">1</a><button onclick="fn_spread('hiddenContent30');">입금 전 주문 취소는 어떻게 하나요?</button>
						<div id="hiddenContent30" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>		
						<a class="num">2</a><button onclick="fn_spread('hiddenContent31');">주문 후 입금이 많이 늦었어요.</button>
						<div id="hiddenContent31" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>		
						<a class="num">3</a><button onclick="fn_spread('hiddenContent32');">결제한 주문을 취소하고 싶어요.</button>
						<div id="hiddenContent32" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>		
						<a class="num">4</a><button onclick="fn_spread('hiddenContent33');">주문이 자동 취소 되어있어요.</button>
						<div id="hiddenContent33" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>		
						<a class="num">5</a><button onclick="fn_spread('hiddenContent34');">동일상품을 반복적으로 주문 후 취소하는 경우 스토어 이용이 제한 될 수 있습니다.</button>
						<div id="hiddenContent34" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>		
					</div>
				</div>
				<div id="tab5" class="tab_content">
					<div class="contents">
						<a class="num">1</a><button onclick="fn_spread('hiddenContent40');">배송 관련 기본 사항입니다.</button>
						<div id="hiddenContent40" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">2</a><button onclick="fn_spread('hiddenContent41');">상품 배송비 무료 맞나요?</button>
						<div id="hiddenContent41" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">3</a><button onclick="fn_spread('hiddenContent42');">해외에 거주하고 있습니다. 해외 배송이 가능한가요?</button>
						<div id="hiddenContent42" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">4</a><button onclick="fn_spread('hiddenContent43');">수령 시 부재로 반송된 경우 어떻게 하나요?</button>
						<div id="hiddenContent43" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">5</a><button onclick="fn_spread('hiddenContent44');">주문한 상품과 다른 상품이 배송되었어요</button>
						<div id="hiddenContent44" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">6</a><button onclick="fn_spread('hiddenContent45');">배송 준비 중 / 발송 후 주소지를 변경할 수 있나요?</button>
						<div id="hiddenContent45" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">7</a><button onclick="fn_spread('hiddenContent46');">주문한 상품이 일부만 도착했어요.</button>
						<div id="hiddenContent46" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">8</a><button onclick="fn_spread('hiddenContent47');">운송장 조회 시 다른 사람의 정보가 나오고 있어요.</button>
						<div id="hiddenContent47" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
					</div>
				</div>
				<div id="tab6" class="tab_content">
					<div class="contents">
						<a class="num">1</a><button onclick="fn_spread('hiddenContent50');">회원 가입은 어떻게 하나요?</button>
						<div id="hiddenContent50" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">2</a><button onclick="fn_spread('hiddenContent51');">회원 정보 수정은 어디서 하나요?</button>
						<div id="hiddenContent51" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">3</a><button onclick="fn_spread('hiddenContent52');">비회원 구매를 하려고 하는데 주의해야 할 점이 있나요?</button>
						<div id="hiddenContent52" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">4</a><button onclick="fn_spread('hiddenContent53');">회원 탈퇴는 어떻게 하나요?</button>
						<div id="hiddenContent53" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">5</a><button onclick="fn_spread('hiddenContent54');">개인 정보는 안전하게 보호되나요?</button>
						<div id="hiddenContent54" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">6</a><button onclick="fn_spread('hiddenContent55');">개명을 했습니다. 이름을 변경하고 싶어요.</button>
						<div id="hiddenContent55" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">7</a><button onclick="fn_spread('hiddenContent56');">회원 탈퇴를 취소하고 싶습니다.</button>
						<div id="hiddenContent56" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">8</a><button onclick="fn_spread('hiddenContent57');">회원 등급이 낮아졌어요.</button>
						<div id="hiddenContent57" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">9</a><button onclick="fn_spread('hiddenContent58');">생일 쿠폰은 언제 발급되나요?</button>
						<div id="hiddenContent58" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">10</a><button onclick="fn_spread('hiddenContent59');">휴대폰 번호 인증 시 이미 존재하는 휴대폰이라고 뜰 때는 어떻게 해야 하나요?</button>
						<div id="hiddenContent59" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
					</div>
				</div>
				<div id="tab7" class="tab_content">
					<div class="contents">
						<a class="num">1</a><button onclick="fn_spread('hiddenContent60');">환불 접수 및 절차</button>
						<div id="hiddenContent60" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">2</a><button onclick="fn_spread('hiddenContent61');">상품 불량, 오배송 환불</button>
						<div id="hiddenContent61" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">3</a><button onclick="fn_spread('hiddenContent62');">환불 시 반품 비용은 어떻게 되나요?</button>
						<div id="hiddenContent62" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">4</a><button onclick="fn_spread('hiddenContent63');">반품한 상품이 해당 업체에 도착하였는데 환불은 언제 되나요?</button>
						<div id="hiddenContent63" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">5</a><button onclick="fn_spread('hiddenContent64');">해외 배송 상품을 환불하고 싶어요.</button>
						<div id="hiddenContent64" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">6</a><button onclick="fn_spread('hiddenContent65');">환불인데 왕복 택배 비용을 부담해야 하나요?</button>
						<div id="hiddenContent65" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">7</a><button onclick="fn_spread('hiddenContent66');">반품 배송비를 동봉하지 않았습니다.</button>
						<div id="hiddenContent66" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">8</a><button onclick="fn_spread('hiddenContent67');">상품 수령 전에 환불 할 수 있나요?</button>
						<div id="hiddenContent67" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">9</a><button onclick="fn_spread('hiddenContent68');">휴대폰으로 결제했는데 부분 취소가 가능한가요?</button>
						<div id="hiddenContent68" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">10</a><button onclick="fn_spread('hiddenContent69');">카드로 결제했는데 계좌로 환불 받을 수 있을까요?</button>
						<div id="hiddenContent69" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
					</div>
				</div>
				<div id="tab8" class="tab_content">
					<div class="contents">
						<a class="num">1</a><button onclick="fn_spread('hiddenContent70');">신고는 어디서 하나요?</button>
						<div id="hiddenContent70" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">2</a><button onclick="fn_spread('hiddenContent71');">신고는 어떻게 처리가 되나요?</button>
						<div id="hiddenContent71" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">3</a><button onclick="fn_spread('hiddenContent72');">신고당한 사유도 알수있나요?</button>
						<div id="hiddenContent72" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">4</a><button onclick="fn_spread('hiddenContent73');">신고누적횟수도 볼수있나요?</button>
						<div id="hiddenContent73" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">5</a><button onclick="fn_spread('hiddenContent74');">신고 3번 이상이면 벤당하나요?</button>
						<div id="hiddenContent74" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">6</a><button onclick="fn_spread('hiddenContent75');">신고누적횟수를 줄일 방법은 없나요?</button>
						<div id="hiddenContent75" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
					</div>
				</div>
				<div id="tab9" class="tab_content">
					<div class="contents">
						<a class="num">1</a><button onclick="fn_spread('hiddenContent80');">쿠폰은 중복사용가능한가요?</button>
						<div id="hiddenContent80" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">2</a><button onclick="fn_spread('hiddenContent81');">쿠폰 기간은 연장할수있나요?</button>
						<div id="hiddenContent81" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">3</a><button onclick="fn_spread('hiddenContent82');">쿠폰 미사용시 어떻게 되나요?</button>
						<div id="hiddenContent82" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">4</a><button onclick="fn_spread('hiddenContent83');">강좌관련 쿠폰을 주시나요?</button>
						<div id="hiddenContent83" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
					</div>
				</div>
				<div id="tab10" class="tab_content">
					<div class="contents">
						<a class="num">1</a><button onclick="fn_spread('hiddenContent90');">무신사 고객센터 업무 시간이 궁금해요. 주말에도 문의가 가능한가요?</button>
						<div id="hiddenContent90" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">2</a><button onclick="fn_spread('hiddenContent91');">[TOSS] 휴대폰 번호, 기기가 변경되었습니다. 기존에 이용하던 토스는 어떻게 이용할 수 있나요?</button>
						<div id="hiddenContent91" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">3</a><button onclick="fn_spread('hiddenContent92');">[TOSS] 토스 비밀번호를 분실하였습니다. 재발급 방법은 어떻게 되나요?</button>
						<div id="hiddenContent92" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">4</a><button onclick="fn_spread('hiddenContent93');">[TOSS] 계좌 등록 시, 사업자 계좌로 이용이 가능한가요?</button>
						<div id="hiddenContent93" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">5</a><button onclick="fn_spread('hiddenContent94');">택배사 고객센터 번호 안내 입니다.</button>
						<div id="hiddenContent94" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">6</a><button onclick="fn_spread('hiddenContent95');">상품Q&A는 상품 문의로 이용 해주시기 바랍니다.</button>
						<div id="hiddenContent95" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">7</a><button onclick="fn_spread('hiddenContent96');">SINAU 랭킹은 무엇이고 또 어떤 기준으로 정해지나요?</button>
						<div id="hiddenContent96" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">8</a><button onclick="fn_spread('hiddenContent97');">새벽(아침) 시간에 특이한 상품이 랭킹에 올라와요.</button>
						<div id="hiddenContent97" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">9</a><button onclick="fn_spread('hiddenContent98');">랭킹에 광고가 포함되어 있나요?</button>
						<div id="hiddenContent98" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
						<a class="num">10</a><button onclick="fn_spread('hiddenContent99');">인위적인 랭킹 조작이 발견될 시 페널티가 있나요?</button>
						<div id="hiddenContent99" class="contentsre" style="display: none;">&emsp;&emsp;답변&emsp;&emsp;내용222</div>	
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
function fn_spread(id) {
	var getID = document.getElementById(id);
	getID.style.display = (
			getID.style.display == 'block')
			? 'none' : 'block';
}
</script>

</html>









