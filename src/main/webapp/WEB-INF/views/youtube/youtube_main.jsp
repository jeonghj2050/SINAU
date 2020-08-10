<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유튜브 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="resources/css/youtube.css?a">
<link rel="stylesheet" href="resources/css/home.css?a">
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>

	<section class="section-home">
		<div class="youtube-home">
			<div class="image">대표 이미지</div>
		</div>
		<article class="childart1">
				<h1>유튜브 top10</h1>
				<!-- Swiper -->
				<div class="swiper-container swc1" style="width: 1300px;">
					<div class="swiper-wrapper">
					<c:forEach var="y10" items="${yc10List}" begin="0" end="9">
						<div class="swiper-slide">
							<a href="ycontents?y_code=${y10.y_code}">
							<img src="resources/upload/${y10.f_sysname}" width="300px"
								height="300px"></a>
							<div class="swiper-text">
								<div class="y_name">${y10.cts_name}</div>
								<div class="y_title"><a href="ycontents?y_code=${y10.y_code}">${y10.y_title}</a></div>
							</div>
						</div>
						</c:forEach>
					</div>
					<!-- Add Arrows -->
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</article>
			<article class="childart5">
				<h1>전체 유투버</h1>
				<!-- Swiper -->
					<c:forEach var="y" items="${ycList}">
						<div class="swiper-slide5">
							<a href="ycontents?y_code=${y.y_code}">
							<img src="resources/upload/${y.f_sysname}" width="300px"
								height="300px"></a>
							<div class="swiper-text5">
								<div class="y_name">${y.cts_name}</div>
								<div class="y_title"><a href="contents?y_code=${y.y_code}">${y.y_title}</a></div>
							</div>
						</div>
					</c:forEach>
			</article>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script>
    $(document).ready(function(){
    var swiper1 = new Swiper('.swc1', {
          slidesPerView: 3,
          spaceBetween: 5,
          slidesPerGroup: 3,
          loop: false,
          loopFillGroupWithBlank: true,
          pagination: {
            el: '.swiper-pagination',
            clickable: true,
          },
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          }
        });

      var swiper = new Swiper('.swc2', {
          slidesPerView: 4,
          spaceBetween: 5,
          slidesPerGroup: 4,
          loop: false,
          loopFillGroupWithBlank: true,
          pagination: {
            el: '.swiper-pagination'
          }
        });
  });
</script>
   <script type="text/javascript">-
function gohome(){
	var id = '${mb.m_email}';
	
	if(id == ''){
		location.href='./';
	}	
	else if(id != ''){
		location.href='./';
	}
} 
</script>
<script type="text/javascript">
$(document).ready(function(){
	
	var id = '${mb.m_email}';
	
		if("${mb.m_email}" != '') {
			var name = "${mb.m_name}";
			$('#mname').html(name + '님');
			$('.suc').css('display','block');
			$('.bef').css('display','none');
			}
});

</script>
</html>