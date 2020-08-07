<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 클래스룸</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Nanum Gothic', sans-serif;

        }

        ::selection {
            background-color: rgb(255, 89, 70);
            color: rgb(255, 255, 255);
        }

        header {
            background-color: rgb(238, 236, 236);
            margin: 0 auto;
            width: 1300px;
            height: 150px;

        }

        header>div {
            margin: 0 auto;
            width: 1300px;
            height: 70px;
            background-color: rgb(226, 226, 226);

        }

        section {
            width: 100%;
            margin: 0 auto;
            /*    background-color: rgb(157, 212, 230);*/
            height: auto;
            position: relative;
        }

        footer {
            background-color: black;
            margin: 0 auto;
            width: 1300px;
            height: 100px;
            display: inline-flex;
        }

        .footer_wrap {
            text-align: center;
        }

        .wrap {
            width: 1300px;
            position: relative;
            height: 100%;
            margin: 0 auto;
        }

        .videoSection {
            width: 885px;
            height: 100%;
            float: left;
        }

        .playListSection {
            width: 405px;
            height: auto;
            margin-top: 10px;
            padding-bottom: 5px;
            box-shadow: rgba(41, 42, 43, 0.16) 0px 2px 6px -2px;
            border-radius: 3px;
            border-width: 1px;
            border-style: solid;
            border-color: rgb(255, 255, 255);
            border-image: initial;

            position: sticky;
            top: 0;
            left: 0;
            float: right;
        }

        .video_div {
            width: 100%;
            height: 500px;
            margin: 0 auto;
            float: left;

        }

        .vieo {
            max-width: 100%;
            height: auto;
            margin: 0 auto;
            cursor: pointer;

        }

        .class_title {
            width: 95%;
            height: 5%;
            margin: 0 auto;
            padding: 20px;
        }

        .class_title {
            padding-top: 30px;
            font-size: 35px;
            font-weight: bold;
            line-height: 28px;
            color: rgb(27, 28, 29);
            word-break: keep-all;
        }

        .playlist {
            width: 95%;
            height: 5%;
            margin: 0 auto;
            padding: 30px 5px 0 20px;

            font-size: 25px;
            font-weight: bold;
            line-height: 67px;
            color: rgb(27, 28, 29);
            word-break: keep-all;

            border-bottom: 1px solid rgb(237, 239, 240);
            flex: 1 1 0%;
            padding: 0px 20px;
            color: rgb(71, 70, 70);
            margin: 0 auto;
            width: 90%;
        }

        .video_lable {
            float: left;
            width: 200px;
            margin: 0 auto;
            padding: 10px 0;
            text-align: center;
        }

        .feedback-top,
        .feedback-top-mid {
            display: inline-block;
            margin: 0 auto;
            padding: 10px 0;
            padding: 15px;

            font-size: 21px;
            font-weight: bold;
            line-height: 28px;
            color: rgb(27, 28, 29);
            word-break: keep-all;
        }

        .feedback-top-mid {
            margin-top: 10px;
            font-size: 14px;
            color: rgb(148, 154, 158);
        }

        .lable {
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: justify;
            justify-content: space-between;
            height: 50px;
            width: 100px;
            cursor: pointer;
            border-bottom: 1px solid rgb(237, 239, 240);
            flex: 1 1 0%;
            padding: 0px 20px;
            color: rgb(71, 70, 70);
            margin: 0 auto;
            width: 170%;

        }

        .lable:link {
            text-decoration: none;

        }

        .lable:hover {
            background-color: rgb(248, 248, 249);
        }

        .feedback-mid {
            height: 555px;
            width: 100%;
            display: inline-block;
            position: relative;
            float: left;

            border-top: 1px solid rgb(237, 239, 240);
            flex: 1 1 0%;
            padding: 0px 20px;
            color: rgb(71, 70, 70);
            margin: 0 auto;
            width: 95.5%;
        }

        .gcQrwe:not(:first-of-type) {
            border-top: 1px solid rgb(221, 224, 226);
        }



        /* 댓글 */
        .gcQrwe {
            position: relative;
            top: 0px;
            left: 0px;
        }

        *,
        ::before,
        ::after {
            box-sizing: border-box;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        .gKiSyZ {
            display: flex;
            -webkit-box-pack: justify;
            justify-content: space-between;
        }

        .eHTDzy {
            margin-bottom: 8px;
            display: flex;
        }

        .dpoTMj {
            position: relative;
            width: 40px;
            height: 40px;
        }

        .doveiU {
            width: 100%;
            height: 100%;
            line-height: 0;
            transform: rotate(0deg);
            border-width: 1px;
            border-style: solid;
            border-color: rgb(237, 239, 240);
            border-image: initial;
            border-radius: 100%;
        }

        .hmiuqf {
            top: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            position: relative;
        }

        .hmiuqf img {
            object-fit: cover;
            opacity: 1;
            transition: opacity 0.1s linear 0s;
        }

        .elwNsP img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        img {
            vertical-align: middle;
            border-style: none;
        }

        .kDEWSt {
            display: flex;
            flex-direction: column;
            -webkit-box-pack: center;
            justify-content: center;
            padding-left: 10px;
        }

        .bTyfIx {
            font-size: 11px;
            line-height: 16px;
            letter-spacing: normal;
            font-weight: 600;
            color: rgb(27, 28, 29);
            margin: 0px;
        }

        .dCjZJC {
            font-size: 9px;
            font-weight: normal;
            line-height: 12px;
            letter-spacing: normal;
            color: rgb(168, 174, 179);
            margin: 0px;
        }

        .fBCzAq {
            clear: right;
        }

        .jwJLjU {
            margin-top: 16px;
            margin-bottom: 8px;
        }

        .dGLSNL {
            word-break: break-word;
            white-space: pre-wrap;
        }

        .iaGxeB {
            font-size: 14px;
            font-weight: normal;
            color: rgb(27, 28, 29);
            line-height: 20px;
            letter-spacing: -0.15px;
            margin: 0px;
        }

        .bIartC {
            clear: both;
            margin: 0px;
        }

        .giwqfA {
            width: 100%;
        }

        .kXoUyJ {
            margin-left: -24px;
            margin-right: -24px;
            position: relative;
        }

        .jINznE {
            padding: 0px 24px;
        }

        .hueHeB {
            margin-top: 16px;
        }

        element.style {
            margin-bottom: 8px;
        }

        .lTtZj {
            margin-bottom: 8px;
        }

        .clearfix {
            zoom: 1;
        }

        .fOHeVw {
            float: left;
        }

        .dpVfTD {
            position: relative;
            width: 24px;
            height: 24px;
        }

        .doveiU {
            width: 100%;
            height: 100%;
            line-height: 0;
            transform: rotate(0deg);
            border-width: 1px;
            border-style: solid;
            border-color: rgb(237, 239, 240);
            border-image: initial;
            border-radius: 100%;
        }

        .ctfFvt {
            display: block;
            position: relative;
            font-size: 0px;
            overflow: hidden;
        }

        .hmiuqf {
            top: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            position: relative;
        }

        .ipoLfu {
            position: absolute;
            right: 0px;
            bottom: 0px;
            background-color: rgb(253, 126, 20);
            line-height: 0;
            border-radius: 12px;
            padding: 3px;
        }

        svg:not(:root) {
            overflow: hidden;
        }

        :not(svg) {
            transform-origin: 0px 0px;
        }

        element.style {
            line-height: 1;
            padding-top: 0px;
            padding-left: 32px;
            margin-bottom: 0px;
        }

        .hPdTYv {
            padding-top: 4px;
            padding-left: 48px;
            margin-bottom: 8px;
        }

        .dYnUBM {
            display: inline-block;
            font-size: 11px;
            font-weight: bold;
            line-height: 16px;
            color: rgb(62, 64, 66);
            margin: 0px 4px 0px 0px;
        }

        h3 {
            color: rgb(24, 32, 38);
            font-weight: 600;
            line-height: 25px;
            font-size: 22px;
            margin: 0px 0px 10px;
            padding: 0px;
        }

        h4 {
            color: rgb(24, 32, 38);
            font-weight: 600;
            line-height: 21px;
            font-size: 18px;
            margin: 0px 0px 10px;
            padding: 0px;
        }

        .bZRFQX {
            font-size: 14px;
            font-weight: normal;
            line-height: 20px;
            letter-spacing: -0.15px;
            color: rgb(62, 64, 66);
            word-break: break-word;
            white-space: pre-wrap;
            margin: 0px;
        }

        .ixvYEK {
            display: flex;
            align-items: flex-end;
        }

        .dwNApe {
            position: relative;
        }

        .cFShdY {
            position: relative;
            display: flex;
            background-color: rgb(248, 248, 249);
            border-radius: 20px;
            border-width: 1px;
            border-style: solid;
            border-color: rgb(205, 209, 212);
            border-image: initial;
        }

        .fMTJRn {
            display: inline-flex;
            -webkit-box-align: center;
            align-items: center;
            flex: 0 0 auto;
            padding: 8px 16px;
        }

        .jWuGGx {
            height: 24px;
        }

        .cfOBOY {
            display: inline-block;
            cursor: pointer;
        }

        .cfOBOY input[type="file"] {
            display: none;
        }

        .eUMLwq {
            display: flex;
            flex-direction: column;
            flex: 1 1 auto;
        }

        .cArsAk.disabled {
            color: rgb(221, 224, 226);
            background-color: rgb(248, 248, 249);
        }

        .fsyYOM.disabled {
            cursor: not-allowed;
        }

        .ZzKfN {
            width: 24px;
            height: 24px;
            position: absolute;
            right: 8px;
            top: 20px;
            transform: translateY(-50%);
            line-height: 1;
            box-shadow: none;
            padding: 0px;
            background: none;
            border-width: 0px;
            border-style: initial;
            border-color: initial;
            border-image: initial;
        }

        .cArsAk {
            width: auto;
            display: inline-flex;
            vertical-align: middle;
            color: rgb(27, 28, 29);
            background-color: rgb(248, 248, 249);
            font-weight: 500;
            font-size: 14px;
            letter-spacing: -0.2px;
            height: 40px;
            text-decoration-line: none;
            border-radius: 3px;
            padding: 0px 16px;
            transition: background-color 0.1s ease 0s;
        }

        .fsyYOM {
            box-sizing: border-box;
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            align-items: center;
            flex-direction: row;
            border-width: 0px;
            border-style: initial;
            border-color: initial;
            border-image: initial;
            outline: none;
            margin: 0px;
            padding: 0px;
            flex: initial;
        }

        .jZUSDr {
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            align-items: center;
            flex: 0 0 auto;
        }

        .cezzll {
            font-size: 14px;
            font-weight: normal;
            color: rgb(27, 28, 29);
            line-height: 20px;
            letter-spacing: -0.15px;
            width: 100%;
            height: 40px;
            background-color: transparent;
            resize: none;
            margin: 0px;
            overflow: hidden;
            padding: 10px;
            outline: none;
            border-width: initial;
            border-style: none;
            border-color: initial;
            border-image: initial;
            transition: height 0.3s ease 0.2s;
        }

        svg:not(:root) {
            overflow: hidden;
        }

        .iQyJmT {
            display: block;
            color: rgb(62, 64, 66);
        }

        /* 상품리뷰 */
        .sinfo_rvall {
            width: 100%;
            height: 500px;
            float: left;
        }

        .sinfo_rvbox {
            width: 100%;
            height: 250px;
            /* background-color: burlywood; */
            float: left;
        }

        .rvbox_box_name {
            height: 20px;
            padding-top: 10px;
            padding-left: 20px;
            background-color: #fff;
            float: left;
        }

        .rvbox_write_mail {
            height: 20px;
            line-height: 14px;
            font-size: 15px;
            font-weight: 700;
        }

        .sinfo_write_area {
            padding: 20px 0 8px;
            margin: 20px 0px;
            width: 100%;
            height: 100px;
        }

        div .rvbox_textarea {
            width: 90%;
            height: 84px;
            border: 1px soild lightsteelblue;
            margin-top: 10px;
            margin-left: 50px;
            float: left;
            resize: none;
            display: block;
            overflow-x: hidden;
            overflow-y: auto;
            z-index: 1;
            color: #333;
            box-sizing: border-box;
            line-height: 18px;
            font-size: 14px;
        }

        .rvbox_upload {
            height: 46px;
            padding-top: 10px;
            padding-right: 20px;
            float: right;
        }

        .rvbox_addition {
            height: 46px;
        }

        .rvbox_link {
            color: white;
            text-decoration: none;
            width: 51px;
            height: 50px;
        }

        .rvbox_link:hover {
            color: black;
            text-decoration: none;
        }

        .rvbox_btn {
            background: #a0a5a4;
            color: #fff;
            border: none;
            position: relative;
            width: 51px;
            height: 40px;
            line-height: 40px;
            font-size: 15px;
            font-weight: 400;
            cursor: pointer;
            transition: 800ms ease all;
            outline: none;
            border-radius: 5px;
        }

        button:hover {
            background: #fff;
            color: black;
        }

        .rvbox_btn:before,
        .rvbox_btn:after {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            height: 2px;
            width: 0;
            background: #a0a5a4;
            transition: 400ms ease all;
        }

        .rvbox_btn:after {
            right: inherit;
            top: inherit;
            left: 0;
            bottom: 0;
        }

        .rvbox_btn:hover:before,
        .rvbox_btn:hover:after {
            width: 100%;
            transition: 800ms ease all;
        }


        .sinfo_rv_wrap {
            width: 100%;
            height: 300px;
            /* background-color: burlywood; */
            float: left;
            border-collapse: separate;
            border-spacing: 2px;
            text-align: left;
            font-size: 12px;
            line-height: 1.25em;
            display: block;
            height: 200px;
            border-top: 1px solid #a0a5a4;
            border-bottom: 1px solid #a0a5a4;
        }

        .sinfo_rv_info {
            border-collapse: separate;
            border-spacing: 2px;
            text-align: left;
            font-size: 12px;
            line-height: 1.25em;
            display: block;
            height: 200px;
        }

        ul.sinfo_rv_list {
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
        }

        ul.sinfo_rv_list li {
            text-align: -webkit-match-parent;
        }

        .sinfo_rv_comment_box {
            border-bottom: 1px solid #f0f0f0;
            position: relative;
            display: block;
            float: left;
            width: 100%;
            height: 150px;
        }

        .sinfo_rv_area {
            padding: 11px 0 13px;
            display: block;
            height: 150px;
        }

        .sinfo_rv_info {
            margin-bottom: 16px;
            padding-bottom: 1px;
            display: block;
            height: 25px;
        }

        .sinfo_rv_main {
            display: inline-block;
            position: relative;
            padding-right: 18px;
            vertical-align: top;
            width: 70px;
            height: 30px;
            font-size: 13px;
            line-height: 25px;
            font-weight: 700;
            color: #000;
        }

        .sinfo_rvc_work_sub {
            top: 16px;
            position: absolute;
            float: right;
            right: 50px;
        }

        .sinfo_rvwork_box {
            display: block;
            overflow: hidden;
            width: 30px;
            height: 30px;
            font-size: 14px;
            line-height: 30px;
        }

        .sinfo_rvwork_inner a {
            background-color: transparent;
            text-decoration: none;
            color: #000;
        }

        .sinfo_rvcontent_text_wrap {
            font-size: 13px;
            color: #222;
            overflow: hidden;
            line-height: 18px;
            word-break: 18px;
            display: block;
            margin-top: 15px;
            padding-top: 15px;
        }

        .sinfo_rv_contents {
            margin-right: 5px;
            letter-spacing: -.3px;

        }

        .sinfo_rv_base {
            position: absolute;
            top: 34px;
            padding-top: 0;
            line-height: 12px;
            display: block;
        }

        .rv_list {
            color: transparent;
        }
    </style>
</head>

<body>
    <header>
        <img src="logo.png" alt="" width="150px" height="40px" style="margin :20px;">
        <div></div>
    </header>
    <section>
        <div class="wrap">
            <div class="videoSection">
                <div class="class_title">제 1강 - 마법같은 일상</div>
                <div class="video_div"><video class="vieo" src="video/video1.mp4" controls autoplay>동영상 재생 오류 - 관리자에게
                        문의하세요</video></div>
                <div class="feedback-top">쌤에게 문의하기</div>
                <div class="feedback-top-mid">내가 물어본 질문 0개</div>
                <div class="feedback-mid">

                    <!-- 댓글 -->
                    <div class=sinfo_rvall>
                        <div class="sinfo_rvbox">
                            <form style="width: 100%; height: 200px;">
                                <fieldset style="width: 100%; height: 7px;">
                                    <legend "u_vc">
                                        <div class="sp_title" style="margin-top:30px;">상품 리뷰</div>
                                        <div class="rvbox_box_name">
                                            <span class=rvbox_write_mail>작성자: email</span>
                                        </div>
                                        <div class="sinfo_write_area">
                                            <div><textarea id="rvbox_write_textarea" class="rvbox_textarea" rows="5"
                                                    cols="130" data-log="RPC.input"></textarea></div>
                                        </div>
                                        <div class="rvbox_upload">
                                            <div class="rvbox_addition">
                                                <a href="#" class=rvbox_link><button type="button" class="rvbox_btn">
                                                        등록
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </legend>
                                </fieldset>
                            </form>
                        </div>
                        <div class="sinfo_rv_wrap">
                            <ul class="sinfo_rv_list">
                                <li class="rv_list"></li>
                                <div class="sinfo_rv_comment_box">
                                    <div class="sinfo_rv_area">
                                        <div class="sinfo_rv_info">
                                            <span class="sinfo_rv_main">e-mail</span>
                                            <span class="sinfo_rv_sub">
                                                <span class=sinfo_rvc_work_sub>
                                                    <span class="sinfo_rvwork_box">
                                                        <span class="sinfo_rvwork_inner">

                                                        </span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>
                                        <div class="sinfo_rvcontent_text_wrap">
                                            <span class="sinfo_rv_contents" style data-lang="ko">너무 재밋었습니다</span>
                                        </div>
                                        <div class="sinfo_rv_base">
                                            <span class="sinfo_date"> 2020.07.23.18:17:10</span>
                                        </div>
                                    </div>
                                </div>
                                </li>
                            </ul>
                        </div>
                    </div>





                </div>
            </div>
            <div class="playListSection">
                <div class="playlist">클래스 재생 목록</div>
                <div class="video_lable">
                    <a class="lable" href="#">동영상 강의 1 - 소재목에 대한 내용</a>
                    <a class="lable" href="#">동영상 강의 1</a>
                    <a class="lable" href="#">동영상 강의 1</a>
                    <a class="lable" href="#">동영상 강의 1</a>
                    <a class="lable" href="#">동영상 강의 1</a>
                    <a class="lable" href="#">동영상 강의 1</a>
                </div>
            </div>
        </div>
    </section>
    <div class="footer_wrap" style="right: 0;">
        <footer class="footer"></footer>
    </div>
</body>

</html>