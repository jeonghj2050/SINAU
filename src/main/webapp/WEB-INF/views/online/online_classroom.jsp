<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/home.css?a">
<link rel="stylesheet" href="resources/css/classroom.css?c">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 클래스룸</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
 
	    /*비디오 재생
		function classroomFunc(id){
		    console.log("id"+id);
		      var objdata = {vf_code: id, onc_code: "${selVideoLists.onc_code}"};
		      jQuery.noConflict();
		      jQuery('.fb_vf_code').val(id);
		      console.log(jQuery('.fb_vf_code').val());
		      
		      
		      jQuery.ajax({
			        url: "videoChange",
			        type: "POST",
			        cache: false,
			        dataType: "json",
			        data: objdata,
			        success: function(data) {*/
			        	/*    	jQuery('.ajaxsec').html('');
						
			        	jQuery('.videoSection').append(
								'<div class="ajaxsec">'
								+'<div class="class_title">'
								+data.v_title
								+' - '
								+data.v_content
								+'</div>'
								+'<div class="video_div"><video id="video" class="vieo" src="resources/upload/'
								+data.vf_sysname
								+'" controls autoplay>동영상 재생 오류 - 관리자에게 문의하세요</video></div>'
								+'<div class="feedback-top">쌤에게 문의하기</div><div class="feedback-top-mid">내가 물어본 질문 0개</div><div class="feedback-mid">'
								+'</div>'
						);
					*/	
					/*					jQuery('.class_title').html(data.v_title +' - '
													+data.v_content
						);
						jQuery('#video').attr('src','resources/upload/' + data.vf_sysname);
						
			        },
			        error: function(request, status, error){
			          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        }
			      });
		      
		      
	    }	   */	 
	</script>
</head>

