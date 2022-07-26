<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title></title>
<link rel="stylesheet" href="/css/notice.css">


<%-- WebSocket 관련 설정 --%>
<script src="/js/sockjs.min.js"></script>
<%--/static 폴더 기준 --%>
<script src="/js/stomp.min.js"></script>
<%--/static 폴더 기준 --%>

<script type="text/JavaScript" src="/js/app.js"></script>
<%--/static 폴더 기준 --%>

</head>
<body>
	<div id="main-content" class="container">
		<div class="board_wrap">
			<div class="board_title">
				<strong>FAQ</strong>
				<p>자주 묻는 질문입니다.</p>
			</div>
			
			<form class="form-inline">
				<div class="form-group" style="width: 90%;">
					<label for="msg">문의: </label>
					
					<%--<input type="text" id="msg"
						class="form-control" placeholder="내용을 입력하세요...."
						value="JAVA에 대해서 알려주세요." style="width: 90%;"> --%>
						<select id="msg" class="form-control" style="width: 90%;">
							<option value="어떤 서비스인가요?">--질문을 선택하세요--</option>
							<option value="어떤 서비스인가요?">어떤 서비스인가요?</option>
						</select>
						
				</div>
				<button id="send" class="btn btn-default" disabled type="submit">검색</button>
			</form>
			
			<div class="row">
				<div class="col-md-12">
					<table id="conversation" class="table table-striped">
						<thead>
							<tr>
								<th>메세지</th>
							</tr>
						</thead>
						<tbody id="communicate">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>