<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
h2 {
	padding: 0 0 20px;
	font-size: 32px;
	color: #111;
	border-bottom: 2px solid #111;
	text-align: left;
	line-height: 1;
}

h3 {
	padding-bottom: 10px;
}

table {
	width: 90%;
	border-top: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid black;
	padding: 10px;
	text-align: center;
}
</style>
<script>
	function updateInfo() {
		let url = "/user/update";
		url += "?uid=${dto.uid}";
		location.href = url;
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h2>My Page</h2>
			<div class="col-sm-4" style="float: left;">
				<h3>내 정보</h3>
				<div style="padding-bottom: 10px;">
					<img align="left" src="/svg/person-circle.svg" />
					<p>&nbsp;${uid} 님</p>
					<img align="left" src="/svg/envelope.svg" />
					<p>&nbsp; ${dto.uemail}</p>
					<img align="left" src="/svg/phone.svg" />
					<p>&nbsp; ${dto.uphone}</p>
				</div>
				<button type="button" class="btn" onclick="javascript:updateInfo()">정보
					수정</button>
				<button type="button" class="btn" onclick="location.href='#'">비밀번호
					수정</button>
				<button type="button" class="btn" onclick="location.href='#'">회원
					탈퇴</button>
			</div>
			<div class="col-sm-8" style="float: right;">
				<div class="list1">
					<h3>예약신청 전체내역</h3>
					<table>
						<thead>
							<tr>
								<th>미용실</th>
								<th>디자이너</th>
								<th>날짜</th>
								<th>시간</th>
								<th>시술명</th>
								<th>시술가격</th>
							</tr>
						</thead>
						
						
			<c:choose>
				<c:when test="${empty reserveList}">
					<tbody>
						<td colspan="6">등록된 예약이없습니다.</td>
					</tbody>
				</c:when>
				<c:otherwise>
						<tbody>
							<c:forEach var="dto" items="${reserveList}">
								<c:forEach var="innerdto" items="${dto.designerInfo}">
									<tr>
										<td>${innerdto.hairshop}</td>
										<td>${innerdto.dname}</td>
										<td>${dto.enrolldate}</td>
										<td>${dto.enrolltime}</td>
										<td>${dto.emenu}</td>
										<td>${dto.eprice}</td>
									</tr>
								</c:forEach>
							</c:forEach>
						</tbody>
				</c:otherwise>
			</c:choose>
					</table>
				</div>
				
				<div class="list1">
					<h3>오늘예약 내역</h3>
					<table>
						<thead>
							<tr>
								<th>미용실</th>
								<th>디자이너</th>
								<th>날짜</th>
								<th>시간</th>
								<th>시술명</th>
								<th>시술가격</th>
							</tr>
						</thead>
						
						
			<c:choose>
				<c:when test="${empty reserveList}">
					<tbody>
						<td colspan="6">등록된 예약이없습니다.</td>
					</tbody>
				</c:when>
				<c:otherwise>
						<tbody>
							<c:forEach var="dto" items="${todayList}">
								<c:forEach var="innerdto" items="${dto.designerInfo}">
									<tr>
										<td>${innerdto.hairshop}</td>
										<td>${innerdto.dname}</td>
										<td>${dto.enrolldate}</td>
										<td>${dto.enrolltime}</td>
										<td>${dto.emenu}</td>
										<td>${dto.eprice}</td>
									</tr>
								</c:forEach>
							</c:forEach>
						</tbody>
				</c:otherwise>
			</c:choose>
					</table>
				</div>

			</div>
		</div>
	</div>
	</div>
</body>
</html>