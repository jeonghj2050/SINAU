<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/servicecenter.css?a">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript">

</script>
</head>
<body>
	<header>
		<jsp:include page="servicecenter_header.jsp"></jsp:include>
	</header>
	<section class="sectionover">
		<h2 class="login-header">고객 센터</h2>
		<div class="cate_container">
			<a class="category" href="./servicecenter_main">FAQ</a> <a
				class="category" href="./servicecenter_question">1 : 1문의</a>
		</div>
		<div class="content">
			<div class="write-form">
				<h2 class="login-header">문의글 상세</h2>
				<table>
					<tr height="50">
						<td bgcolor="pink" align="center">제목</td>
						<td width="200">이건 뭐야 좆같게 시발 존나 하기싫어</td>
						<td bgcolor="pink" align="center">카테고리</td>
						<td width="150">강좌 문의</td>
						<td bgcolor="pink" align="center">등록 날짜</td>
						<td width="150">0000-00-00-00</td>
					</tr>
					<tr height="200">
						<td bgcolor="pink">상세내용</td>
						<td colspan="5">내내내내내낸요요요요요요요요요요요용요요요요요요용</td>
					</tr>
					<c:if>
						<tr id="fview">
							<c:forEach>
								<c:if>
									<td colspan="6"><img src="" width="100"></td>
								</c:if>
							</c:forEach>
						</tr>
					</c:if>
					<tr height="30">
						<td bgcolor="pink" align="center">답변 상태</td>
						<td colspan="5">답변 완료</td>
					</tr>
					<tr height="50">
						<td bgcolor="pink" align="center">답변 내용</td>
						<td colspan="5">아 몰라</td>
					</tr>
					</table>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="servicecenter_footer.jsp"></jsp:include>
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
</html>