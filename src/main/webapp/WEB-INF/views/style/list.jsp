<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:choose>
	<c:when test="${empty list}">
		<p>등록된 이미지가 없습니다.</p>
	</c:when>
	<c:otherwise>
		<c:forEach var="dto" items="${list}">
		<p>${dto.imagetype}</p>
		<p>${dto.gender}</p>
		<p>${dto.imagecode}</p>
		<p>${dto.did}</p>
		</c:forEach>
	</c:otherwise>
</c:choose>

</body>
</html>