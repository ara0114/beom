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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<link rel="stylesheet" href="/css/styleUpload.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="/js/designer_mypage.js"></script>


<style>
button {
	border: 1px solid;
	float: right;
}
</style>
<title>My page</title>
</head>
<body>
	<div style="width: 100%; height: 100%; display: flex;">
		<div
			style="width: 18%; height: 100%; padding-left: 2%; padding-top: 3%; float: left;">
			<div style="width: 100%; height: 100%;">
				<img src="/designer/${ddto.dfilename }"
					style="width: 100%; height: 80%;">
			</div>
			<div>
				<button class="btn btn-outline-success"
					style="width: 100%; border: 1px solid;">❤️좋아요(${ddto.likecnt })</button>
			</div>
			<div style="font-size: 20px; font-weight: bold; text-align: center;">${ddto.hairshop }</div>
			<div style="font-size: 20px; font-weight: bold; text-align: center;">${ddto.dname }
				헤어 디자이너</div>
			<div>${ddto.introduction }</div>
			<div style="float: right">
				<button class="btn btn-outline-success"
					style="border: 1px solid; margin-bottom: 2px;"
					onclick="dmypage_update()">디자이너 정보 수정</button>
				<button class="btn btn-outline-success" style="border: 1px solid;"
					onclick="dmypage_photo_update()">디자이너 사진 수정</button>
			</div>
		</div>




		<div style="width: 80%; float: right;">
			<div
				style="padding-top: 3%; padding-bottom: 3%; text-align: center; font-size: 20px; font-weight: bold">
				<ul id="nav2" class="nav justify-content-center">
					<li class="nav-item"><a class="nav-link active"
						href="/hairmenu">메뉴</a></li>
					<li class="nav-item"><a class="nav-link" href="/style/designer">스타일</a></li>
					<li class="nav-item"><a class="nav-link" href="/review/list">리뷰</a>
					</li>
				</ul>
			</div>

			<div class="container" style="margin-left: 5%;">
				<div class="upload-box">
					<h3>Upload File</h3>
					<div class="filearea">
						<div class="icon">
							<i class="fas fa-images"> </i>
						</div>
						<span class="header">Click Me</span> <span class="support">Supports:JPEG,JPG,PNG</span>

					</div>
					<form action="/style/designer" method="post"
						enctype="multipart/form-data" onsubmit="return formCheck()">
						<input type="file" name="file" id="input-file">
						<div class="form-radio">
							<label for="iwoman" class="ilabel"> <input type="radio"
								name="uploadgender" value="FEMALE" id="iwoman" />여자
							</label> <label for="iman" class="ilabel"> <input type="radio"
								name="uploadgender" value="MALE" id="iman" />남자
							</label>
						</div>

						<button>
							UP LOAD <i class="fa-solid fa-cloud-arrow-up"></i>
						</button>
					</form>

				</div>

				<div class="img-box">
					<h3>스타일</h3>
					<div class="radio-box">
						<label for="all" class="select-btn"><input type="radio"
							value="all" name="gender" id="all" />전체 사진 </label> <label for="woman"
							class="select-btn"><input type="radio" value="FEMALE"
							name="gender" id="woman" />여성 사진모음</label> <label for="man"
							class="select-btn"><input type="radio" value="MALE"
							name="gender" id="man" />남성 사진모음</label>
					</div>
					<div class="img-area">
						<div class="all-img" id="styleBox"></div>
						<div class="woman-img" id="styleBox"></div>
						<div class="man-img" id="styleBox"></div>

					</div>
					<button class="add-btn">더보기</button>
				</div>
			</div>




		</div>

		<div style="width: 20%; float: right;"></div>
	</div>

	

	<script src="/js/styleUpload.js"></script>
</body>
</html>