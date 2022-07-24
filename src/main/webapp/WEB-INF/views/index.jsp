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
			<a class="prev" onclick="prevSlide()">&#10094;</a>
    		<a class="next" onclick="nextSlide()">&#10095;</a>
			
		</div>
	</section>
</body>
</html>