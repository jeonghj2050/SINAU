<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<link rel="stylesheet" href="resources/css/style.css?a">
</head>
<body>
	<div class="group">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<section>
 			<nav class="group-lisst">
				<ul>
					<li class="group1"><a href="./normaljoin">�Ϲ� ȸ��</a></li>
					<li class="group1"><a href="./Creatorjoin">ũ�������� ȸ��</a></li>
					<li class="group1"><a href="./dealjoin">�Ǹ��� ȸ��</a></li>
				</ul>
			</nav>
		</section>
		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>