<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="Stylesheet"
	href="<%=request.getContextPath()%>/style/default.css" />
	<script type="text/javascript">
	function editCheck() {
		if (!edit.writer.value) {

			alert("이름을 입력하세요");
			edit.writer.focus();
			return false;
		}
		if (!edit.email.value) {
			alert("이메일을 입력해야합니다.");
			edit.email.focus();
			return false;
		}

		if (!edit.subject.value) {
			alert("제목을 입력하세요");
			edit.subject.focus();
			return false;
		}

		if (!edit.content.value) {
			alert("글 내용을 입력하세요");
			edit.content.focus();
			return false;
		}

		document.edit.submit();

	}
</script>
</head>
<body>
<c:set var="board_number" value="${requestScope.board_number}"/>
<c:set var="board_content" value="${requestScope.board_content}"/>
	<div id="pageContainer">
		<div style="padding-top: 25px; text-align: center">
			<!-- form 시작 -->
			<form name="edit" action="noticeeditOk.do?board_number=${board_number}" method="POST">
				<center>
					<table width="90%" border="1">
						<tr>
							<td width="20%" align="center"><b> 글번호 </b></td>
							<td width="30%">
									${board_number}
							<input type="hidden" name="board_number" value="${board_number}"></td>
							<td width="20%" align="center"><b>작성일</b></td>
							<td>${board_content.board_date}</td>
						</tr>
						<tr>
							<td width="20%" align="center"><b>글쓴이</b></td>
							<td width="30%">
								${board_content.board_writer}
							</td>
						</tr>
						<tr>
							<td width="20%" align="center"><b>제목</b></td>
							<td colspan="3">
								<input type="text" name="subject" value="${board_content.board_title}" size="40">
							</td>
						</tr>
						<tr height="100">
							<td width="20%" align="center"><b>글내용</b></td>
							<td colspan="3">
								<textarea rows="7" cols="50" name="content">
									${board_content.board_content}
								</textarea>
							</td>
						</tr>

						<tr>
							<td width="20%" align="center"><b>첨부파일</b></td>
							<td colspan="3">${board_content.board_file} (${board_content.board_file_size} bytes)<br/> 
								<input type="file" name="filename">
							</td>
						</tr>
						<tr>
							<td colspan="4" align="center">
								<input type="submit" value="수정하기" onclick="editCheck();">
								<input type="reset" value="다시쓰기">
							</td>
						</tr>
						<tr>
							<td colspan="4" align="center">
								<a href="board_list.jsp">목록</a>|
								<a href="board_edit.jsp?board_number=글번호">편집</a> |
								<a href="board_delete.jsp?board_number=글번호">삭제</a>
							</td>
						</tr>
					</table>
				</center>
			</form>
		</div>
	</div>
</body>
</html>