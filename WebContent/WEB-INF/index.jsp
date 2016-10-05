<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=29e8fde417f46c35258d84eac94a59dc&libraries=services"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">


<!-- 세션 아이디 c:set으로 세팅  -->
<c:set var="memberid" value="${sessionScope.session_login}"/>

<script type="text/javascript">
function reload() { 
	document.location.reload();     
	}
 
 
$(function(){	
	$("#request_order").click(function(){ 
		$('#jb-content').load(
		"request_inv.do",
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
	
	$("#request_delete").click(function(){ 
		$('#jb-content').load(
				"infodelete.do",
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
	
	$("#transaction").click(function(){ 
		$('#jb-content').load(
				"trade_list.do",
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
	
	$("#status").click(function(){ 
		$('#jb-content').load(
		"inv_status.do",
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
	
	$("#status_order").click(function(){ 
		$('#jb-content').load(
		"status_order.do",
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
	
	$("#ware_register").click(function(){ 
		$('#jb-content').load(
		"ware_register.do",
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
	
	$("#ware_mul_register").click(function(){ 
		$('#jb-content').load(
		"ware_mul_register.do",
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
	
	$("#management").click(function(){ 
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
	
	
		$('#open_button').click(function(){
			$('#login_dialog').dialog('open')
		});
		
		$('#register_dialog').dialog(
				{
					 autoOpen:false,
				     width : "auto",
				     resizable:false,
				     modal:true
				}		
			);
		
			$('#sign_button').click(function(){
				$('#register_dialog').dialog('open')
			});
			
			$('#DDD').click(function(){
				$('#register_dialog').dialog('open')
			});
			
			
			<c:if test="${not empty memberid}">
				$("#request_manage").click(function(){ 
					$('#jb-content').load(
							"request_manage.do",
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
				
			</c:if>

			
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
							    if($('#inputmarket').val()==""){
							        alert("매장명을 입력해 주세요");
							        inputmarket="";
							        $('#inputmarket').focus();
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
		
	
    $('#logingo').click(function(){	
    if($('#id').val()==""){
    		alert("ID를 입력해 주세요");
    		$('#id').focus();
    		return false;
    		}else{
    			if($('#passwordch').val()==""){
    				alert("패스워드를 입력해 주세요");
    				$('#passwordch').focus();
    				return false;
    			}else{
    				$('#logjspgo').submit();
    			}
    		}
    });

}); 

</script>
<style type="text/css">
    #jb-container {
        width: auto;
        margin: 0px auto;
        padding: 20px;
        border: 1px solid #bcbcbc;
        text-align: center;
      }
      #jb-header {
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
      }
      #jb-content {
        width: 850px;
        padding: 20px;
        margin-bottom: 20px;
        float: left;
        border: 1px solid #bcbcbc;
      }
      #jb-sidebar {
        width: 260px;
        padding: 20px;
        margin-bottom: 20px;
        float: right;
        border: 1px solid #bcbcbc;
      }
      #jb-footer {
        clear: both;
        padding: 20px;
        border: 1px solid #bcbcbc;
      }
      @media screen and (max-width:480px) {
        #jb-container {
          width: auto;
        }
        #jb-content {
          float: none;
          width: auto;
        }
        #jb-sidebar {
          float: none;
          width: auto;
        }
      }

</style>
</head>
<body>
   <div id="jb-container">
      <div id="jb-header">
        <jsp:include page="/include/Top.jsp"></jsp:include>
      </div>
      

      <c:choose>
      <c:when test="${not empty memberid}">
      <div id="jb-content">
      	<jsp:include page="/include/main.jsp"></jsp:include>
      </div>
      </c:when>
      <c:otherwise>

      </c:otherwise>
      </c:choose>
      
    

	<c:choose>
		<c:when test="${not empty memberid}">
	<div id="jb-sidebar">
         <!-- info Login_pop_up -->
	<script type="text/javascript">
		$("#jb-sidebar").load("include/loginview.jsp");		
	</script>
	</div>
    </c:when>

	<c:otherwise>
	<div id="jb-sidebar" style="width:100%;">
		<script type="text/javascript">
		</script>
        <form method="post" action="loginok.reg">
            <div class="form-group">
                <label for="username-id">아이디</label>
                <input name="id" value='' id="id" placeholder="ID" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input name="pswd" id="passwordch" value='' placeholder="Password" type="password" class="form-control" />
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="login" id="logingo">      
            </div>
            <hr>
            	<a href="#" class="btn btn-default btn-block m-t-md" id="pwsearch">비밀번호 찾기</a>
           	<hr>
            <div class="form-group">
                <a href="#" class="btn btn-default btn-block m-t-md" id="DDD">회원가입</a>
            </div>
        </form>
        </div>
        </c:otherwise>
       </c:choose>  

    
 
      <div id="jb-footer">
        <p>Copyright 3조</p>
        <p>해당 사이트는 고객들의 정보(아이디 및 연락처 등의)수집에 대해서 허가하지 않습니다 </p>
      </div>
    </div>
 

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
    <label for="inputName" class="col-sm-2 control-label" id=market>매장명</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="inputmarket" name="market" placeholder="매장 이름">
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
  
  
  <!-- 이용약관 -->
  <div id="accept_dialog" title="accept">
  
  </div>
  
</body>
</html>