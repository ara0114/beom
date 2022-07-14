<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://kit.fontawesome.com/320c5e3232.js"
	crossorigin="anonymous"></script>
<title>고객리뷰_간단하게</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/reviewStyle.css">
</head>
<body>
	<div class="container">
		<div class="title">
			<h2>고객님들의 리뷰</h2>
			<hr class="hr1">
		</div>
		<!-- 리뷰 포토 사진 -->
		<div class="hair-review-img">
			<div class="head-row">
				<div class="">
					<img src="image/1.png" class="rounded"> 
					<img src="image/2.jpeg" class="rounded"> 
					<img src="image/3.jpg" class="rounded">
				</div>
			</div>
			<div class="view-more">
				<a href="#"><i class="fa-solid fa-circle-plus"></i>더보기</a>
			</div>
		</div>
		<!--hair-review-img-->
		<hr>

		<!-- 댓글단거 보이는 부분 -->
		<div class="review-contents">
			<div class="sub-row">
				<div class="review-pic"></div>
				<div class="customer-review">
					<div class="star">
						<i class="fa-solid fa-star"></i> 
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i> 
						<i class="fa-solid fa-star"></i>
					</div>
					<h3>첫 방문입니다.</h3>
					<a href="#">
						<p>안녕하세요~</p>
					</a>
				</div>
			</div>
			<!-- sub-row end -->
			<hr>
			<div class="sub-row">
				<div class="review-pic">
					<img src="image/1.png">
				</div>
				<div class="customer-review">
					<div class="star">
						<i class="fa-solid fa-star"></i> 
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i> 
						<i class="fa-solid fa-star"></i>
					</div>
					<h3>유아인머리 했어요</h3>
					<a href="#">
						<p>오늘 OOO 디자이너 선생님께 시술받았는데 너무 좋았습니다!</p>
					</a>
				</div>
			</div>
			<!-- sub-row end -->
			<hr>
			<div class="sub-row">
				<div class="review-pic">
					<img src="image/2.jpeg">
				</div>
				<div class="customer-review">
					<div class="star">
						<i class="fa-solid fa-star"></i> 
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i> 
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
					</div>
					<h3>수지머리 했어요</h3>
					<a href="#">
						<p>오늘 OOO 디자이너 선생님께 시술받았는데 너무 좋았습니다!</p>
					</a>
				</div>
			</div><!-- sub-row end -->
			<hr>
		</div>
	</div>
	</div>
	<!-- review-contents -->
	</div>
	<!--div container-->
</body>
</html>