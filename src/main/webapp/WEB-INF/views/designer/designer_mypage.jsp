<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function dmypage_update() {
		let url = "/dmypage_update";
		location.href = url;
	}
</script>
<style>
	button {
		border : 1px solid;
	}
</style>
<title>My page</title>
</head>
<body>
	<div style="width: 100%; height: 100%; display: flex;">
		<div
			style="width: 50%; height: 100%; padding-left: 2%; padding-top: 3%; float: left;">
			<img src="/images/designer.jpg" alt=""
				style="width: 100%; height: 80%;">
			<div>
				<button class="btn btn-outline-success"
					style="width: 100%; border: 1px solid;">❤️좋아요(195)</button>
				<button class="btn btn-outline-success"
					style="width: 48%; border: 1px solid;">예약하기</button>
				<button class="btn btn-outline-success"
					style="width: 48%; border: 1px solid;">1:1 문의</button>
			</div>
			<div style="font-size: 20px; font-weight: bold;">홍길동 헤어 디자이너</div>
			<div>미용사(일반) 자격증 보유 -레이어드컷 / 단발 레이어드컷 / 태슬컷 -레이어드컷 / 단발 레이어드컷 /
				태슬컷</div>
			<div style="float: right">
				<button class="btn btn-outline-success" style="border: 1px solid;"
					onclick="dmypage_update()">디자이너 정보 수정</button>
			</div>
		</div>

		<div style="width: 80%; float: right;">

			<div style="height: 6%;"></div>

			<div class="container">


				<section class="vh-100">
					<div class="container py-5 h-150">
						<div style = "margin-left : 9%; margin-right : 20%;">
							<label style="font-weight: 700;">자기소개</label>
							<p style="font-size: large; color: cadetblue">미용사(일반) 자격증 보유
								-레이어드컷 / 단발 레이어드컷 / 태슬컷 -레이어드컷 / 단발 레이어드컷 / 태슬컷</p>
							
							<button class="btn btn-outline-success" style = "border : 1px solid">수정</button>
							
						</div>
						<div
							class="row d-flex justify-content-center align-items-center h-100">
							<div class="col col-lg-10 col-xl-9">
								<p style="font-weight: 700;">예약 등록 시간</p>
								<div class="card rounded-3">
									<div class="card-body p-1">

										<table class="table mb-4">
											<thead>
												<tr>
													<th scope="col">No.</th>
													<th scope="col">시간</th>
													<th scope="col">시술 종류</th>
													<th scope="col">가격</th>

												</tr>
											</thead>
											<tbody>

												<tr>
													<th scope="row">1</th>
													<td>2022.07.06 15:51</td>
													<td>컷</td>
													<td>20000</td>

													<td><button class="btn btn-outline-success">수정</button>
														<button class="btn btn-outline-success">삭제</button></td>
												</tr>

												<tr>
													<th scope="row">2</th>
													<td>2022.07.06 15:51</td>
													<td>남성 컷, 여성 컷</td>
													<td>20000,30000</td>

													<td><button class="btn btn-outline-success">수정</button>
														<button class="btn btn-outline-success">삭제</button></td>

												</tr>
												<tr>
													<th scope="row">3</th>
													<td>2022.07.06 15:51</td>
													<td>남성 펌</td>
													<td>50000</td>

													<td><button class="btn btn-outline-success">수정</button>
														<button class="btn btn-outline-success">삭제</button></td>

												</tr>
												<tr>
													<th scope="row">4</th>
													<td>2022.07.06 15:51</td>
													<td>여성 펌</td>
													<td>150000</td>

													<td><button class="btn btn-outline-success">수정</button>
														<button class="btn btn-outline-success">삭제</button></td>

												</tr>
											</tbody>
										</table>

									</div>
								</div>
							</div>
						</div>
					</div>

					<div style="float: right;">
						<button class="btn btn-outline-success">예약 등록</button>
					</div>


					<div class="container py-5 h-150">
						<div
							class="row d-flex justify-content-center align-items-center h-100">
							<div class="col col-lg-10 col-xl-9">
								<p style="font-weight: 700;">예약 신청 내역</p>
								<div class="card rounded-3">
									<div class="card-body p-1">

										<table class="table mb-4">
											<thead>
												<tr>
													<th scope="col">No.</th>
													<th scope="col">이름</th>
													<th scope="col">시간</th>
													<th scope="col">시술</th>
													<th scope="col">가격</th>
												</tr>
											</thead>
											<tbody>

												<tr>
													<th scope="row">1</th>
													<td>박성범</td>
													<td>2022.07.06 15:51</td>
													<td>일반 남성 컷</td>
													<td>20000</td>
													<td><button class="btn btn-outline-success">확인</button>
														<button class="btn btn-outline-success">삭제</button></td>
												</tr>

												<tr>
													<th scope="row">2</th>
													<td>박성범</td>
													<td>2022.07.06 16:30</td>
													<td>일반 남성 컷</td>
													<td>20000</td>
													<td><button class="btn btn-outline-success">확인</button>
														<button class="btn btn-outline-success">삭제</button></td>
												</tr>
												<tr>
													<th scope="row">3</th>
													<td>박성범</td>
													<td>2022.07.06 17:51</td>
													<td>일반 남성 컷</td>
													<td>20000</td>
													<td><button class="btn btn-outline-success">확인</button>
														<button class="btn btn-outline-success">삭제</button></td>
												</tr>
												<tr>
													<th scope="row">4</th>
													<td>박성범</td>
													<td>2022.07.06 18:51</td>
													<td>일반 남성 컷</td>
													<td>20000</td>
													<td><button class="btn btn-outline-success">삭제</button></td>
												</tr>
											</tbody>
										</table>

									</div>
								</div>
							</div>
						</div>
					</div>

				</section>
			</div>




		</div>

		<div style="width: 20%; float: right;"></div>
	</div>
</body>
</html>