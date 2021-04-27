<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
  <title>location</title>

	<style type="text/css">

		#menubar div{
								width:90px; padding:10px 5px;
								float:left; text-align:center; 
								font-size:13px; font-weight:bold;  
								background:#999;
								}
								
		#menubar div:hover{
			background:#555; color:#fff;
		}
	</style>
 </head>

 <body>
<div style="height:30px;"></div>
<div id="menubar">
	<div><a href="ceointro.jsp">ceo인사말</a></div>
	<div><a href="location.jsp">오시는길</a></div> <br />
</div>
 </body>
</html>

<h1><strong>찾아오시는 길</strong></h1>
<html>
<head>
    <meta charset="utf-8">
    <title>카카오 지도</title>
    
</head>
<body>
<div id="map" style="width:600px;height:350px;"></div>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8311d2f57be07e77e4629db29cc0d7c8"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.49798415316674, 127.0276581503563), // 지도의 중심좌표
		        level: 4, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 	

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(37.49798415316674, 127.0276581503563), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});

		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new kakao.maps.InfoWindow({
		    content : '<div style="padding:5px;">○○식당입니다~^^</div>' // 인포윈도우에 표시할 내용
		});

		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker);
		
		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
		kakao.maps.event.addListener(marker, 'click', function() {
			location.href = 'https://map.kakao.com';
		});	
</script>
</body>
</html>