<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/servicecenter.css?a">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section class="sectionover">
		<h2 class="login-header">고객 센터</h2>
		<div class="cate_container">
			<a class="category" href="./servicecenter_main">FAQ</a> <a
				class="category" href="./servicecenter_question">1 : 1문의</a>
		</div>
		<div class="question-content">
			<div class="question-form">
				<h2 class="login-header">문의글 상세</h2>
				<table>
					<tr>
						<td align="center" class="q_titmenu">제목 : </td>
						<td class="q_tit">${question.q_title}</td>
						<td align="center" class="q_ctsmenu">카테고리 : </td>
						<td class="q_cts">${question.cts_name}</td>
						<td align="center" class="q_datemenu">등록 날짜 : </td>
						<td class="q_date">
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${question.q_date}"/></td>
					</tr>
					<tr>
						<td class="questioncon">상세내용</td>
						<td colspan="5">${question.q_content}</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="5" id="farea"><c:if test="${empty bfList}">
							첨부된 파일이 없습니다.
						</c:if> <c:if test="${!empty bfList}">
								<c:forEach var="file" items="${bfList}">
									<c:set var="fsname" value="${file.f_sysname}" />
									<a href="./download?sysFileName=${file.f_sysname}">${file.f_oriname}</a>
									<button id="fdelbtn" onclick="fileDel()">삭제</button>
								</c:forEach>
							</c:if></td>
					</tr>
					<tr>
					<td colspan="6">
						<c:forEach var="f" items="${bfList}">
								<img src="resources/upload/${f.f_sysname}" width="200px" height="200">
						</c:forEach>
					</td>
					</tr>
					<tr class="sub12">
						<td align="center" class="q_andate">날짜</td>
						<td colspan="5">
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${question.q_andate}"/></td>
					</tr>
					<tr>
						<td align="center"  class="q_anfield">답변 내용</td>
						<td colspan="5">${question.q_anfield}</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
	function goDelete(bnum, lid, bid) {
		if (lid != bid) {
			alert("본인이 작성한 글이 아니면 삭제할 수 없습니다.");
			return;
		}
		var del = confirm("정말로 삭제 하시겠습니까?");
		if (del == true) {
			location.href = './delete?bnum=' + bnum;
		} else {
			alert("취소되었습니다.");
		}
	}

	function fileDel() {
		var ok = confirm('첨부파일을 삭제하겠습니까?');

		if (ok == true) {
			var fname = '${fsname}';
			console.log(fname);

			var fnObj = {
				"fname" : fname
			};
			console.log(fnObj);

			$.ajax({
				url : "fdelete",
				type : "get",
				data : fnObj,
				success : function(data) {
					if (data == "success") {
						$('#farea').html('첨부된 파일이 없습니다.');
						$('#fview').html('');
					} else {
						alert('삭제 실패');
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	}
</script>
<script src="resources/js/jquery.serializeObject.js"></script>
</html>