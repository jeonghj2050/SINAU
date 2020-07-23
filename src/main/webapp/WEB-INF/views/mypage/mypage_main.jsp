<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU 온라인 강의</title>

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
			<div class="page-title">온라인 강의 </div>
           <div role="tabpanel">
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist" id="mytab">
			   	<c:forEach var="onlineClass" items="${onlineList}">	
				    <li role="presentation" name="${onlineClass.onc_code}"><a href="#'${onlineClass.onc_code}'" aria-controls="home" role="tab" data-toggle="tab">${onlineClass.onc_code}</a></li>
			  	</c:forEach>
			  </ul> 
           </div>
			<c:forEach var="onlineClass" items="${onlineList}">
				<div class="mp_classInfo" id="${onlineClass.onc_code}">
					<img src="resources/images/test/${onlineClass.f_oriname }" alt="" width="300px"
						height="300px" id="mp_class_img">
					<div>
						<div class="class_info_contents" id="${onlineClass.onc_code}">
							<p>${onlineClass.cts_name} | ${onlineClass.m_name}</p>
							<p class="info_title">${onlineClass.onc_title}</p>
							<div>
								${onlineClass.onc_content}
							</div>
						</div>
						<div>
							<div>
								수업일 : 
								<fmt:formatDate pattern="yyyy-MM-dd" value="${onlineClass.onc_sdate}"/> / <fmt:formatDate pattern="yyyy-MM-dd" value="${onlineClass.onc_edate}"/>
							</div>
							<div>
								<c:choose>
									<c:when test="${onlineClass.mcl_state == 1}">
										<button class="my_default_btn">환불</button>
									</c:when>
								</c:choose>
								<c:if test="${onlineClass.mcl_state == 2}">
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