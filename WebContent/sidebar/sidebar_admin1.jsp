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
    
	$("#request_info").click(function(){ 
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
    
	$("#info_delete").click(function(){ 
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
	
	$("#trade_list").click(function(){ 
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
	
	$("#request_inv").click(function(){ 
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
	
	$("#register_shop").click(function(){ 
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
    	<input style="width:150px; color: blue;" type="button" id="register_shop" value="매장 등록"><br><br>
    	<input style="width:150px; color: blue;" type="button" id="request_info" value="인원 관리"><br><br>
    	<input style="width:150px; color: blue;" type="button" id="info_delete" value="매장 정보 및 삭제"><br><br>
    	<input style="width:150px; color: blue;" type="button" id="trade_list" value="거래 내역"><br><br>
		<input style="width:150px; color: blue;" type="button" id="request_inv" value="재고 요청"><br><br>
    </div>
    <button><span class="sidebar-btn">Menu</span></button>
</aside>
</body>
</html>