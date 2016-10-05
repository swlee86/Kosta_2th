<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>board_content</title>
	 <link rel="Stylesheet" href="<%=request.getContextPath()%>/style/default.css" />
</head>
<body>
<c:set var="board_content" value="${requestScope.board_content}"/>
<c:set var="board_number" value="${requestScope.board_number}"/>
<c:set var="msg" value="${requestScope.msg}"/>
	<c:if test="${not empty msg}">
		<script type="text/javascript">
			alert("${msg}");
		</script>
	</c:if>
	<div id="pageContainer">
		<div style="padding-top: 30px; text-align: center">
			<center>
				<b>게시판 글내용</b>
				<form action="noticeedit.do?board_number=${board_number}" method="post">
				<table width="80%" border="1">
					<tr>
						<td width="20%" align="center"><b> 글번호 </b></td>
						<td width="30%">${board_number}</td>
						<td width="20%" align="center"><b>작성일</b></td>
						<td>${board_content.board_date}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>글쓴이</b></td>
						<td colspan="3">${board_content.board_writer}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>첨부파일</b></td>
						<td colspan="3">(${board_content.board_file_size})bytes</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>제목</b></td>
						<td colspan="3">${board_content.board_title}</td>
					</tr>
					<tr height="100">
						<td width="20%" align="center"><b>글내용</b></td>
						<td colspan="3">
							<c:if test="${not empty board_content.board_content}">
								${board_content.board_content}
							</c:if>						
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
						<c:set var="session" value="${sessionScope.session_login}"/>
						<c:if test="${session eq 'admin'}">
						<button type="submit" id="board_edit" value="${board_number}">수정</button>
						<a href="deleteOk.do?board_number=${board_number}"><button type="button">삭제</button></a>
						</c:if>
						<button type="button" id="close_popup" onClick="window.close()">닫기</button>
						</td>
					</tr>
				</table>
				</form>
			</center>
		</div>
	</div>
</body>
</html>