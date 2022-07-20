<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>


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
	function delete_enroll(enrollno) {
		let url = "/designer/deleteEnroll/" + enrollno;
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
					style="width: 100%; border: 1px solid;">❤️좋아요(${ddto.likecnt })</button>
			</div>
			<div style="font-size: 20px; font-weight: bold; text-align: center;">${ddto.hairshop }</div>
			<div style="font-size: 20px; font-weight: bold; text-align: center;"">${ddto.dname }
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
		<!-- div left구역 -->


		<div style="width: 80%; float: right;">
			<div style="height: 6%;"></div>
			<div class="container">
				<div class="head" style="display: flex">
					<div class="title">
						<a href="/review/list" id="h2"><h2>전체 리뷰</h2></a>
					</div>
					<div class="star-row">
						<div class="starsum">
							<h3>&nbsp ⭐ ${starAvg }</h3>
						</div>
						<!-- 평균 별점 -->
					</div>
				</div>
				<!-- head END -->
				<form class="form-inline" action="./list">
					<div class="form-group">
						<select class="form-control" name="col">
							<option value="rtitle"
								<c:if test= "${col=='rtitle'}"> selected </c:if>>제목</option>
							<option value="rcontent"
								<c:if test= "${col=='rcontent'}"> selected </c:if>>내용</option>
							<option value="uid" <c:if test= "${col=='uid'}"> selected </c:if>>아이디</option>
							<option value="title_content"
								<c:if test= "${col=='title_content'}"> selected</c:if>>제목+내용</option>
							<option value="total"
								<c:if test= "${col=='total'}"> selected </c:if>>전체출력</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Enter 검색어"
							name="word" value="${word}">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
					<c:if test="${not empty sessionScope.uid}">
						<button type="button" class="btn btn-default" id="reviewCreate">등록</button>
					</c:if>
				</form>
				<hr>

				<div class="contents">
					<c:forEach var='dto' items="${list }">
						<div class="row">
							<c:if test="${dto.rfilename != null }">
								<div class="review-img">
									<a><img class='chat' data-rno="${dto.rno }"
										src="/hairReview/storage/${dto.rfilename}"></a>
								</div>
							</c:if>
							<div class="customer-review">
								<div class="star">
									${dto.uid } &nbsp &nbsp
									<c:if test="${dto.star == 1}">
										<i class="fa-solid fa-star"></i>
									</c:if>
									<c:if test="${dto.star == 2}">
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</c:if>
									<c:if test="${dto.star == 3}">
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</c:if>
									<c:if test="${dto.star == 4}">
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</c:if>
									<c:if test="${dto.star == 5}">
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</c:if>
									${dto.star } &nbsp &nbsp | &nbsp
									<div style="float: right;">${dto.rdate }</div>
								</div>


								<h3>${dto.rtitle }</h3>
								<p data-rno="${dto.rno }" class='chat'>${dto.rcontent }</p>
							</div>
						</div>

						<!-- row end -->
						<hr>
					</c:forEach>
				</div>
				<!-- contents END -->
				<div>${paging }</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">😊REVIEW😊</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>아이디</label> <input class="form-control" name='uid'
									id="uid" disabled> <label>담당디자이너</label> <input
									class="form-control" name='did' id="did"><br>
								<!-- 나중에 disabled -->
								<div id="rating">
									<label>평점</label>&nbsp&nbsp <select name="star">
										<option value="5">아주 좋아요 &nbsp ★★★★★</option>
										<option value="4">맘에 들어요 &nbsp ★★★★☆</option>
										<option value="3">보통이에요 &nbsp&nbsp ★★★☆☆</option>
										<option value="2">그냥 그래요 &nbsp ★★☆☆☆</option>
										<option value="1">별로에요 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											★☆☆☆☆</option>
									</select>
								</div>

								<!--  <div id="star">
						별5개
						</div>-->

								<label class="modal-img">이미지 </label>
								<div class="review-img">
									<img class='modal-img' src="" name="rfilename"> <input
										type="file" name="addfile">
								</div>
								<label>제목</label> <input class="form-control" name='rtitle'
									id="rtitle"> <label>내용</label>
								<textarea cols="10" rows="10" class="form-control"
									name='rcontent' id="rcontent"></textarea>
								<!--  <label class="rdate" id="rdate">작성날짜</label>
						<input class="form-control" name='rdate' id="rdate" disabled>-->
							</div>
						</div>
						<div class="modal-footer">
							<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
							<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
							<button id='modalRegisterBtn' type="button"
								class="btn btn-primary">Register</button>
							<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>

		</div>
		<!-- container END -->

	</div>
	<!-- 오른쪽 div 구역 END -->

	<div style="width: 20%; float: right;"></div>
	</div>
	<!-- 맨처음 div -->
	<script>let uid = '${sessionScope.uid}'</script>
	<script src="/js/reviewProducer.js"></script>
	<script src="/js/reviewConsumer.js"></script>
</body>
</html>