<body>
	<header>
		<img src="logo.png" alt="" width="150px" height="40px"
			style="margin: 20px;">
		<div></div>
	</header>
	<section>
		<div class="wrap">
			<div class="videoSection">
				<div class="ajaxsec">
					<div class="class_title">${selVideoLists.v_title}-
						${selVideoLists.v_content}</div>
					<div class="video_div">
						<video id="video" class="vieo"
							src="resources/upload/${selVideoLists.vf_sysname}" controls
							autoplay>동영상 재생 오류 - 관리자에게 문의하세요
						</video>
					</div>
				</div>
				<div class="classProfile">
					<img class="creatorImg"
						src="resources/upload/${ClsrCreator.mimg_sysname}"
						style="width: 50px; height: 50px">
				</div>
				<div class="classProfile">${ClsrCreator.onc_title}</div>
				<div class="classProfile">${ClsrCreator.onc_content}</div>
				<div class="classProfile">남은 강의 일수 ${ClsrCreator.remaindate}일</div>
				<div class="feedback-top">쌤에게 문의하기</div>
				<!-- <div class="feedback-top-mid">내가 물어본 질문 0개</div>-->
				<div class="feedback-mid"></div>


				<!-- 댓글 -->
				<div class="ajaxFeed">
					<hr width="950px" style="float: left;">
					<div class="sp_title1">질문 & 선생님의 피드백</div>
					<div class=sinfo_rvall>
						<div id="reply">
							<div class="replyForm">
								<div class="userInfo">
									<span class="userName">${mb.m_email}</span>
								</div>
								<form role="form" method="post" autocomplete="off" name="fFrm"
									id="fFrm" class="write-form">
									<input type="hidden" class="fb_vf_code" name="fb_vf_code"
										value='${selVideoLists.vf_code}'>
									<!--	 로그인처리하고 바꾸기 -->
									<div class="input_text">
										<textarea name="fb_content" id="repCon"></textarea>
									</div>
									
									<div class="input_area">
										<!-- <button type="button" id="reply_btn" onclick="reviewInsert()">등록</button> -->
										<button type="button" id="reply_btn">등록</button>
									</div>
								</form>


							</div>


							<div class="replyList">
								<ol id="rlist-ol">
									<form role="form" method="post" autocomplete="off" name="cfFrm"
										id="cfFrm" class="write-form cwrite-form">
										<c:forEach var="f" items="${fList}">
											<input type="hidden" class="cfb_vf_code" name="cfb_vf_code"
												value='${f.fb_code}'>
											<li>
												<div class="userInfo" id="${f.fb_code}">
													<span class="userName">${f.fb_m_email}</span> <span
														class="date"> <fmt:formatDate value="${f.fb_date}"
															pattern="yyyy-MM-dd" />
													</span>
													<!-- 댓글삭제-->
													<c:if test="${f.fb_m_email == mb.m_email}">
														<!-- <button type="button" class="delelte_dtn" onclick="reviewDelete('${r.prv_code}',this)"> -->
														<button type="button" class="delelte_dtn"
															fb-code="${f.fb_code}">
															<span class="delite_ico"> <svg width="1em"
																	height="1em" viewBox="0 0 16 16" class="bi bi-x-circle"
																	fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  										<path fill-rule="evenodd"
																		d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
 										<path fill-rule="evenodd"
																		d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z" />
 										<path fill-rule="evenodd"
																		d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z" />
											</svg>
															</span>
														</button>
													</c:if>
													<c:if test="${f.fb_m_email != mb.m_email}">
														<button type="button" class="delelte_dtn otherreply"
															onclick="reviewDelete('${f.fb_code}',this)">
															<span class="delite_ico"> <svg width="1em"
																	height="1em" viewBox="0 0 16 16" class="bi bi-x-circle"
																	fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  										<path fill-rule="evenodd"
																		d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
 										<path fill-rule="evenodd"
																		d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z" />
 										<path fill-rule="evenodd"
																		d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z" />
											</svg>
															</span>
														</button>

													</c:if>

												</div>
												<div class="replyContent" id="r_content">${f.fb_content }</div>
												<c:if test="${f.fb_reply ne null }">
												<div class="creplyContent${f.fb_code} replyContent" id="fb_reply">${f.fb_reply}</div>
												</c:if>
												
												<!-- 크리에이터용 답글 입력 부분  -->
												<div class="div_${f.fb_code}">
													<input type="hidden" class="fb_vf_code fb_code${f.fb_code}"
														name="fb_code" value='${f.fb_code}'>
													<c:if test="${empty orderCheck}">
													<div class="input_text">
														<textarea name="fb_reply" class="crepCon${f.fb_code}"></textarea>
													</div>
													<div class="input_area">
														<button type="button" onclick="creplybtn('${f.fb_code}')"
															id="creply_btn">등록</button>
													</div>
													</c:if>
												</div>

											</li>
										</c:forEach>
									</form>
								</ol>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="playListSection">
				<div class="playlist">클래스 재생 목록</div>
				<c:forEach var="videoLists" items="${videoLists}">
					<div class="video_lable">
						<a class="lable" id="${videoLists.vf_code}"
							href="classroom?onc_code=${videoLists.onc_code}&vf_code=${videoLists.vf_code}">
							${videoLists.v_title} - ${videoLists.v_content} </a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<div class="footer_wrap" style="right: 0;">
		<footer class="footer"></footer>
	</div>
