<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${not empty sessionScope.did}">
		<c:set var='str'>안녕하세요  ${sessionScope.did } 님!</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">기본 페이지 입니다.</c:set>
	</c:otherwise>
</c:choose>

<!DOCTYPE html>
<html>
<head>

<title>기본페이지</title>
<script src="/js/slide.js"></script>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/slide.css">
</head>
<body>
	<br>
	<section class="section section--visual">
		<div class="inner slideshow-container">
			<div class="picture mySlideDiv fade active"></div>
			<div class="picture2 mySlideDiv fade"></div>
			<div class="picture3 mySlideDiv fade"></div>
			<a class="prev" onclick="prevSlide()">&#10094;</a> <a class="next"
				onclick="nextSlide()">&#10095;</a>
		</div>
		<br>
		<div class="inner" id="map" style="height: 350px;"></div>
	</section>

	<!-- 지도를 표시할 div 입니다 -->


	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e434ef30388bc9bd7f3af763f071ff66"></script>
	<script>
		var container = document.getElementById('map'); // 지도를 표시할 div 
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(container, options);

		
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		
		
		
	</script>



</body>
</html>
