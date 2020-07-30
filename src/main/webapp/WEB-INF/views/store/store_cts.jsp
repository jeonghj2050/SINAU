<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/store_cts.css">
<link rel="stylesheet" href="resources/css/style.css">
<title>Insert title here</title>
</head>
<body>
	<header><jsp:include page="../header.jsp"></jsp:include>
	</header>
	<article style="background-color: #E1E1E1; border: 1px solid #e1e1e1;">
		<img class=storeIMG src="resources/images/storeimg/10.PNG">
	</article>
	<section>
		<div id=p_cts>
			<div class=p_cts_menu>
				<ul class=p_cts_ul>
				<li><a href="store">전체보기</a></li>
					<li><a href="store_cts">아트/공예</a></li>
					<li>전자제품</li>
					<li>건강/헬스/뷰티</li>
					<li>음악/악기</li>
					<li>푸드/키친</li>
				</ul>
			</div>
		</div>
		<article class="product">
			<h1>아트</h1>
			<c:forEach var="paitem" items="${pArtList}">
			<a href="store_info?p_code=${paitem.p_code }" >
				<div class="product_div">
					<div class=p_img>
						<img src="resources/images/storeimg/sum/${paitem.f_oriname}"
							width="250px" height="300px">
					</div>
					<div class="product_text">
						${paitem.cts_name}
						<div class="product_title">${paitem.p_title}</div>
						<div class="plike_view">
							<span class="plike_icon"><svg width="8px" height="8px"
									viewBox="0 0 16 16" class="bi bi-heart-fill"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
										d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span>${paitem.l_count}
						</div>
						<div class="price">${paitem.p_price }</div>
					</div>
				</div>
				</a>
			</c:forEach>
		</article>
	</section>
	<footer><jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>