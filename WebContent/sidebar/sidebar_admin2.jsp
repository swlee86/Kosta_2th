<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
    var duration = 300;
 
    var $sidebar = $('.sidebar');
    var $sidebarButton = $sidebar.find('button').on('click', function(){
        $sidebar.toggleClass('open');
        if($sidebar.hasClass('open')){
            $sidebar.stop(true).animate({left: '-70px'}, duration, 'easeOutBack');
            $sidebarButton.find('span').text('CLOSE');
        }else{
            $sidebar.stop(true).animate({left: '-270px'}, duration, 'easeInBack');
            $sidebarButton.find('span').text('Menu');
        };
    });
    
	$("#status_list").click(function(){ 
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
	
	$("#inv_reg_del").click(function(){ 
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
	
	$("#mul_inv_reg").click(function(){ 
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
    
});



</script>
<style type="text/css">
button {
    outline: none;
}
button .sidebar-btn {
    color: #fff;
    font-weight: bold;
}
.sidebar {
    background-color: #222;
    width: 270px;
    height: 100%;
    position: fixed;
    top: 0;
    left: -270px;
    z-index: 9999;
}
.sidebar > .sidebar-content {
    position: absolute;
    top: 20px;
    left: 90px;
    color: #fff;
}
.sidebar button {
    background-color: #222;
    display: block;
    position: absolute;
    top: 117px;
    left: 270px;
    width: 70px;
    height: 38px;
    line-height: 38px;
    text-align: center;
    margin: 0;
    padding: 0;
    border: none;
}
</style>

</head>
<body>
<aside class="sidebar">
    <div class="sidebar-content">
    	<br>
    	매장 관리
    	<br><br>
    	<input style="width:150px; color: blue;" type="button" id="status_list" value="본사 재고현황"><br><br>
    	<input style="width:150px; color: blue;" type="button" id="status_order" value="재고 주문"><br><br>
    	<input style="width:150px; color: blue;" type="button" id="inv_reg_del" value="상품 등록 및 삭제"><br><br>
		<input style="width:150px; color: blue;" type="button" id="mul_inv_reg" value="상품 일괄 등록"><br><br>
    </div>
    <button><span class="sidebar-btn">Menu</span></button>
</aside>
</body>
</html>