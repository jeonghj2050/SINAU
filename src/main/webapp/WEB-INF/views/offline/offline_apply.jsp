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
<link rel="stylesheet" type="text/css" media="screen"
	href="/resources/css/offline/offline_apply.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="/resources/css/style.css" />

<title>오프라인 옵션선택</title>

</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section>
		<div class="wrap-apply">
			<div class="wrap-applytop">
				<div class="wrap-applytop-left">수업신청</div>
				<div class="wrap-applytop-right">신청서 작성</div>
			</div>

			<div class="wrap-applycenter">
			
					<div class="class-apply">
						<div id="classapply-img">
							<img src=" resources/images/offline/sum/${offList.f_oriname}"
								alt="#" width="280px" height="280px">
						</div>
						<div id="classapply-info">
							<li id="sub-cate">${offList.cts_name}</li>
							<li id="creator-name">${offList.ofc_teacher}</li>
							<li id="on-name">${offList.ofc_title}</li>
						</div>
					</div>
		
				<div class="time-table">
					<div class="time-table-txt">
						<img src="/resources/images/offline/time2.png"> 원하는 수업 일정을
						선택해주세요.
					</div>
					<hr>
					<form name="scFrm" id="scFrm" action="payment" method="get"
						enctype="multipart/form-data">
						<c:forEach var="offSchedule" items="${offSchedule}">
							<div class="time-table-info">
								<input type="radio" name="sc_code" value="${offSchedule.sc_code}">
								<div class="time-table-date">${offSchedule.sc_date}</div>
								<div class="time-table-time">${offSchedule.sc_time}</div>
								<div class="time-table-place">${offSchedule.sc_loc}</div>
							</div>
							<hr>
						</c:forEach>
						<br>
						<input type="hidden" name="m_email" value="${m_email}">
						<input type="hidden" name="ofc_code" value="${offList.ofc_code}">
						<div class="btn-offapply">
							<input type="submit" value="완료" id="submit">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script>
	function gopayment() {
		var email = '${mb.m_email}';
		var sel = $(':radio[id="time"]:checked').val();
		var ofc = '${ofc.ofc_code}';

		if (email == '') {
			if (sel == '') {
				alret('일정을 선택해주세요.');
			} else {
				location.href = '/payment/payment?ofc_code=' + ofc + '&&sel='
						+ sel + '&&m_email=' + email;
			}
		} else if (email != '') {
			if (sel == '') {

			} else if (sel != '') {

			}
		}
	}
</script>
</html>