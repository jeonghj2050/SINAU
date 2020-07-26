<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/css/style.css?a">
<style type="text/css">
html {
	background-color: #f1f1f1 
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var msg = "${msg}";
	console.log(msg);
	if (msg != "") {
		alert(msg);
		location.reload(true);
	}
});

</script>
</head>
<body>
	<div class="content">
		<form name="joinFrm" id="join" class="join-form" action="memberInsert" method="post" onsubmit="return check()">
			<h1 class="join-header">SINAU</h1>
			<h3 class="join-header1">회원 가입</h3>
		<div class="reaiobutton">
			<input type="radio" name="radio" id="r1" value="0"><label for="r1">일반</label>
			<input type="radio" name="radio" id="r2" value="1"><label for="r2">크리에이터</label>
  			<input type="radio" name="radio" id="r3" value="2"><label for="r3">판매자</label>
		</div>
			<input type="text" class="login-input" id="memail" title="이메일"	name="m_email" placeholder="이메일"> 
			<input type="button" class="idcheck-btn" value="중복확인" onclick="idcheck()">
			<input type="text" name="m_name" class="login-input" title="이름" 	placeholder="이름"> 
			<input type="password"	id="password1" class="login-input" title="비밀번호" name="m_pwd" placeholder="비밀번호">
			<input type="password"	id="password2" class="login-input" title="비밀번호" placeholder="비밀번호확인"><br>
			<input type="text" id="phone" name="m_phone" class="login-input" title="연락처"	placeholder="연락처"> 
			<input type="text" id="birth" name="m_birth" class="login-input" title="생년월일" placeholder="생년월일 ">
			<input type="text" id="license" name="m_license" class="login-input" title="사업자번호"	placeholder="사업자번호">
			<input type="submit" class="login-btn" value="회원 가입">
			<input type="text" name="m_group" class="group" value="">
			<input type="hidden" name="m_state" class="state" value="1">
		</form>
	</div>
</body>
<script type="text/javascript">
function idcheck() {
		var id = $('#memail').val();
		if (id == "") {
			alert("이메일을 입력하세요.");
			$('#memail').focus();
			return;
		}
		var ckObj = {
			"memail" : id
		};
		console.log(ckObj);

		$.ajax({
			url : "idCheck",
			type : "get",
			data : ckObj,
			success : function(data) {
				if (data == "success") {
					alert('사용 가능한 이메일입니다.');
				} else {
					alert('중복된 이메일입니다.');
					$('#memail').val('');//입력 초기화
					$('#memail').focus();//ID 부분에 포커스 주기
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
	
	$(document).ready(function(){
		 
	    // 라디오버튼 클릭시 이벤트 발생
	    $("input:radio[name=radio]").click(function(){
	 
	        if($("input[name=radio]:checked").val() == "2"){
	            $("input:text[name=m_license]").attr("disabled",false);
	              $("input:text[name=m_group]").attr("value", "dm");
	            // radio 버튼의 value 값이 1이라면 활성화
	 
	        }else if($("input[name=radio]:checked").val() == "1"){
	              $("input:text[name=m_license]").attr("disabled",true);
	              $("input:text[name=m_group]").attr("value", "cm");
	            // radio 버튼의 value 값이 0이라면 비활성화
	        }else if($("input[name=radio]:checked").val() == "0"){
	              $("input:text[name=m_license]").attr("disabled",true);
	              $("input:text[name=m_group]").attr("value", "nm");
		            // radio 버튼의 value 값이 0이라면 비활성화
		        }
	    });
	});
	function validate() {
        var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
        var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        // 이메일이 적합한지 검사할 정규식

        var id = document.getElementById("uid");
        var pw = document.getElementById("upw");
        var email = document.getElementById("uemail");
        var num1 = document.getElementById("unum1");
        var num2 = document.getElementById("unum2");

        var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
        var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열

        // ------------ 이메일 까지 -----------

        if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
            return false;
        }

        if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
            return false;
        }

        if(join.upw.value != join.checkupw.value) {
            alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
            join.checkupw.value = "";
            join.checkupw.focus();
            return false;
        }

        if(email.value=="") {
            alert("이메일을 입력해 주세요");
            email.focus();
            return false;
        }

        if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
            return false;
        }

        if(join.uname.value=="") {
            alert("이름을 입력해 주세요");
            join.uname.focus();
            return false;
        }

        // -------------- 주민번호 -------------

        for (var i=0; i<num1.value.length; i++) {
            arrNum1[i] = num1.value.charAt(i);
        } // 주민번호 앞자리를 배열에 순서대로 담는다.

        for (var i=0; i<num2.value.length; i++) {
            arrNum2[i] = num2.value.charAt(i);
        } // 주민번호 뒷자리를 배열에 순서대로 담는다.

        var tempSum=0;

        for (var i=0; i<num1.value.length; i++) {
            tempSum += arrNum1[i] * (2+i);
        } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함

        for (var i=0; i<num2.value.length-1; i++) {
            if(i>=2) {
                tempSum += arrNum2[i] * i;
            }
            else {
                tempSum += arrNum2[i] * (8+i);
            }
        } // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함

        if((11-(tempSum%11))%10!=arrNum2[6]) {
            alert("올바른 주민번호가 아닙니다.");
            num1.value = "";
            num2.value = "";
            num1.focus();
            return false;
        }

        // ------------ 생일 자동 등록 -----------

        if(arrNum2[0]==1 || arrNum2[0]==2) {
            var y = parseInt(num1.value.substring(0,2));
            var m = parseInt(num1.value.substring(2,4));
            var d = parseInt(num1.value.substring(4,6));
            join.year.value = 1900 + y;
            join.month.value = m;
            join.day.value = d;
        }
        else if(arrNum2[0]==3 || arrNum2[0]==4) {
            var y = parseInt(num1.value.substring(0,2));
            var m = parseInt(num1.value.substring(2,4));
            var d = parseInt(num1.value.substring(4,6));
            join.year.value == 2000 + y;
            join.month.value = m;
            join.day.value = d;
        }

        // 관심분야, 자기소개 미입력시 하라는 메시지 출력
        if(join.inter[0].checked==false &&
            join.inter[1].checked==false &&
            join.inter[2].checked==false &&
            join.inter[3].checked==false &&
            join.inter[4].checked==false) {
            alert("관심분야를 골라주세요");
            return false;
        }

        if(join.self.value=="") {
            alert("조성규씨 자기소개를 먼저 적어주세요");
            join.self.focus();
            return false;
        }

    }

    function check(re, what, message) {
        if(re.test(what.value)) {
            return true;
        }
        alert(message);
        what.value = "";
        what.focus();
        //return false;
    }
	
</script>
</html>
