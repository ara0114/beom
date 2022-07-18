<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 예약페이지</title>
<link rel="stylesheet prefetch"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="/css/reservationD.css">
</head>
<body>
	<div class="container">
			<form>
				<!-- 진행율 -->
				<div id="progress">
					<div class="pct">
						 예약등록 <span>0</span>%
					</div>
				</div>
				<div id="designer">
				<h1 id="did">${list[0].did}</h1> 
				<span>님 예약등록</span>
				</div>

				<div class="ui-widget">
					<label for="category">시술 선택</label> <select id="category"
						name="category">
						<option>시술 선택</option>
						<c:forEach var="clist" items="${cateNameList}">
						<option value="${clist.catename}"> ${clist.catename}</option>
						</c:forEach>
					</select>
				</div>


				<div class="ui-widget">
					<label for="gender">성별 선택</label> 
					<select id="gender" name="gender">
						<option>성별 선택</option>
						<option value="여자">여성</option>
						<option value="남자">남성</option>
					</select>
				</div>
				<div id="service_price">
					<h4>시술 가격</h4>
				</div>
				
				<div class="ui-widget">
					<select id="price" name="price">
						<option>시술 선택</option>
					</select>
				</div>
				
	<div class="ui-widget">
		<label for="time" id="time_label">예약시간</label> 
		<input type="time"	autocomplete="off" id="time" name="time">
	</div>
	<div class="ui-widget">
		<label for="startDate">예약날짜 선택</label> 
		<input type="text"	autocomplete="off" id="startDate" class="ui-corner-all ui-button">
	</div>
	<fieldset>
		<legend>대기시간 메시지</legend>
		<label for="5">5분미만</label> <input type="radio" id="5" name="rd">
		<label for="10">10분미만</label> <input type="radio" id="10" name="rd">
		<label for="0">바로가능합니다.</label> <input type="radio" id="0" name="rd">
	</fieldset>
	<button type="button"id="submit">예약등록</button>
	<button id="goback" onclick="javascript:history.back()"
		class="ui-button ui-corner-all ui-widget">뒤로가기</button>
	</form>
	</div>




	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
	<script src="/js/reservationD.js"></script>
</body>
</html>