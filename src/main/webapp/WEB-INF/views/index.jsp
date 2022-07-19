<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${not empty sessionScope.did}">
		<c:set var='str'>안녕하세요  ${sessionScope.did } 님!</c:set>
	</c:when>
	<c:when test="${not empty sessionScope.uid && sessionScope.grade == 'A'}">
        <c:set var="str">안녕하세요 관리자님!</c:set>
    </c:when>
	<c:when test="${not empty sessionScope.uid && sessionScope.grade != 'A'}">
        <c:set var='str'>안녕하세요  ${sessionScope.uid} 님!</c:set>
    </c:when>
	<c:otherwise>
		<c:set var="str">기본 페이지 입니다.</c:set>
	</c:otherwise>
</c:choose>

<!DOCTYPE html>
<html>
<head>
<title>기본페이지</title>
<meta charset="utf-8">
<style type="text/css">
img {
	display: inline;
}
</style>
</head>
<body>
	<div class="container">

		<p>
			<a href="/contents/mainlist/1">SHOP NOW</a>
		</p>
		<img src="/images/tree.jpg" alt="Tree"> 

	</div>
</body>
</html>