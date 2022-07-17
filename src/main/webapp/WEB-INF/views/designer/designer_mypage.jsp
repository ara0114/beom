<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	function dmypage_update() {
		let url = "/dmypage_update";
		location.href = url;
	}
	
	function dmypage_photo_update() {
		let url = "/dupdateFileForm";
		location.href = url;
	}
	
	function dmypage_intro_update(){
		let url = "/dmypage_intro_update";
		location.href = url;
	}
</script>
<style>
label {
	font-size: 150%;
}

button {
	border: 1px solid;
	float: right;
}
td button{
	border : 1px solid;
}
</style>
<title>My page</title>
</head>
<body>
	<div style="width: 100%; height: 100%; display: flex;">
		<div
			style="width: 30%; height: 100%; padding-left: 2%; padding-top: 3%; float: left;">
			<img src="/images/designer.jpg" alt=""
				style="width: 100%; height: 80%;">
			<div>
				<button class="btn btn-outline-success"
					style="width: 100%; border: 1px solid;">❤️좋아요(${ddto.likecnt })</button>
			</div>
			<div style="font-size: 20px; font-weight: bold;">${ddto.dname } 헤어 디자이너</div>
			<div>${ddto.introduction }</div>
			<div style="float: right">
				<button class="btn btn-outline-success" style="border: 1px solid; margin-bottom : 2px;"
					onclick="dmypage_update()">디자이너 정보 수정</button>
					<button class="btn btn-outline-success" style="border: 1px solid;"
					onclick="dmypage_photo_update()">디자이너 사진 수정</button>
			</div>
		</div>


		

		<div style="width: 80%; float: right;">

			<div style="height: 6%;"></div>

			<div class="container">

				<div>
					<label style="font-weight: 700;">디자이너 소개</label>
					<p style="font-size: large; color: cadetblue">${ddto.introduction }</p>
					<div style = "height : 50px;">
					<c:choose>
						<c:when test="${ddto.introduction == '' || empty ddto.introduction }">
							<button class="btn btn-outline-success" style="border: 1px solid" onclick = "dmypage_intro_update()">등록</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-outline-success" style="border: 1px solid" onclick = "dmypage_intro_update()">수정</button>
						</c:otherwise>
					</c:choose>
					</div>
				</div>

				<div>
					<label>예약 등록 시간</label>
					<table class="table">
						<thead class="thead-dark">
							<tr>

								
								<th scope="col">예약 날짜</th>
								<th scope="col">예약 시간</th>
								<th scope="col">시술명</th>
								<th scope="col">성별</th>
								<th scope="col">가격</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<tr>

								<td>2022.07.06</td>
								<td>15:51</td>
								<td>일반컷</td>
								<td>남자</td>
								<td>20000</td>
								<td><button class="btn btn-outline-success">삭제</button></td>
							</tr>
							<tr>

								<td>2022.07.06</td>
								<td>16:30</td>
								<td>일반컷</td>
								<td>여자</td>
								<td>20000</td>
								<td><button class="btn btn-outline-success">삭제</button></td>
							</tr>
							<tr>

								<td>2022.07.06</td>
								<td>17:51</td>
								<td>디자인 펌</td>
								<td>남자</td>
								<td>100000</td>
								<td><button class="btn btn-outline-success">삭제</button></td>

							</tr>
							<tr>

								<td>2022.07.06</td>
								<td>18:51</td>
								<td>디자인 펌</td>
								<td>여자</td>
								<td>150000</td>
								<td><button class="btn btn-outline-success">삭제</button></td>
							</tr>
						</tbody>
					</table>
					<div style="height: 50px;">
						<button class="btn btn-outline-success">예약 등록</button>
					</div>
				</div>


				<div>
					<label>예약 신청 내역</label>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">#</th>
								<th scope="col">First</th>
								<th scope="col">Last</th>
								<th scope="col">Handle</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
								<td><button class="btn btn-outline-success">확인</button>
									<button class="btn btn-outline-success">삭제</button></td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>@fat</td>
								<td><button class="btn btn-outline-success">확인</button>
									<button class="btn btn-outline-success">삭제</button></td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry</td>
								<td>the Bird</td>
								<td>@twitter</td>
								<td><button class="btn btn-outline-success">삭제</button></td>
							</tr>
						</tbody>
					</table>

				</div>

			</div>




		</div>

		<div style="width: 20%; float: right;"></div>
	</div>
</body>
</html>