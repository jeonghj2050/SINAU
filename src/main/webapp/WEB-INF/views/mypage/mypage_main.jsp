<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU 온라인 강의</title>

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

<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/mypage.css">
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
	
	var name="${mb.m_name}";
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

<script>
	var ord_code="";
	var ref_ord_code="";
	$(document).ready(function() {     
	    $('#refund').on('show.bs.modal', function(event) {          
	    	ref_ord_code = $(event.relatedTarget).data('notifyid');
	    	$('#ref_ord_code').val(ref_ord_code);
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
			<div class="page-title">온라인 강의</div>
			<div role="tabpanel">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist" id="mytab">
					<c:forEach var="cOnline" items="${cOnlineList}">
						<li role="presentation" name="${cOnline.onc_code}"><a
							href="#${cOnline.onc_code}" aria-controls="home" role="tab"
							data-toggle="tab">${cOnline.onc_code}</a></li>
					</c:forEach>
				</ul>
			</div>
			<c:forEach var="cOnline" items="${cOnlineList}">
				 <div class="c_myclass_info" id="${cOnline.onc_code} ">
                   <img src="person_thumbnail.jpg" alt="">
                   <div class="c_myclass_detail">
                       <div style="font-size: 13pt; font-weight: bold;"></div>
                       <div> 강의 내용</div>
                       <div> 수강 인원/총 인원</div>
                   </div>
                   <p class="mypage_sub_title">등록인원</p>
                   <div class="c_myclass_stuList">
                        <table class="table">
                            <tr>
                                <th>번호</th>
                                <th>이메일</th>
                                <th>이름</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>qjrm52@naver.com</td>
                                <td>정효진</td>
                            </tr>
                        </table>
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