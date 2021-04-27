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
<!-- 이미지 지도를 표시할 div 입니다 -->
<div id="staticMap" style="width:600px;height:350px;"></div>    

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8311d2f57be07e77e4629db29cc0d7c8"></script>
<script>    
// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
var markers = [
    {
        position: new kakao.maps.LatLng(37.49798415316674, 127.0276581503563)
    },
    {
        position: new kakao.maps.LatLng(37.49798415316674, 127.0276581503563), 
        text: '○○식당입니다!' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
    }
];

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(37.49798415316674, 127.0276581503563), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: markers // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script>
</body>
</html>