<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API TEST5"></c:set>

<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>지도 이동시키기</title>

</head>
<body>
	<div id="map" style="width: 100%; height: 800px;"></div>
	<p>
		<button onclick="setCenter()">지도 중심좌표 이동시키기</button>
		<button onclick="panTo()">대전광역시 유성구청 주차장으로 이동시키기</button>
		<button onclick="setOverlayMapTypeId('traffic')">교통정보 보기</button>
		<button onclick="setOverlayMapTypeId('roadview')">로드뷰 도로정보 보기</button>
		<button onclick="setOverlayMapTypeId('terrain')">지형정보 보기</button>
		<button onclick="setOverlayMapTypeId('use_district')">지적편집도 보기</button>
	</p>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	4d58ba447ad884369bfffee6e0c34649"></script>
	<script>
		var lat;
		var lon;
		// 		주차장
		async function getData2() {
			const API_KEY = 'ZgjRhTc3BeH1LoIIoEyv09%2BR33S0zgewRwrkShmFTR1WUUJheNxlSVnmECtQg2vSZGHsIfElEms2r6ngi%2FKi0w%3D%3D';
			const url = 'https://www.yuseong.go.kr/ys_parking/ysparkingList/ORP/getJSONData.do?_wadl&type=json';
			const response = await fetch(url);
			const data = await response.json();

			console.log("data", data);
			console.log(data.response);
			console.log(data.response.body);
			console.log(data.response.header);
			console.log(data.response.body.items);
			console.log(data.response.body.items[10]);
			console.log(data.response.body.items[10].item.addr);
			console.log(data.response.body.items[10].item.latitude);
			console.log(data.response.body.items[10].item.longitude);

			lat = data.response.body.items[10].item.latitude;
			lon = data.response.body.items[10].item.longitude;
		}

		getData2();

	

		function setCenter() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);

			// 지도 중심을 이동 시킵니다
			map.setCenter(moveLatLon);
		}

		function panTo() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(lat, lon);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}

		// 지도 타입 바꾸기 
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도에 추가된 지도타입정보를 가지고 있을 변수입니다
		var currentTypeId;

		// 버튼이 클릭되면 호출되는 함수입니다
		function setOverlayMapTypeId(maptype) {
			var changeMaptype;

			// maptype에 따라 지도에 추가할 지도타입을 결정합니다
			if (maptype == 'traffic') {

				// 교통정보 지도타입
				changeMaptype = kakao.maps.MapTypeId.TRAFFIC;
				
				

			} else if (maptype === 'roadview') {

				// 로드뷰 도로정보 지도타입
				changeMaptype = kakao.maps.MapTypeId.ROADVIEW;

			} else if (maptype === 'terrain') {

				// 지형정보 지도타입
				changeMaptype = kakao.maps.MapTypeId.TERRAIN;

			} else if (maptype === 'use_district') {

				// 지적편집도 지도타입
				changeMaptype = kakao.maps.MapTypeId.USE_DISTRICT;
			}

			// 이미 등록된 지도 타입이 있으면 제거합니다
			if (currentTypeId) {
				map.removeOverlayMapTypeId(currentTypeId);
			}

			// maptype에 해당하는 지도타입을 지도에 추가합니다
			map.addOverlayMapTypeId(changeMaptype);

			// 지도에 추가된 타입정보를 갱신합니다
			currentTypeId = changeMaptype;
		}
		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(33.452613, 126.570888); 
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 마커가 드래그 가능하도록 설정합니다 
		marker.setDraggable(true); 
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
	</script>
</body>
</html>

<%@ include file="../common/foot.jspf"%>