<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="loginsession" value="${sessionScope.session_login}"/>


	<%
	out.print(session.getAttribute("session_login")+"님 환영홥니다");
	String ID = (String)session.getAttribute("session_login");
	
    Cookie[] cookies = request.getCookies() ;

    if(cookies != null){
        for(int i=0; i < cookies.length; i++){
            Cookie c = cookies[i] ;
            
            // 저장된 쿠키 이름을 가져온다
            String cName = c.getName();

            // 쿠키값을 가져온다
            String cValue = c.getValue() ;

            if(cName.equals("upcookie")){
            %>
            <script>
            $(function(){
            $('#update_confirm').dialog(
				{
					 autoOpen:true,
				     width : "auto",
				     resizable:false,
				     modal:true
				}		
			  );
           });
            </script> 
            <%
            }else{
                %>
                <script>

                $(function(){
                $('#update_confirm').dialog(
    				{
    					 autoOpen:false
    				}		
    			  );
               });
                </script> 
                <%
            }
        }
    }
	%>
	
	<script type="text/javascript">
	$(function(){
		$('#update_data').dialog(
				{
					 autoOpen:false,
				     width : "auto",
				     resizable:false,
				     modal:true
				}		
			);
		$('#update').click(function(){
			$('#update_data').dialog('open');
			<%
			Cookie upcookie = new Cookie("upcookie", ID);
			upcookie.setMaxAge(0);
			response.addCookie(upcookie);
			%>
		});
		
        $('#update_confirm').dialog(
			{
				 autoOpen:false
			}		
		  );
        
        $('#logout').click(function() {
        	window.location.replace("logoutConfirm.do");
        	//alert("로그아웃?");
        })
	});

	</script>
	<br>
	    <c:set var="grade" value="${sessionScope.grade}"/>
	<c:choose>
		<c:when test="${grade==0}">
		등급 : 본사 관리자
		</c:when>
		<c:when test="${grade==1}">
		등급 : 대리점 매니저
		</c:when>
		<c:when test="${grade==2}">
		등급 : 대리점 직원
		</c:when>
	</c:choose>

	<input type="button" class="btn btn-default navbar-btn" name="update" id="update" value="회원정보 수정">
	<input type="button" class="btn btn-default navbar-btn" name="logout" id="logout" value="로그아웃" />

  <!-- 회원정보 수정 -->
  <div id="update_data" title="회원정보 수정">
  <div class="contentwrap">
  <article class="container">
    <div class="page-header">
	  <h1>회원정보 수정</h1>
    </div>
   </article>
    <form action="update.jsp" method="post" id="modify">
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
    <div class="form-group">
    <input type="email" class="form-control" id="inputEmail" name="email" placeholder="이메일" value=<%= ID %> readonly="readonly">
    </div>
    </div>
    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
    <div class="form-group">
    <input type="password" class="form-control" id="pswd" name="pswd" placeholder="비밀번호">
    <hr>
    <div class="form-group">
    <button type="submit" class="btn btn-primary" value="register" id="update_gogo">확인</button>
    </div>
    </div>
    </div>
    </form>
   </div>
  </div>
  
  
  
  <!-- UPDATE 메뉴 -->
<div id="update_confirm" title="회원정보 수정">
  <div class="contentwrap">
  <article class="container">
    <div class="page-header">
	  <h1>회원정보 수정</h1>
    </div>
   </article>
    <form action="update_confirm.jsp" method="post" id="update_confirm">
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
    </div>
    
    <div class="form-group">
    <input type="email" class="form-control" id="inputEmail" name="email" placeholder="이메일" value=<%= ID %> readonly="readonly">
    </div>

    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
    <input type="password" class="form-control" id="pswd" name="pswd" placeholder="비밀번호">
    </div>
    <div class="form-group">
    <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
    <input type="password" class="form-control" id="pswdchk" name="pswdchk" placeholder="비밀번호">
    <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
    </div>

    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">이름</label>
    <input type="text" class="form-control" id="inputName" name="name" placeholder="이름">
    </div>
    <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label" id=hpnum>휴대폰번호</label>
    <input type="text" class="form-control" id="inputNumber" name="phnum" placeholder="휴대폰번호">
    <p class="help-block">- 없이 적어주세요.</p>
    </div>
    <hr>
    <div class="form-group">
    <button type="submit" class="btn btn-primary" value="register" id="update_gogo">확인</button>
    <button type="button" class="btn btn-primary" value="cancle" id="cancle">취소</button>
    </div>
    </form>
   </div>
</div>