<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>

<a href="./offline" class="btn btn-success">오프라인메인</a>
</body>
<script type="text/javascript">
$(document).ready(function(){
	var chk = "${msg}";
	
	if(chk != ""){
		alert(chk);
		location.reload(true);
	}
	
    $('.slider').bxSlider({
    	auto: true,
    	slideWidth: 1300,
    });
    
    var mql = window.matchMedia("screen and (max-width: 1300px)"); 
    mql.addListener(function(e) { 
    	if(!e.matches) { 
    		slider.reloadSlider();
    	}
    });
});  



</script>
</html>
