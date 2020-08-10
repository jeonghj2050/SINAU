<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/home.css?a">
	<link rel="stylesheet" href="resources/css/classroom.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 클래스룸</title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">
 
	    /*비디오 재생*/
		function classroomFunc(id){
		    console.log("id"+id);
		      var objdata = {vf_code: id, onc_code: "${selVideoLists.onc_code}"};
			
		      $.ajax({
			        url: "videoChange",
			        type: "POST",
			        cache: false,
			        dataType: "json",
			        data: objdata,
			        success: function(data) {
			        	$('.videoSection').hide();
						
						$('.wrap').append(
								'<div class="videoSection">'
								+'<div class="class_title">'
								+data.v_title
								+' - '
								+data.v_content
								+'</div>'
								+'<div class="video_div"><video id="video" class="vieo" src="resources/upload/'
								+data.vf_sysname
								+'" controls autoplay>동영상 재생 오류 - 관리자에게 문의하세요</video></div>'
								+'<div class="feedback-top">쌤에게 문의하기</div><div class="feedback-top-mid">내가 물어본 질문 0개</div><div class="feedback-mid">'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'<!-- 댓글 -->'
								+'</div></div>'
						
						)
			        },
			        error: function(request, status, error){
			          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        }
			      });
	    }
	    
	    
	</script>
</head>

<body>
    <header>
        <img src="logo.png" alt="" width="150px" height="40px" style="margin :20px;">
        <div></div>
    </header>
    <section>
        <div class="wrap">
            <div class="videoSection">
                <div class="class_title">${selVideoLists.v_title} - ${selVideoLists.v_content}</div>
                <div class="video_div"><video id="video" class="vieo" src="resources/upload/${selVideoLists.vf_sysname}" 
               		 controls autoplay>동영상 재생 오류 - 관리자에게 문의하세요</video></div>
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
                <c:forEach var="videoLists" items="${videoLists}">
                <div class="video_lable">
                
                    <a class="lable" id="${videoLists.vf_code}" href="javascript:void(0);" 
                   	   onclick="classroomFunc(id);">${videoLists.v_title} - ${videoLists.v_content}</a>

                </div>
                </c:forEach> 
            </div>
        </div>
    </section>
    <div class="footer_wrap" style="right: 0;">
        <footer class="footer"></footer>
    </div>
</body>

</html>