</body>
<script src="resources/javascript/jquery.serializeObject.js"></script>
<script type="text/javascript">
//크리에이터 답글 등록
function creplybtn(fb_code) { 
console.log("ffffbbbb" + fb_code);
var reply = jQuery('.crepCon' + fb_code).val();
console.log("fhtfthfhf    "+reply);

var data = {
		"fb_code": fb_code,
		"fb_reply" : reply
		
};

jQuery.ajax({
			url : "cfeedbackInsert",//요청 url(uri)
			type : "post",//전송 방식(get, post)
			data : data,//전송할 데이터
			dataType : "json",//데이터의 형식
			success : function(data) {
				//목록 전체를 하나의 문자열로 만들어서
				//한꺼번에 id가 rTable인 태그(요소)의
				//innerHTML에 출력.
				//var flist = '<ol>';
				var dlist = data.feedback;
				//var f_code = '';
				//var r_code=${r.prv_code};

				//flist += "<li data-fb_vf_code='" + dlist.fb_vf_code + "'>"
						//+ "<div class='userInfo'>"
						//+ "<span class='userName'>"
						//+ dlist.fb_m_email
						//+ "</span>"
						//+ "<span class='date'>"
						//+ dlist.fb_date
						//+ "</span>"
						//+ "<button type='button' class='delelte_dtn' fb-code='"
						//+ dlist.fb_code
						//+ "'>"
						//+ "<span class='delite_ico'>"
						//+ "<svg width='1em'height='1em' viewBox='0 0 16 16' class='bi bi-x-circle'fill='currentColor' xmlns='http://www.w3.org/2000/svg'>"
						//+ "<path fill-rule='evenodd'	d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z' />"
						//+ "<path fill-rule='evenodd'	d='M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z' />"
						//+ "<path fill-rule='evenodd' d='M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z' />"
						//+ "</svg>"
						//+ "</span>"
						//+ "</button>"
						//+ "</div>"
					//	+ "<div class='replyContent'>"
					//	+ dlist.fb_reply
					//	+ "</div>"
					//	+ "</li>";

			//	flist += "</ol>";
				//location.reload(true);
				jQuery('.creplyContent'+dlist.fb_code).html(dlist.fb_reply);
			},
			error : function(error) {
				alert("댓글 입력 실패");
			}
		});

jQuery('#crepCon').val('');//댓글창 지우기
}

 document.addEventListener('DOMContentLoaded', function() {
	
	jQuery.noConflict();

	
	jQuery('.otherreply').hide();

	

	jQuery(document)
			.on(
					'click',
					'#reply_btn',
					function() {
						var replyFrm = jQuery('#fFrm').serializeObject();
						//추가 데이터 : 게시글번호, 작성자(로그인) id

						//세션에 저장한 로그인 회원 정보에서 id 추출
						replyFrm.fb_m_email = '${mb.m_email}';
						console.log(replyFrm);

						
						jQuery.ajax({
									url : "feedbackInsert",//요청 url(uri)
									type : "post",//전송 방식(get, post)
									data : replyFrm,//전송할 데이터
									dataType : "json",//데이터의 형식
									success : function(data) {
										//목록 전체를 하나의 문자열로 만들어서
										//한꺼번에 id가 rTable인 태그(요소)의
										//innerHTML에 출력.
										var flist = '<ol>';
										var dlist = data.feedback;
										var f_code = '';
										//var r_code=${r.prv_code};

										flist += "<li data-fb_vf_code='" + dlist.fb_vf_code + "'>"
												+ "<div class='userInfo'>"
												+ "<span class='userName'>"
												+ dlist.fb_m_email
												+ "</span>"
												+ "<span class='date'>"
												+ dlist.fb_date
												+ "</span>"
												+ "<button type='button' class='delelte_dtn' fb-code='"
												+ dlist.fb_code
												+ "'>"
												+ "<span class='delite_ico'>"
												+ "<svg width='1em'height='1em' viewBox='0 0 16 16' class='bi bi-x-circle'fill='currentColor' xmlns='http://www.w3.org/2000/svg'>"
												+ "<path fill-rule='evenodd'	d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z' />"
												+ "<path fill-rule='evenodd'	d='M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z' />"
												+ "<path fill-rule='evenodd' d='M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z' />"
												+ "</svg>"
												+ "</span>"
												+ "</button>"
												+ "</div>"
												+ "<div class='replyContent'>"
												+ dlist.fb_content
												+ "</div>"
												+ "</li>";

										flist += "</ol>";
										jQuery('#rlist-ol').append(flist);
										//location.reload(true);
									},
									error : function(error) {
										alert("댓글 입력 실패");
									}
								});

						jQuery('#repCon').val('');//댓글창 지우기
					});
	
	
	
	
	//댓글 삭제

	jQuery(document).on('click', '.delelte_dtn', function() {
		var fb_code = jQuery(this).attr('fb-code');
		var obj = jQuery(this).parent().parent();
		console.log(obj);

		var deleteConfirm = confirm("정말 삭제 하시겠습니까")
		if (deleteConfirm) {
			var paramData = {
				"fb_code" : fb_code
			};
			console.log(paramData);

			jQuery.ajax({
				url : "feedbackDelete",
				type : "post",
				data : paramData,
				dataType : "json",//데이터의 형식
				success : function(result) {
					//var oli = $(this).parent().parent();
					//oli.remove();
					obj.remove();
				},
				error : function() {
					alert("로그인하셔야합니다.")
				}
			});
		}
	});
});
</script>
</html>