<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	//로그인시 고객 정보 확인(제약)
    var numcheck = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/
    //alert(inputNumber);
	$('#register_gogo').click(function(){
	if($('#inputid').val()==""){
		alert("ID는 필수 값입니다");
		$('#inputid').focus();
		return false;
		}else{
			if($('#pswd').val()==""){
				alert("비밀번호는 필수 입력 값입니다")
				$('#pswd').focus();
				return false;
		}else{
			if($('#inputPasswordCheck').val()==""){
				alert("비밀번호를 확인차 한 번 더 입력해 주세요")
				$('#inputPasswordCheck').focus();
				return false;
			}else{
				if($('#pswd').val()!=$('#inputPasswordCheck').val()){
					alert("입력하신 비밀번호가 서로 일치하지 않습니다. 확인해 주세요")
					$('#pswd').focus();
					return false;
				}else{
					if($('#inputName').val()==""){
						alert("이름을 반드시 입력해 주세요");
						$('#inputName').focus();
						return false;
					}else{
						if($('#inputNumber').val()==""){
							alert("휴대전화 번호는 필수 입력 값입니다");
							$('#inputNumber').focus();
							return false;
						}else{
						    if(!numcheck.test($('#inputNumber').val())) {
						        alert("휴대폰 번호에는 숫자만 넣으셔야 합니다.");
						        inputNumber="";
						        $('#inputNumber').focus();
						        return false;
						 	}else{
							    if($('#shopCode option:selected').val()=="999"){
							        alert("매장을 선택해 주세요");
							        shopCode="";
							        $('#shopCode').focus();
							        return false;
							        }else{
									    if($('#grade option:selected').val()=="99"	){									    	
									        alert("등급을 선택해 주세요");
									        $('#grade').focus();
									        return false;
							    	}if($("input[name='agree']:checkbox:checked").size() == 0){				
										alert("이용약관에 동의하셔야 이용이 가능합니다.");
										return false;
										}else
											$('#regijspgo').submit();
										}
									}
								}
							}
						}
					}
				}
			}
		});
			
});

</script>
</head>
<body>
  <!-- info Register_pop_up -->
   <div id="register_dialog" title="Register">
   	  <div class="contentwrap">
  <article class="container">
    <div class="page-header">
	  <h1>회원가입</h1>
    </div>
   </article>
    <form class="form-horizontal" action="register.reg" method="post">
    <div class="form-group">
    <label for="inputid" class="col-sm-2 control-label">아이디</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" id="inputid" name="id" placeholder="아이디">
    </div>
    </div>
    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="pswd" name="pswd" placeholder="비밀번호">
    <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
    </div>
    </div>
       <div class="form-group">
    <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="inputPasswordCheck" name="inputPasswordCheck" placeholder="비밀번호 확인">
      <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
    </div>
    </div>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">이름</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" id="inputName" name="name" placeholder="이름">
    </div>
    </div>
    
    
    <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label" id=hpnum>휴대폰번호</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="inputNumber" name="phnum" placeholder="휴대폰번호">
      <p class="help-block">- 없이 적어주세요.</p>
    </div>
    </div>
    
    
    <div class="form-group">
    <c:set var="list" value="${requestScope.slist}"/>
  
    <label for="inputName" class="col-sm-2 control-label" id=market>매장명</label>
    <div class="col-sm-4">

    <select name="shopCode" id="shopCode">
    	<option value="999">매장 코드 및 매장명을 선택하세요</option>
    <c:forEach var="slist" items="${list}">
    	<option value="${slist.SHOP_CODE}">${slist.SHOP_CODE} // ${slist.SHOP_NAME}</option>    
    </c:forEach>
    </select>
    <c:forEach var="slist" items="${list}">
    </c:forEach>
    </div>
    
    </div>
    
    <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label" id=gradech>직위</label>
    <div class="col-sm-4">
   		<select style="width: 400px; height: 30px;" id="grade" name="grade">
   		<option id="grade" value="99">미선택</option>
			<option id="grade" value="0">본사 관리자</option>
			<option id="grade" value="1">대리점 매니저</option>
			<option id="grade" value="2">일반 직원</option>
		</select>
    </div>
    </div>


   <div class="form-group">
    <label for="inputAgree" class="col-sm-2 control-label">약관 동의</label>
    <div class="col-sm-6 checkbox">
      <label>
        <input id="agree" name="agree" type="checkbox"> <a href="<%= request.getContextPath() %>/include/agreement.jsp" id="agreement_open" target="_blank"> 이용약관</a>에 동의합니다.
    </label>
    </div>
  </div>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
      <button type="submit" class="btn btn-primary" value="register" id="register_gogo">회원가입</button>
    </div>
    </div>
    </form>
   </div>
  </div> 
</body>
</html>