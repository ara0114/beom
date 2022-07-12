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
<link rel = "stylesheet" href = "css/designer_createForm.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<title>회원가입</title>


</head>
<body>
	<section class="h-100 h-custom gradient-custom-2">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12">
					<div class="card card-registration card-registration-2"
						style="border-radius: 15px;">
						<div class="card-body p-0">
							<div class="row g-0">
								<div class="col-lg-6">
									<div class="p-5">
										<h3 class="fw-normal mb-5" style="color: #4835d4;">디자이너
											회원가입</h3>

										<div class="row">
											<div class="col-md-6 mb-4 pb-2">
												<div class="form-outline">
													<input type="text" id="form3Examplev2"
														class="form-control form-control-lg" /> <label
														class="form-label" for="form3Examplev2">아이디</label>
												</div>
											</div>
										</div>

										<div class="mb-4 pb-2">
											<div class="form-outline">
												<input type="text" id="form3Examplev4"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplev4">비밀번호</label>
											</div>
										</div>

										<div class="mb-4">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea9"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea9">이메일</label>
											</div>
										</div>

										<div class="mb-4">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea9"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea9">전화번호</label>
											</div>
										</div>

										<div class="mb-4">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea9"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea9">생년월일 (예 :
													901225)</label>
											</div>
										</div>

										<div class="mb-4">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea9"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea9">우편번호</label>
												<button>주소 검색</button>
											</div>
										</div>

										<div class="mb-4">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea9"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea9">주소</label>
											</div>
										</div>

										<div class="mb-4">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea9"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea9">상세주소</label>
											</div>
										</div>




									</div>
								</div>
								<div class="col-lg-6 bg-indigo text-white">
									<div class="p-5">
										<h3 class="fw-normal mb-5">자격증 정보</h3>

										<div class="mb-4 pb-2" style = "color: black;">
											<select class="select">
												<option value="1">상장형 자격증</option>
												<option value="2">수첩형 자격증</option>
											</select>
										</div>

										<div class="mb-4 pb-2">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea2"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea2">자격증 번호
													(예:12345678901A)</label>
											</div>
										</div>

										<div class="mb-4 pb-2">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea3"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea3">발급(등록)연월일
													(예:20050101)</label>
											</div>
										</div>

										<div class="mb-4 pb-2">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea3"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea3">자격증 내지번호
													(예:0901234567)</label>
											</div>
										</div>

										<div class="mb-4 pb-2">
											<div class="form-outline form-white">
												<input type="text" id="form3Examplea3"
													class="form-control form-control-lg" /> <label
													class="form-label" for="form3Examplea3">자격증 관리번호</label>
											</div>
										</div>

										<button type="button" class="btn btn-light btn-lg"
											data-mdb-ripple-color="dark">등록</button>
										<button type="button" class="btn btn-light btn-lg"
											data-mdb-ripple-color="dark">취소</button>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>