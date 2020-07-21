<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>오프라인 메인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/offline/offline.css">
<script type="text/javascript">

</script>
</head>
<body>
<div class="wrap">
    <header>
        헤더
        <%-- <jsp:include page="header.jsp"></jsp:include> --%>
    </header>
        <section>
            <div class="main-image">
                <img src="resources\images\main-image.png">
            </div>
            <article class="content">
            <div class="nav">
                <button id="on-all">전체보기</button>
                <button id="on1">공예</button>
                <button id="on2">미술</button>
                <button id="on3">온라인드로잉</button>
                <button id="on4">요리</button>
                <button id="on5">운동</button>
            </div>
            <div><img src=".png" width=10px hwight="10px">
            <div>필터</div>
            <article class="childart">
                <article class="child1">
                 <h1>인기 클래스</h1>
                        <div>
                             <img src="SINAU_logo.png" alt="">
                                <li id="sub-cate">카테고리명</li>
                                <li> ㆍ </li>
                                <li id="creator-name">강사명</li>
                                <div id="online-name">강좌명</div>
                                <div id="online-price">가격</div>
                        </div>
                        <div>d2</div>
                        <div>d3</div>
                        <div>d4</div>
                        <div>d5</div>
                        <div>d6</div>
               </article>

               <article class="child2">
                        <h1>최근 업데이트된 클래스</h2>
                        <div>
                            <img src="SINAU_logo.png" alt="">
                            <article class="on-info1">
                                <li id="sub-cate">카테고리명</li>
                                <li> ㆍ </li>
                                <li id="creator-name">강사명</li>
                                <div id="online-name">강좌명</div>
                                <div id="online-price">가격</div>
                            </article>
                        </div>
                        <div>d2</div>
                        <div>d3</div>
                        <div>d4</div>
                        <div>d5</div>
                        <div>d6</div>
                    </article>
            </article>
            </article>
    <footer>
    푸터
    <%-- <jsp:include page="footer.jsp"></jsp:include> --%>
    </footer>
</div>

</body>
</html>