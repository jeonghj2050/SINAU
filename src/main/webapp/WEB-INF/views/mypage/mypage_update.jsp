<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 - 회원정보수정</title>

<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/mypage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
		<div style="width: 1070px; height: 80px;">
                <span>회원정보 수정</span>
            </div>
            <form action="/mypageUpdate" method="post">
                <div>
                    <div class="profile_image">
                        <img src="person_thumbnail.jpg" alt="" class="img-circle" width="200px" height="200px" id="profile_img"><br>
                        <div>
                            <label for="file"></label>
                            <input type="file" name="files" id="member_profile">
                            <input type="hidden" id="filecheck" value="0" name="fileCheck">
                        </div>
                    </div>
                    <div class="profile_update_box">
                        <div>
                            <span>이메일</span>
                            <input type="text" value="kc@naver.com" readonly>
                        </div>
                        <div>
                            <span>새 비밀번호</span>
                            <input type="password"  name="newPwd">
                        </div>
                        <div>
                            <span>새 비밀번호 확인</span>
                            <input type="password"  name="newPwd2" >
                        </div>
                        <div>
                            <span>핸드폰번호</span>
                            <input type="text" value="010-1234-5678" readonly>
                        </div>
                        <div>
                            <span>생년월일</span>
                            <input type="date" value="1998-07-08" readonly>
                        </div>
                    </div>
                    <div class="update-btn-box">
                        <input type="submit" value="수정하기" class="update-btn">
                    </div>
                </div>        
            </form>
	</section>
	<footer></footer>
</body>
</html>