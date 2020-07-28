<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 센터</title>
<link rel="stylesheet" href="resources/css/servicecenter.css?a">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script type="text/javascript">
$(document).ready(function(){
	var chk = "${check}";
	
	if(chk == "1"){
		alert("글 등록 실패!");
	}
	
	if("${mb.m_email}" != '') {
	var name = "${mb.m_name}";
	$('#mname').html(name + '님');
	$('.suc').css('display','block');
	$('.bef').css('display','none');
	}
});
</script>
</head>
<body>
	<header>
		<jsp:include page="servicecenter_header.jsp"></jsp:include>
	</header>
	<section>
	<h2 class="login-header">고객 센터</h2>
            <div class="cate_container">
                <a class="category" href="">Q & A</a>
                <a class="category" href="">신고</a>
            </div>
			<form name="writeFrm" action="boardWrite" class="write-form"
			 method="post" enctype="multipart/form-data">
			 <div class="write">
			 	<div class="write-top">
			 		<a>title</a>
				 	<input type="text" class="q_title">
				 	<a>email</a>
			 		<input type="text" class="q_m_email">
			 	</div>
			
			 </div>
		</form>
	</section>
</body>
</html>