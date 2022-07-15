<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://kit.fontawesome.com/320c5e3232.js"
	crossorigin="anonymous"></script>
<title>고객리뷰_리스트</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/reviewListStyle.css">
<script type="text/javascript">
	function read(rno) {
		var url = "read";
		url += "?rno=" + rno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
	<div class="container">
		<div class="head">
			<div class="title">
				<a href="/review/list" id="h2"><h2>전체 리뷰</h2></a>
			</div>
			<div class="star-row">
				<div class="star">
					<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
						class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
						class="fa-solid fa-star"></i>
				</div>
				<div class="starsum">4.8</div>
			</div>
		</div>
		<!-- head end -->
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
							<img class='chat' data-rno="${dto.rno }"
								src="/hairReview/storage/${dto.rfilename}">
						</div>
					</c:if>
					<div class="customer-review">
						<div class="star">
							${dto.uid } &nbsp &nbsp <i class="fa-solid fa-star"></i> <i
								class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
								class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
							${dto.star } &nbsp &nbsp
							<div style = "float: right;">
			                  ${dto.rdate }
			                </div>
						</div>
						

						<h3>${dto.rtitle }</h3>
							<p data-rno="${dto.rno }" class='chat'>${dto.rcontent }</p>
					</div>
				</div>

				<!-- row end -->
				<hr>
			</c:forEach>
		</div>
		<!-- contents end -->
		<div>${paging }</div>
	</div>
	<!--  		<div class="bottom">
			<div class="paging">
				<ul>
					<li><a href="#"><<</a></li>
					<li><a href="#"><</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">></a></li>
					<li><a href="#">>></a></li>
				</ul>
			</div>
		</div>     -->


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">😊REVIEW😊</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>아이디</label>
						<input class="form-control" name='uid' id="uid" disabled>
						<label>담당디자이너</label>
						<input class="form-control" name='did' id="did">  <!-- 나중에 disabled -->
						<label>별점</label>
						<div id="star">
						별5개
						</div>
						<label class="modal-img">이미지 </label>
						<div class="review-img">
							<img class='modal-img' src="" name="rfilename">
							<input type="file" name="addfile">
						</div>
						<label>제목</label>
						<input class="form-control" name='rtitle' id="rtitle">
						<label>내용</label>
						<textarea cols="10" rows="10" class="form-control" name='rcontent' id="rcontent" ></textarea>
						<!--  <label class="rdate" id="rdate">작성날짜</label>
						<input class="form-control" name='rdate' id="rdate" disabled>-->
					</div>
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
					<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
    <script> let uid = '${sessionScope.uid}'</script>
	<script src="/js/reviewProducer.js"></script>
	<script src="/js/reviewConsumer.js"></script>
</body>
</html>