<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title></title>
<link rel="Stylesheet" href="<%=request.getContextPath()%>/style/default.css"/>
<style type="text/css">
table, tr, td {border: 1px solid; text-align: center;}
</style>
<script type="text/javascript">
$(function(){
	$("#request").click(function(){ 
		$('#jb-content').load(
			"memberlist.do",
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
	
	$("#refresh").click(function(){ 
		$('#jb-content').load(
			"memberlist.do",
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



</head>
<body>
<jsp:include page="/sidebar/sidebar_admin1.jsp"></jsp:include>
<div id="down" style="clear: both; margin-top: 50px;">
매장 인원 관리 <input type="button" id="refresh" value="새로고침"> <br><br>
<table>
	<tr>
		<td width="10%">아이디</td>
		<td width="10%">이름</td>
		<td width="12%">핸드폰번호</td>
		<td width="15%">매장</td>
		<td width="10%">가입일자</td>
		<td width="10%">승인일자</td>
		<td width="10%">로그인 가능</td>
		<td width="10%">직위</td>
		<td width="5%">수정</td>
	</tr>

	<c:set var="list" value="${requestScope.list}"/>
	<c:forEach var="memberlist" items="${list}">
	<tr>
		<td>${memberlist.member_id}</td>
		<td>${memberlist.member_name}</td>
		<td>${memberlist.member_phone}</td>
		<td>${memberlist.SHOP_CODE}</td>
		<td>${memberlist.member_redate}</td>
		<td>${memberlist.member_okdate}</td>
		<td>${memberlist.m_loginok}</td>
	<c:choose>
		<c:when test="${memberlist.member_grade==0}">
		<td>본사 관리자</td>
		</c:when>
		<c:when test="${memberlist.member_grade==1}">
		<td>대리점 매니저</td>
		</c:when>
		<c:when test="${memberlist.member_grade==2}">
		<td>일반 직원</td>
		</c:when>
		<c:when test="${memberlist.member_grade==3}">
		<td style="background-color: yellow">미분류</td>
		</c:when>
	</c:choose>
		<td><a href='modify.do?id=${memberlist.member_id}' target="_blank"><input type="button" id="modify" value="수정"></a></td>
	</tr>
	</c:forEach>
</table>
</div>
</body>
</html>

