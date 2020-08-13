<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/adstyle.css?ver=1.4">
<title>문의 상세페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
document.getElementById('qnaDate').valueAsDate = new Date();
$( document ).ready( function() {
    var dates = $('#andate').text().substring( 0, 10 );
    $('#andate').after('<td class="q_date" id="andate">'+dates+'</td>');
  } );
</script>
<script type="text/javascript">

</script>
</head>
<body>
   <header>
      <jsp:include page="../adHeader.jsp"></jsp:include>
   </header>
   <section class="sectionover">
      <div class="servCate menuCate">
			<h2 id="adSManagement">
				<b><ins>고객센터</ins></b>
			</h2>
			<div class="adSQna">
				<a href="./adSQna"><b>Q&A</b></a>
			</div>
			<div class="adSWarning">
				<a href="./adSWarning">신고</a>
			</div>
		</div>
		<div class="servQinfo listCss">
			<div class="line">
            <h2 class="login-header">문의글 상세</h2>
            <table class="table123">
               <tr>
                  <td align="center" class="q_titmenu">제목 </td>
                  <td colspan="3" class="q_tit">${question.title}</td>
                  <td align="center" class="q_ctsmenu">이름 </td>
                  <td class="q_cts">${question.name}</td>
                  <td align="center" class="q_datemenu">등록 날짜 </td>
                  <td class="q_date">
                  <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${question.dates}"/></td>
               </tr>
               <tr>
                  <td class="questioncon">상세내용</td>
                  <td class="q_con"colspan="7">${question.content}</td>
               </tr>
               <tr>
                  <td colspan="1">첨부파일</td>
               	  <td colspan="7" id="farea">
                  <c:if test="${empty file}">
                     첨부된 파일이 없습니다.
                  </c:if> 
                  <c:if test="${!empty file}">
                     <%-- <c:forEach var="file" items="${bfList}"> --%>
                     <c:set var="fsname" value="${file.f_sysname}"/>
                     <a id="files" href="./download?sysFileName=${file.f_sysname}" 
                     onclick="window.open(this.href); return false"><img src="resources/upload/${file.f_sysname}">
                     ${file.f_oriname}</a>
                     <button id="fdelbtn" onclick="fileDel('${file.f_sysname}')">삭제</button>
                     <%-- </c:forEach> --%>
                  </c:if>   
                  </td>
               </tr>
               <tr class="sub12">
             	  <td align="center"  class="q_anfield" colspan="5">답변 내용</td>
             	  <td id="null"></td>
                  <td align="center" class="q_andate">답변 날짜</td>
                  <td class="q_date" id="andate">
                  <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${question.q_andate}"/>
                  </td>
               </tr>
               <tr>
                  
                  <td class="q_field" colspan="8" rowspan="3">${question.q_anfield}</td>
               </tr>
               <tr>
               
               <%-- <td colspan="6" align="right">
                  <button class="btn-write" id="upbtn" onclick="location.href='./updateFrm?q_code=${question.q_code}'">수정</button>
                  <button class="btn-write" id="delbtn" onclick="goDelete('${question.q_code}','${mb.m_email}','${question.q_m_email}')">삭제</button>
                  <button class="btn-sub" onclick="location.href='./servicecenter_question'">취소</button>
               </td> --%>
            </tr>
            </table>
            <form action="./adQnaInsert">
               	<TEXTAREA id='content' name="content"></TEXTAREA>
               	<input name="code" value="${question.code}" style="display: none">
               	<input id='subm' type='submit'>
               </form>
         </div>
      </div>
   </section>
   <footer>
      <jsp:include page="../footer.jsp"></jsp:include>
   </footer>
</body>
</html>