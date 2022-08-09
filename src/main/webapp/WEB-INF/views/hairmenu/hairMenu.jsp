<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
function dmypage_update(did) {
    let url = "/dmypage_update";
    url += "?did=";
    url += did;
    location.href = url;
}

	function dmypage_photo_update() {
		let url = "/designer/dupdateFileForm/";
		location.href = url;
	}

	function dmypage_intro_update() {
		let url = "/dmypage_intro_update";
		location.href = url;
	}
	function delete_enroll(enrollno){
		let url = "/designer/deleteEnroll/" + enrollno;
		location.href = url;
	}
	function enroll(){
		let url = "/enroll/designer";
		location.href = url;
	}
	function reserve(){
		let url = "/reserve";
		url += "?did=${ddto.did}";
		location.href = url;
	}
	//function modal(){
	//	$("#staticBackdrop").modal("show");
	//}
	
	function get(rnum) {
	    return fetch(`/reserve/${rnum}`,{method: 'get'})
	           .then(response => response.json())
	           .catch(console.log);
	}
	
	let modalInputContent = $(".modal").find("p[id='message']");
	
	$("#reserve_modal").on("click", function (e) {
		 
		  let rnum = $(this).data("rnum");
		 
		   get(rnum)
		    .then(reserve => {
		      
		      modalInputContent.val(reserve.message);
			  $(".modal").modal("show");
		 
		    });
		});
	
	function hairmenuEnroll(){  //헤어메뉴 등록하는 페이지로 이동
		let url = "/hairmenuEnroll";
		location.href = url;
	}
	function hairmenu(){  //헤어메뉴 등록하는 페이지로 이동
		let url = "/hairmenu";
		location.href = url;
	}
	
	function cut(){
		let url = "/hairmenu/cateno/"+ 1;
		location.href = url;
	}
	function perm(){
		let url = "/hairmenu/cateno/" + 2;
		location.href = url;
	}
	function color(){
		let url = "/hairmenu/cateno/" + 3;
		location.href = url;
	}
	function clinic(){
		let url = "/hairmenu/cateno/" + 4;
		location.href = url;
	}
	function etc(){
		let url = "/hairmenu/cateno/" + 5;
		location.href = url;
	}
	
	function del(menuno){
		if(confirm("정말 삭제하시겠습니까?")==true){
			
		//console.log(menuno);
		let url = "/hairmenu/delete/" + menuno ;
		location.href = url;
		
		} else {
			return;
		}
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

td button {
	border: 1px solid;
}

a:link {
	color: maroon;
	border-radius:5px;
}

a:hover, a:active {
	background-color: #87CEFA;
}
</style>
<title>My page</title>
</head>
<body>
	<div style="width: 100%; height: 100%; display: flex;">
		<div style="width: 30%; height: 100%; padding-left: 2%; padding-top: 3%; float: left;">
			<img src="/designer/${ddto.dfilename }"
				style="width: 100%; height: 80%;">
			<div>
				<button class="btn btn-outline-success"
					style="width: 100%; border: 1px solid;">❤️좋아요(${ddto.likecnt })</button>
				<c:if test="${not empty sessionScope.uid}">
					<button type=button onclick="javascript:reserve('${ddto.did}')" class = "btn btn-outline-success" style="width: 50%; border: 1px solid;">예약하기</button>
	                <button class = "btn btn-outline-success" style="width: 50%; border: 1px solid;">1:1 문의</button>
                </c:if>
			</div>
			<div style="font-size: 20px; font-weight: bold; text-align: center;">${ddto.hairshop }</div>
			<div style="font-size: 20px; font-weight: bold; text-align: center;">${ddto.dname } 헤어 디자이너</div>
			<div>${ddto.introduction }</div>
			<div style="float: right">
			<c:if test="${not empty sessionScope.did}">
				<button class="btn btn-outline-success"
					style="border: 1px solid; margin-bottom: 2px;"
					onclick="dmypage_update('${ddto.did}')">디자이너 정보 수정</button>
				<button class="btn btn-outline-success" style="border: 1px solid;"
					onclick="dmypage_photo_update()">디자이너 사진 수정</button>
			</c:if>
			</div>
		</div>


		<!-- 오른쪽 구역 START -->
		<div style="width: 80%; float: right;">

			<div style="padding-top: 3%; padding-bottom: 3%; text-align: center;
			 font-size: 20px; font-weight: bold; margin-left : 6%;">
				<ul id="nav2" class="nav justify-content-center">
					<li class="nav-item"><a class="nav-link active" href="/hairmenu">메뉴</a></li>
					<li class="nav-item"><a class="nav-link" href="/style/designer">스타일</a></li>
					<li class="nav-item"><a class="nav-link" href="/review/list">리뷰</a></li>
				</ul>
			</div>


			<div style="text-align: center; font-size: 15px; font-weight: bold">
				<div>
					<nav class="nav nav-pills nav-justified" style="margin-left: 33%; margin-right: 20%; font-size:17px; width:80%">
						<a class="nav-link" onclick="hairmenu()">전체메뉴</a>
						<a class="nav-link" onclick="cut()">커트&드라이</a>
						<a class="nav-link" onclick="perm()">펌</a> <a class="nav-link" onclick="color()">염색</a>
						<a class="nav-link" onclick="clinic()">클리닉</a> <a class="nav-link" onclick="etc()">기타</a>
					</nav>
				</div>
			</div> <!-- 스타일 div -->

			
		<section class="vh-100">
			<div class="container py-5 h-150" style="margin-left: 5%">
				<div class="row d-flex justify-content-center align-items-center">
					<div class="col col-lg-9 col-xl-12">
						<div class="card rounded-3">
							<div class="card-body p-4">


								<table class="table mb-4">
									<thead>
										<tr style="font-weight: bold">
											<th scope="col">시술</th>
											<th scope="col">가격</th>
											<th scope="col">성별</th>
											<th scope="col">디자이너</th>
										</tr>
									</thead>
									<tbody>
									<c:choose>
										<c:when test="${empty list}">
											<tr>
												<td colspan="6">등록된 메뉴가 없습니다.</td>
											</tr>
										</c:when>
		
										<c:otherwise>
											<c:forEach var="dto" items="${list}">
												<tr>
													<td>${dto.menu }</td>
													<td>${dto.price }</td>
													<td>${dto.hgender }</td>
													<td>${dto.did }</td>
													<c:if test="${not empty sessionScope.did}">
													<td><button class="btn btn-outline-success"
													onclick="del(${dto.menuno})">삭제</button></td>
													</c:if>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									</tbody>
								</table>

							</div>
						</div>
						<c:if test="${not empty sessionScope.did}">
							<div style="float: right;">
								<button class="btn btn-outline-success" onclick="hairmenuEnroll()" style="border: 1px solid">메뉴 등록</button>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</section>

	</div> <!-- 오른쪽 구역 div -->
	<div style="width: 20%; float: right;"></div>
	</div> <!-- 맨 윗줄 div -->
</body>
</html>