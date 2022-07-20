<%@page import="com.study.enroll.EnrollDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약리스트</title>
<link rel="stylesheet" href="/css/enrollList.css" />
</head>
<body>
<div class="container">

<h3>${sessionScope.did} 예약 리스트</h3>
<input type="hidden" id="hidden" value="${sessionScope.did}"/>
	<table>
		<thead>
			<tr>
				<th>예약날짜</th>
				<th>예약시간</th>
				<th>시술이름</th>
				<th>성별</th>
				<th>가격</th>
				<th>예약삭제</th>
			</tr>
			
		</thead>
		<c:choose>
			<c:when test="${empty list}">
				<tbody>
					<td colspan="5">등록된 예약이없습니다.</td>
				</tbody>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list}">
					<c:forEach var="innerdto" items="${dto.hairmenu}">
						<tbody id="tbody">
							<tr id="tr">
								<td>${dto.enrolldate}</td>
								<td>${dto.enrolltime}</td>
								<td>${dto.emenu}</td>
								<td>${innerdto.hgender}</td>
								<td>${dto.eprice}</td>
								<td><button id="deletebtn" value="${dto.enrollno}">삭제</button></td>
							<tr>
						</tbody>
					</c:forEach>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<script src="/js/enrollList.js"></script>
</body>
</html>