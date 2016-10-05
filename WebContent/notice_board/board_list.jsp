<%@page import="javax.naming.Context"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
$(function(){
	$('#refresh_board1').click(function(){ 
	$('#main_down_right').load(
			"notice.do",
			function(responseText,statusText,xhr){
				if(statusText == "success"){
					//alert("load success : 200~299 : " + responseText);
				}
				if(statusText == "error"){
					alert("load fail : " + xhr.status + xhr.statusText);
				}
			  }
			);
});	
});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="Stylesheet" href="<%=request.getContextPath()%>/style/default.css" />
</head>
<body>
	<c:set var="pagesize" value="${requestScope.pagesize}" />
	<c:set var="cpage" value="${requestScope.cpage}" />
	<c:set var="pagecount" value="${requestScope.pagecount}" />
	<c:set var="totalcount" value="${requestScope.totalboardCount}" />
	<div id="pagecontainer">
		<h3>공지사항 안내</h3>
		<div style="text-align: cetner">
			<table width="80%" border="1" cellspacing="0" align="center">
				<tr>
					<td colspan="5">
						<p align="right"><a href="/00_Project_servlet/notice_board/board_list2.jsp" target="_blank">더보기</a></p>
					</td>
					</tr>
					<tr>
					<th width="10%">순번</th>
					<th width="50%">제목</th>
					<th width="20%">글쓴이</th>
					<th width="20%">날짜</th>
					</tr>

		       <c:set var="notice" value="${requestScope.noticeList}"/>
				<c:forEach var="noticeboard" items="${notice}">
					<c:set var="board_number" value="${noticeboard.board_number }" />
					<c:set var="subject" value="${noticeboard.board_title}" />
					<c:set var="writer" value="${noticeboard.board_writer}" />
					<tr onmouseover="this.style.backgroundColor='gray'"
						onmouseout="this.style.backgroundColor='white'">
						<td align="center">${noticeboard.board_number}</td>
						<td align="left">
							<a id="subjectlist" href='board_content.do?board_number=${noticeboard.board_number}' target="_blank">${noticeboard.board_title}</a>
						</td>
						<td align="center">
                             	 ${noticeboard.board_writer}
						</td>
						<td align="center">${noticeboard.board_date}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="center">
						<c:set var="memberid" value="${sessionScope.session_login}"/>
						<c:if test="${memberid eq 'admin'}">
						<a href="boardwrite.do" target="_blank">공지사항 쓰기</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" id="refresh_board1" value="새로고침">
					<td colspan="3" align="center">총 게시물 수 : ${totalcount}
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>