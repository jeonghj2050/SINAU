<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAU 쿠폰</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/mypage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(function() {
		$('li').click(function() {
			$('li').removeClass('item-selected');
			$(this).addClass('item-selected');
		})
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
			<div class="page-title">쿠폰 목록</div>
            <div>
                <span>할인 쿠폰 등록</span>
            </div><br>
           <div class="coupon_input_box">
                <input type="text" name="cp_code" id="cp_input">
                <button class="my_default_btn" onclick="addCoupon()">등록하기</button>
           </div>
           <div class="coupon_list">
           		<c:forEach var="cpinfo" items="${cpList }">
	           		<div class="coupon_box">
	                    <div>[${cpinfo.cp_title}]</div>
	                    <div>${cpinfo.cp_discount }% 할인</div>
	                    <div><fmt:formatDate pattern="yyyy-MM-dd" value="${cpinfo.cp_date}"/>일 까지</div>
	                    <div>${cpinfo.cp_content }</div>
	                </div>
           		</c:forEach>
            </div>
		</article>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
	function addCoupon(){
		var email='kc@naver.com';
		var code=$('#cp_input').val();
		console.log(code);
		if(code==""){
			alert("쿠폰 코드를 입력하세요!");
			$('cp_code').focus();
			return;
		}
		
		var objData={"email":email,"cp_code":code};
		$.ajax({
			url : "mypageCoupon",
			type:"post",
			data : objData,
			dataType:"json",
			success:function(data){
				if(data.cpList.length>0){
					alert("쿠폰 등록 완료!");
					var cList='';
					var dList=data.cpList;
					
					for(var i=0;i<dList.length;i++){
						cList+='<div class="coupon_box">'
		                    +'<div>['+dList[i].cp_title+']</div>'
		                    +'<div>'+dList[i].cp_discount+'% 할인</div>'
		                    +'<div>'+dList[i].cp_date+'일 까지</div>'
		                    +'<div>'+dList[i].cp_content+'</div>'
		                +'</div>'
					}
					$('.coupon_list').html(cList);
				}else{
					alert("사용 할 수 없는 쿠폰입니다!");
					$('cp_code').val('');
					$('cp_code').focus();
					
				}
			},
			error : function(error){
				console.log(error);
			}
		});
		$('#cp_input').val('');
	}
</script>
</html>