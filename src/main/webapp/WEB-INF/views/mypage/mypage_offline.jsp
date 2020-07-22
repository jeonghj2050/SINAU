<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 - 일반회원</title>

<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/mypage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
});
</script>
</head>
<body>
	<header>
		<img src="resources/images/SINAU_logo.png" alt="" width="150px"
			height="50px" style="margin: 20px;">
		<div></div>
	</header>
	<section class="mp_section">
		<jsp:include page="mypage_nav.jsp"></jsp:include>
		<article>
			<div>
                <span>오프라인 강의</span>
           </div>
           <div role="tabpanel">

			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist" id="mytab">
			   	<c:forEach var="offlineClass" items="${offlineList}">	
				    <li role="presentation" name="${offlineClass.ofc_code}"><a href="#'${offlineClass.ofc_code}'" aria-controls="home" role="tab" data-toggle="tab">${offlineClass.ofc_code}</a></li>
			  	</c:forEach>
			  </ul> 
           </div>
			<c:forEach var="offlineClass" items="${offlineList}">
				<div class="mp_classInfo" id="${offlineClass.ofc_code}">
					<img src="resources/images/test/thumbnail1.PNG" alt="" width="300px"
						height="300px" id="mp_class_img">
					<div>
						<div class="class_info_contents" id="${offlineClass.ofc_code}">
							<p>${offlineClass.cts_name} | ${offlineClass.m_name}</p>
							<p class="info_title">${offlineClass.ofc_title}</p>
							<div>
								${offlineClass.ofc_content}
							</div>
						</div>
						<div>
							<div>수업일 : ${offlineClass.ofc_ofdate}</div>
							<div>
								<c:choose>
									<c:when test="${offlineClass.mcl_state == 1}">
										<button>환불</button>
									</c:when>
								</c:choose>
								<c:if test="${offlineClass.mcl_state == 2}">
									<span>환불진행중</span>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</article>
	</section>
	<footer></footer>
</body>
</html>