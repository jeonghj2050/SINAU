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
                <span>온라인 강의</span>
           </div>
			<c:forEach var="onlineClass" items="${onlineList}">
				<div class="mp_classInfo" >
					<img src="resources/images/test/thumbnail1.PNG" alt="" width="300px"
						height="300px" id="mp_class_img">
					<div>
						<div class="class_info_contents">
							<p>${onlineClass.cts_name} | ${onlineClass.m_name}</p>
							<p class="info_title">${onlineClass.onc_title}</p>
							<div>
								${onlineClass.onc_content}
							</div>
						</div>
						<div>
							<div>${onlineClass.onc_sdate}/${onlineClass.onc_edate}</div>
							<div>
								<c:choose>
									<c:when test="${onlineClass.mcl_state == 1}">
										<button>환불</button>
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