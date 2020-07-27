<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>오프라인 메인</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="../../../resources/css/offline/offline_cate_1.css" />
<script type="text/javascript">
    </head>
    <body>
        <header>
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
                    <article class="child2">
                            <div class="blank"></div>
                            <h1>공예</h1>
                            <h5>전체클래스</h5>
                            <div id="filter"><img src="../../../resources/images/offline/sort.png">인기순</div>
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
                            </div>
                        </article>
                </article>
            </article>
        </section>
        <footer></footer>
    </body>
</html>