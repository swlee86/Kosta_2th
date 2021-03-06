<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map ="";
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("SHOP_ADDR_1").value = fullAddr;
                // 주소로 좌표를 검색
                geocoder.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/sidebar/sidebar_admin1.jsp"></jsp:include>
<div id="left" style="float: left;">
<h3>매장 등록 </h3>
	<form action="InfoAdd.reg" method="post" > 
		<table border="1px solid">
			<tr><td>코드번호</td><td colspan="2"><input type="text" style="width: 100%;" name="SHOP_CODE " id="SHOP_CODE" ></td></tr>
			<tr><td>매장명</td><td colspan="2"><input type="text" style="width: 100%;" name="SHOP_NAME "  id="SHOP_NAME " ></td></tr>
			<tr><td rowspan="2">주소</td><td><input type="text" style="width: 100%;" name="SHOP_ADDR_1"  id="SHOP_ADDR_1" placeholder="기본 주소(클릭하세요)" readonly="readonly"></td><td><button type="button" onclick="sample5_execDaumPostcode()">검색</button></td></tr>
			<tr><td colspan="2"><input type="text" style="width: 100%;" name="SHOP_ADDR_2"  id="SHOP_ADDR_2" placeholder="상세 주소"></td></tr>
			<tr><td>대표자명</td><td colspan="2"><input type="text" style="width: 100%;" name="SHOP_REPRE"  id="SHOP_REPRE"  ></td></tr>
			<tr><td>사업자번호</td><td colspan="2"><input type="text" style="width: 100%;" name="SHOP_BRN"  id="SHOP_BRN" ></td></tr>
			<tr><td>매장 전화번호</td><td colspan="2"><input type="text" style="width: 100%;" name="SHOP_PHONE"  id="SHOP_PHONE" ></td></tr>
			<tr><td colspan="3"><input type="submit" style="width: 100%;" value="전송" id="btnsumbit" ></td></tr>
		</table>
	</form>

	 
</div>
<div id="right" style="float: left; margin-left: 80px;">
	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none; float: left"></div><br>
</div>
 	 

</body>
</html>



