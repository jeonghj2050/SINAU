<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>오프라인 메인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="../../../resources/css/offline/als_demo1.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../../resources/css/offline/offline_main.css" />
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
                <div id="main-image"></div>
            </div>
            <article class="content">
                <div class="nav">
                    <li id="off-all" href="/offline_main">전체보기</li>
                    <li id="off1" href="/online_cate_1">공예</li>
                    <li id="off2">미술</li>
                    <li id="off3">디지털드로잉</li>
                    <li id="off4">요리</li>
                    <li id="off5">운동</li>
                </div>
                <article class="childart">
                        <article class="child1">
                            <div class="blank"></div>
                            <h1>지금, 인기 TOP10</h1>
                            <div id="best">
                                <div>
                                    <div class="class_img"><img src="../../../resources/images/offline/1.jpg" alt=""></div>
                                <article class="on-info1">
                                    <li id="sub-cate">공예</li>
                                    <li> ㆍ </li>
                                    <li id="creator-name">김지안</li><br><br>
                                    <div id="online-name">시들지않는 생화, 특별한 플라워 리스 만들고 꽃과 함께 인생샷 남기기</div>
                                    <div id="class_likes"><svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                        <path fill-rule="evenodd" clip-rule="evenodd" 
                                            d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z" 
                                            fill="#bdc2c6"></path></svg></div>
                                    <div id="class_likes">2394</div>
                                    <div id="hr"> </div>
                                    <div id="online-price">40,000원</div>
                                </article>
                                </div>
                                <div>
                                    <div class="class_img"><img src="../../../resources/images/offline/2.jpg" alt=""></div>
                                    <article class="on-info1">
                                    <li id="sub-cate">공예</li>
                                    <li> ㆍ </li>
                                    <li id="creator-name">박희수</li><br><br>
                                    <div id="online-name">[느루라탄]라탄 단스탠드 하루 만들기
                                    </div>
                                    <div id="class_likes"><svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                        <path fill-rule="evenodd" clip-rule="evenodd" 
                                            d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z" 
                                            fill="#bdc2c6"></path></svg></div>
                                    <div id="class_likes">2394</div>
                                    <div id="hr"> </div>
                                    <div id="online-price">69,000원</div>
                                    </article>
                                </div>
                                <div>
                                    <div class="class_img"><img src="../../../resources/images/offline/3.jpeg" alt=""></div>
                                    <article class="on-info1">
                                    <li id="sub-cate">미술</li>
                                    <li> ㆍ </li>
                                    <li id="creator-name">권혁주</li><br><br>
                                    <div id="online-name">칠흑 속에서 빛나는 아름다움, 자개공예(손거울/컵받침/미니접시)
                                    </div>
                                    <div id="class_likes"><svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                        <path fill-rule="evenodd" clip-rule="evenodd" 
                                            d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z" 
                                            fill="#bdc2c6"></path></svg></div>
                                    <div id="class_likes">2394</div>
                                    <div id="hr"> </div>
                                    <div id="online-price">48,000원</div>
                                    </article>
                                </div>
                            </div>                        
                        </article>

                        <article class="child2">
                            <div class="blank"></div>
                            <h1>최근 업데이트 클래스</h1>
                            <h5>크리에이터가 최근 등록한 클래스예요.</h5>
                            <div id="new">
                                <div>
                                    <div class="class_img"><img src="../../../resources/images/offline/4.jpg" alt=""></div>
                                    <article class="on-info1">
                                        <li id="sub-cate">미술</li>
                                        <li> ㆍ </li>
                                        <li id="creator-name">도로시</li><br><br>
                                        <div id="online-name">원데이 안산) '레진공예'로 세상에 하나뿐인 나만의 작품 만들기 -도로시팩토리</div>
                                        <div id="class_likes"><svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd" clip-rule="evenodd" 
                                                d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z" 
                                                fill="#bdc2c6"></path></svg></div>
                                        <div id="class_likes">2394</div>
                                        <div id="hr"> </div>
                                        <div id="online-price">20,000원</div>
                                    </article>
                                </div>
                                <div>
                                    <div class="class_img"><img src="../../../resources/images/offline/5.jpg" alt=""></div>
                                    <article class="on-info1">
                                        <li id="sub-cate">공예</li>
                                        <li> ㆍ </li>
                                        <li id="creator-name">윤정은</li><br><br>
                                        <div id="online-name">♥레진공예 [취미반]♥핸드메이드/악세사리/금손 되기 프로젝트♪</div>
                                        <div id="class_likes"><svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd" clip-rule="evenodd" 
                                                d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z" 
                                                fill="#bdc2c6"></path></svg></div>
                                        <div id="class_likes">2394</div>
                                        <div id="hr"> </div>
                                        <div id="online-price">150,000원</div>
                                    </article>
                                </div>
                                <div>
                                    <div class="class_img"><img src="../../../resources/images/offline/6.jpg" alt=""></div>
                                    <article class="on-info1">
                                        <li id="sub-cate">공예</li>
                                        <li> ㆍ </li>
                                        <li id="creator-name">금소니</li><br><br>
                                        <div id="online-name">세상에 단하나뿐인 나만의 비즈반지 만들기
                                        </div>
                                        <div id="class_likes"><svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd" clip-rule="evenodd" 
                                                d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z" 
                                                fill="#bdc2c6"></path></svg></div>
                                        <div id="class_likes">2394</div>
                                        <div id="hr"> </div>
                                        <div id="online-price">14,000원</div>
                                    </article>
                                </div>
                                <div>
                                    <div class="class_img"><img src="../../../resources/images/offline/7.jpg" alt=""></div>
                                    <article class="on-info1">
                                        <li id="sub-cate">공예</li>
                                        <li> ㆍ </li>
                                        <li id="creator-name">허주연</li><br><br>
                                        <div id="online-name">[손끝으로 느끼는 자연의 결★] '한지 손거울' 만들기</div>
                                        <div id="class_likes"><svg width="15" height="15" fill="none" viewBox="0 0 24 18">
                                            <path fill-rule="evenodd" clip-rule="evenodd" 
                                                d="M1.5 8.824C1.5 5.607 3.962 3 7 3c2.5 0 4 1.5 5 3 1-1.5 2.5-3 5-3 3.038 0 5.5 2.607 5.5 5.824C22.5 14.827 16.684 18.52 12 21 7.316 18.52 1.5 14.827 1.5 8.824z" 
                                                fill="#bdc2c6"></path></svg></div>
                                        <div id="class_likes">2394</div>
                                        <div id="hr"> </div>
                                        <div id="online-price">38,000원</div>
                                    </article>
                                </div>
                                <div>
                                    <div class="class_img"><img src="SINAU_logo.png" alt=""></div>
                                    <article class="on-info1">
                                        <li id="sub-cate">카테고리명</li>
                                        <li> ㆍ </li>
                                        <li id="creator-name">강사명</li><br><br>
                                        <div id="online-name">강좌명</div>
                                        <div id="online-price">가격</div>
                                    </article>
                                </div>
                                <div>
                                    <div class="class_img"><img src="SINAU_logo.png" alt=""></div>
                                    <article class="on-info1">
                                        <li id="sub-cate">카테고리명</li>
                                        <li> ㆍ </li>
                                        <li id="creator-name">강사명</li><br><br>
                                        <div id="online-name">강좌명</div>
                                        <div id="online-price">가격</div>
                                    </article>
                                </div>
                                <div>
                                    <img src="SINAU_logo.png" alt="">
                                    <article class="on-info1">
                                        <li id="sub-cate">카테고리명</li>
                                        <li> ㆍ </li>
                                        <li id="creator-name">강사명</li><br><br>
                                        <div id="online-name">강좌명</div>
                                        <div id="online-price">가격</div>
                                    </article>
                                </div>
                                <div>
                                    <img src="SINAU_logo.png" alt="">
                                    <article class="on-info1">
                                        <li id="sub-cate">카테고리명</li>
                                        <li> ㆍ </li>
                                        <li id="creator-name">강사명</li><br><br>
                                        <div id="online-name">강좌명</div>
                                        <div id="online-price">가격</div>
                                    </article>
                                </div>
                            </div>
                        </article>
                </article>
            </article>
        </section>
    <footer>
    푸터
    <%-- <jsp:include page="footer.jsp"></jsp:include> --%>
    </footer>
</div>

</body>
</html>