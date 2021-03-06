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
	function dmypage_update() {
		let url = "/dmypage_update";
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
	
	function hairmenuEnroll(){
		let url = "/hairmenuEnroll";
		location.href = url;
	}
	
	function cut(cateno){
		let url = "/hairmenu/" + 1;
		location.href = url;
	}
	function perm(cateno){
		let url = "/hairmenu/" + 2;
		location.href = url;
	}
	function color(cateno){
		let url = "/hairmenu/" + 3;
		location.href = url;
	}
	function clinic(cateno){
		let url = "/hairmenu/" + 4;
		location.href = url;
	}
	function etc(cateno){
		let url = "/hairmenu/" + 5;
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

td button {
	border: 1px solid;
}

a:link {
	color: maroon;
}

a:hover, a:active {
	background-color: yellow;
}
</style>
<title>My page</title>
</head>
<body>
	<div style="width: 100%; height: 100%; display: flex;">
		<div
			style="width: 30%; height: 100%; padding-left: 2%; padding-top: 3%; float: left;">
			<img src="/designer/${ddto.dfilename }"
				style="width: 100%; height: 80%;">
			<div>
				<button class="btn btn-outline-success"
					style="width: 100%; border: 1px solid;">???????????????(${ddto.likecnt })</button>
			</div>
			<div style="font-size: 20px; font-weight: bold; text-align: center;">${ddto.hairshop }</div>
			<div style="font-size: 20px; font-weight: bold; text-align: center;">${ddto.dname }
				?????? ????????????</div>
			<div>${ddto.introduction }</div>
			<div style="float: right">
				<button class="btn btn-outline-success"
					style="border: 1px solid; margin-bottom: 2px;"
					onclick="dmypage_update()">???????????? ?????? ??????</button>
				<button class="btn btn-outline-success" style="border: 1px solid;"
					onclick="dmypage_photo_update()">???????????? ?????? ??????</button>
			</div>
		</div>


		<!-- ????????? ?????? START -->
		<div style="width: 80%; float: right;">

			<div style="padding-top: 3%; padding-bottom: 3%; text-align: center; font-size: 20px; font-weight: bold">
				<ul id="nav2" class="nav justify-content-center">
					<li class="nav-item"><a class="nav-link active" href="/hairmenu">??????</a></li>
					<li class="nav-item"><a class="nav-link" href="#">?????????</a></li>
					<li class="nav-item"><a class="nav-link" href="/review/list">??????</a></li>
				</ul>
			</div>

			<div style="text-align: center; font-size: 15px; font-weight: bold">
				<nav class="nav nav-pills nav-justified"
					style="margin-left: 3%; margin-right: 3%;">
					<a class="nav-link" onclick="cut()">??????&?????????</a>
					<a class="nav-link" onclick="perm()">???</a> <a class="nav-link" onclick="color()">??????</a>
					<a class="nav-link" onclick="clinic()">?????????</a> <a class="nav-link" onclick="etc()">??????</a>
				</nav>
			</div>
			
			
		<section class="vh-100">
			<div class="container py-5 h-150">
				<div class="row d-flex justify-content-center align-items-center">
					<div class="col col-lg-9 col-xl-12">
						<div class="card rounded-3">
							<div class="card-body p-4">


								<table class="table mb-4">
									<thead>
										<tr style="font-weight: bold">
											<th scope="col">No.</th>
											<th scope="col">??????</th>
											<th scope="col">??????</th>
										</tr>
									</thead>
									<tbody>
									<c:choose>
										<c:when test="${empty list}">
											<tr>
												<td colspan="6">????????? ????????? ????????????.</td>
											</tr>
										</c:when>
		
										<c:otherwise>
											<c:forEach var="dto" items="${list}">
												<tr>
													<th scope="row">${dto.menuno }</th>
													<td>${dto.menu }</td>
													<td>${dto.price }</td>
													<td><button class="btn btn-outline-success">??????</button></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div style="float: right;">
				<button class="btn btn-outline-success" onclick="hairmenuEnroll()">?????? ??????</button>
			</div>
		</section>

	</div>

	<div style="width: 20%; float: right;"></div>
	</div>
	<!-- ??? ?????? div -->
</body>
</html>