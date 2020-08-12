<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU 오프라인 강의</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/mypage.css?a">
<script>
        $(function(){
            $('li').click(function(){
                $('li').removeClass('item-selected');
                $(this).addClass('item-selected');
            })
        });
    </script>
<script type="text/javascript">
$(document).ready(function(){
	var chk = "${msg}";
	
	if(chk == "2"){
		alert("글 등록 성공!");
		location.reload(true);
	}
	if(chk == "3"){
		alert("글 삭제 성공!");
		location.reload(true);
	}
	
	var name="${loginMember.m_name}";
	$('#mname').html(name + '님');
	$('.suc').css('display','block');
	$('.bef').css('display','none');
	
	$(function(){
		$(".mp_classInfo").hide();
		$(".mp_classInfo:first").show();
		$("#mytab li").click(function(){
			var tabName=$(this).attr('name');
			$(".mp_classInfo").hide();
			$("#"+tabName).show();
		});
	});
	
	var ord_code="";
	var ref_ord_code="";
	$(document).ready(function() {     
	    $('#refund').on('show.bs.modal', function(event) {          
	    	ref_ord_code = $(event.relatedTarget).data('notifyid');
	    	$('#ref_ord_code').val(ref_ord_code);
	    });
	});
});
</script>

</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section class="mp_section">
		<jsp:include page="mypage_nav.jsp"></jsp:include>
		<article>
			<div class="page-title">오프라인 강의</div>
			<div role="tabpanel">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist" id="mytab">
					<c:forEach var="offlineClass" items="${offlineList}">
						<li role="presentation" name="${offlineClass.ofc_code}"><a
							href="#${offlineClass.ofc_code}" aria-controls="home"
							role="tab" data-toggle="tab">${offlineClass.ofc_title}</a></li>
					</c:forEach>
				</ul>
			</div>
			<c:forEach var="offlineClass" items="${offlineList}">
			
				<div class="mp_classInfo" id="${offlineClass.ofc_code}">
					<a href="info?ofc_code=${offlineClass.ofc_code}">
					<img src="resources/upload/${offlineClass.f_sysname }" alt=""
						width="300px" height="300px" id="mp_class_img"></a>
					<div>
						<div class="class_info_contents" id="${offlineClass.ofc_code}">
							<p>${offlineClass.cts_name} | ${offlineClass.m_name}</p>
							<p class="info_title">${offlineClass.ofc_title}</p>
							<div>${offlineClass.ofc_content}</div>
						</div>
						<div>
							<div>
							 [ 장소 ] : ${offlineClass.sc_place }<br>
								[ 수업일 ]
								<fmt:formatDate pattern="yyyy-MM-dd HH"
									value="${offlineClass.sc_time}" />시 
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</article>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>