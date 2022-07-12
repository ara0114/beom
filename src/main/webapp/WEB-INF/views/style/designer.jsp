<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>style Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<link rel="stylesheet" href="/css/styleUpload.css">
</head>
<body>
	<div class="container">
		<div class="upload-box">
			<h3>Upload your File</h3>
			<div class="drag-area">
				<div class="icon">
					<i class="fas fa-images"> </i>
				</div>
				<span class="header">Drag & Drop</span>
				<p>or</p>
				<span class="support">Supports:JPEG,JPG,PNG</span>
				
			</div>
				<form action="/style/designer" method="post" enctype="multipart/form-data" >
					<input type="file" name="file" id="input-file">
					<input type="radio" name="gender" value="woman"/>여자
					<input type="radio" name="gender" value="man"/>남자
					<input type="text" name="did" value="designer1" hidden>
					<button>UP LOAD <i class="fa-solid fa-cloud-arrow-up"></i></button>
				</form>

		</div>
					
		<div class="img-box">
			<h3>your styles</h3>
			<div class="img-area"></div>
		</div>
	</div>
	<div>
	

	<script src="/js/styleUpload.js"></script>
</body>
</html>