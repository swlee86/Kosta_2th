<%@page import="kr.or.kosta.Dto.NoticeBoard.NoticeBoardDTO"%>
<%@page import="kr.or.kosta.Dao.NoticeBoard.NoticeBoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<title>Insert title here</title>
<link rel="Stylesheet" href="<%=request.getContextPath()%>/style/default.css" />
	 <script type="text/javascript">
	 $(function(){
		 $('close_popup').click(function() {
			 $('#jb-content').load("notice.do");
		 })
		 

	 });
	 function reload() { 
			document.location.reload();     
			}
		 
	 
	 </script>
</head>
<body>
	<%
		NoticeBoardDAO bdao = new NoticeBoardDAO();
		int totalboardCount = bdao.totalboardCount();
      
        String psStr = request.getParameter("ps");    //pagesize
        String cpStr = request.getParameter("cp");    //currentpage
        
        if(psStr == null || psStr.trim().equals("")){
            psStr = "10"; // default 5건씩 
        }
        
        if(cpStr == null || cpStr.trim().equals("")){
            cpStr= "1";        //default 1 page
        }
      
        int pagesize = Integer.parseInt(psStr);  //5
        int cpage = Integer.parseInt(cpStr);     //1
        int pagecount = 0;                       
        
        if(totalboardCount % pagesize==0){        //전체 건수 , pagesize > 
            pagecount = totalboardCount/pagesize;
        }else{
            pagecount = (totalboardCount/pagesize) + 1;
        }

        List<NoticeBoardDTO> list = bdao.list(cpage, pagesize);

    %>
	<c:set var="pagesize" value="<%=pagesize%>" />
	<c:set var="cpage" value="<%=cpage%>" />
	<c:set var="pagecount" value="<%=pagecount%>" />
	
	
	<div id="pagecontainer">
		<div style="padding-top: 30px; text-align: cetner">
			<table width="80%" border="1" cellspacing="0" align="center">
				<tr>
					<td colspan="5">
						<form name="list">
						PageSize설정: 
							<select name="ps" onchange="submit()">
		   						<c:forEach var="i" begin="10" end="40" step="5">
		   							<c:choose>
									<c:when test="${pagesize == i}">
	                            		 <option value='${i}' selected>${i}건</option>
	                        		</c:when>
									<c:otherwise>
	                                  	  <option value='${i}'>${i}건</option>
	                               </c:otherwise>
								</c:choose>
		   						</c:forEach>
		   					</select>
		   					<input type="button" value="새로고침" onclick="reload()">
						</form>
					</td>
				</tr>
				<tr>
					<th width="10%">순번</th>
					<th width="50%">제목</th>
					<th width="20%">글쓴이</th>
					<th width="20%">날짜</th>
				</tr>
				<!-- 데이터가 한건도 없는 경우  -->
				<%
		     	if(list == null || list.size() == 0){
		     		out.print("<tr><td>데이터가 없습니다</td></tr></table>");
		     		return;
		     	} 
		       %>
				<c:forEach var="board" items="<%=list%>">
					<c:set var="board_number" value="${board.board_number }" />
					<c:set var="subject" value="${board.board_title}" />
					<c:set var="writer" value="${board.board_writer}" />
					<tr onmouseover="this.style.backgroundColor='gray'"
						onmouseout="this.style.backgroundColor='white'">
						<td align="center">${board.board_number}</td>
						<td align="left">
							<a href='board_content.do?board_number=${board_number}' target="_blank">${subject}</a>
						</td>
						<td align="center">
                             ${writer}
    					</td>
						<td align="center">${board.board_date}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="center">
						<c:set var="memberid" value="${sessionScope.session_login}"/>
						<c:if test="${memberid eq 'admin'}">
						<a href="boardwrite.do" target="_blank"><button type="button">글쓰기</button></a>
						</c:if>
						<button type="button" id="close_popup" onClick="window.close()">닫기</button>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<!--이전 링크 --> 
						<c:if test="${cpage>1}">
							<a href="board_list2.jsp?cp=${cpage-1}&ps=${pagesize}">이전</a>
							<!--페이지 리스트 구현  -->
						</c:if> 
						<c:forEach var="i" begin="1" end="${pagecount}" step="1">
							<c:choose>
								<c:when test="${cpage==i}">
									<font color='red'>[${i}]</font>
								</c:when>
								<c:otherwise>
									<a href="board_list2.jsp?cp=${i}&ps=${pagesize}">[${i}]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
						<!--다음 링크 --> 
						<c:if test="${cpage<pagecount}">
							<a href="board_list2.jsp?cp=${cpage+1}&ps=${pagesize}">다음</a>
						</c:if>
					</td>
					<td colspan="2" align="center">총 게시물 수 : <%=totalboardCount%>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>