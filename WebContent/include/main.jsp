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
</script>
<style type="text/css">
  <style>
  	  #main {
  	    width: 950px;
        margin: 0px auto;
        padding: 20px;
        border: 1px solid #bcbcbc;
  	  }
  
      #main_top_left {
         width:400px; 
         height:100px; 
   	     display:inline-block; 
   	     float: left;
      }
      #main_top_right {
        width : 400px;
        padding: 100px;
        float: left;
        display:inline-block; 
        border: 1px solid #bcbcbc;
      }
      #main_down_left {
        width : 400px;
        padding: 100px;
        margin-bottom: 20px;
        float : left;
        border: 1px solid #bcbcbc;
      }
      #main_down_right {
        width : 400px;
        padding: 20px;
        margin-bottom: 20px;
        float : left;
        border: 1px solid #bcbcbc;
      }
      
      @media screen and (max-width:480px) {
        ##main_top_left {
          width: auto;
        }
        ##main_top_right {
          float: none;
          width: auto;
        }
        #main_down_left {
          float: none;
          width: auto;
        }
        
        #main_down_right {
          float: none;
          width: auto;
        }
      }

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="Stylesheet" href="<%=request.getContextPath()%>/style/default.css" />
</head>
<body>
	<div id="pagecontainer">
	<div id = "main">
		<div id="main_top_left">
			<img src="images/1.JPG">
		</div>
	<div id="main_top_right">
			<img src="images/2.JPG">
	</div>
	<div id = "main_down_left">
			<img src="images/3.JPG">	
	</div>
	<div id = "main_down_right">
		<jsp:include page="/notice_board/board_list.jsp"></jsp:include>
	</div>
	</div>
	</div>
	
</body>
</html>