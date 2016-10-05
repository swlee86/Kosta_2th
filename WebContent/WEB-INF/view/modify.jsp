<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, tr, td {border: 1px solid; text-align: center;}
</style>
</head>
<body>
<c:set var="list" value="${requestScope.modifylist}"/>
	<form action="modifyOk.do" method="post">
	<table>
	<c:forEach var="modify" items="${list}">
		<tr>
		<td width="10%">아이디</td>
		<td><input style="text-align: center;" type="text" id="id" name="id" value="${modify.member_id}" readonly="readonly"></td>
		</tr>
		<tr>
		<td width="10%">이름</td>
		<td><input style="text-align: center;" type="text" id="modify_name" name="modify_name" value="${modify.member_name}"></td>
		</tr>
		<tr>
		<td width="12%">핸드폰번호</td>
		<td><input style="text-align: center;" type="text" id="modify_phnum" name="modify_phnum" value="${modify.member_phone}"></td>
		</tr>
		<tr>
		<td width="15%">매장</td>
		<td><input style="text-align: center;" type="text" id="modify_market" name="modify_market" value="${modify.SHOP_CODE}"></td>
		</tr>
		<tr>
		<td width="10%">가입일자</td>
		<td>${modify.member_redate}</td>
		</tr>
		<tr>
		<td width="10%">로그인 가능</td>
		<td>
		<select name = "loginstate">
		<option id="loginstate" value="${modify.m_loginok}">${modify.m_loginok}</option>
		<c:choose>
			<c:when test="${modify.m_loginok eq 'y'}">
				<option value="n">n</option>
			</c:when>
			<c:when test="${modify.m_loginok eq 'n'}">
				<option value="y">y</option>
			</c:when>
		</c:choose>
		</select>
		
		</td>
		</tr>

		<tr>
		<td width="20%">직위</td>
		<td>
		<select name="grade">
		<c:choose>
		<c:when test="${modify.member_grade==0}">
			<option id="grade" value="${modify.member_grade}">본사 관리자</option>
			<option id="grade" value="1">대리점 매니저</option>
			<option id="grade" value="2">일반 직원</option>
		</c:when>
		<c:when test="${modify.member_grade==1}">
			<option id="grade" value="${modify.member_grade}">대리점 매니저</option>
			<option id="grade" value="0">본사 관리자</option>
			<option id="grade" value="2">일반 직원</option>
		</c:when>
		<c:when test="${modify.member_grade==2}">
			<option id="grade" value="${modify.member_grade}">일반 직원</option>
			<option id="grade" value="0">본사 관리자</option>
			<option id="grade" value="1">대리점 매니저</option>
		</c:when>
		<c:otherwise>
			<option id="grade" value="3">미분류</option>
			<option id="grade" value="0">본사 관리자</option>
			<option id="grade" value="1">대리점 매니저</option>
			<option id="grade" value="2">일반 직원</option>
		</c:otherwise>
		</c:choose>
		</select>
		</td>
		</tr>
		
		<tr>
		<td colspan="2" width="5%">
			<button type="submit">수정하기</button>
			<a href='#'><button type="button" id="close_popup" onClick="window.close()">닫기</button></a>
		</td>
		</tr>
		</c:forEach>
	</table>
	</form>
</body>
</html>