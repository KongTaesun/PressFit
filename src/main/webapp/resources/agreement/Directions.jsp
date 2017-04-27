<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

	<%@ include file="/resources/include/header.jsp"%>



	<!-- Map Area Start -->
	<div class="map-area">
		<div id="map" style="width: 100%; height: 445px;"></div>
		
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cb3e3b4c8ce2e2d998fa2b1534a6b543"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new daum.maps.LatLng(37.4946571, 127.0276173), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
	
			var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new daum.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
			
			// 지도 확대축소 막기
			map.setZoomable(false);
			// 지도 이동 막기
			map.setDraggable(false); 
			
			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			
			function panTo() {
			    // 이동할 위도 경도 위치를 생성합니다 
			    var moveLatLon = new daum.maps.LatLng(37.4946571, 127.0276173);
			    
			    // 지도 중심을 부드럽게 이동시킵니다
			    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			    map.panTo(moveLatLon);            
			} 
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new daum.maps.LatLng(37.4946571, 127.0276173); 

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);
			
			
		</script>
	</div>
	<!-- Map Area End -->
	<!-- Address Information Area Start -->
	<div class="address-info-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-4 hidden-sm">
					<div class="address-single">
						<div class="all-adress-info">
							<div class="icon">
								<span><i class="fa fa-user-plus"></i></span>
							</div>
							<div class="info">
								<h3>PHONE</h3>
								<p>010-7106-5135</p>
								<p>010-9927-8895</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6" onclick="panTo()">
					<div class="address-single">
						<div class="all-adress-info">
							<div class="icon">
								<span><i class="fa fa-map-marker"></i></span>
							</div>
							<div class="info" >
								<h3>ADDRESS</h3>
								<p>서울 서초구 서초대로</p>
								<p>74길 33 비트빌3층</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6" onclick="location.href='${path}'";>
					<div class="address-single no-margin">
						<div class="all-adress-info">
							<div class="icon">
								<i class="fa fa-envelope"></i>
							</div>
							<div class="info">
								<h3>E-MAIL</h3>
								<p>pressfit@gpressfit.com</p>
								<p>http://localhost:8080/pressfit</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Address Information Area End -->
	


	<%@ include file="/resources/include/footer.jsp" %>
</body>
</html>