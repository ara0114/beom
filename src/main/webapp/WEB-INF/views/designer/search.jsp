<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,com.study.designer.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>디자이너 검색</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        h2 {
            padding: 0 0 20px;
            font-size: 32px;
            color: #111;
            border-bottom: 2px solid #111;
            text-align: left;
            line-height: 1;
        }
        table {
            width: 90%;
            border-top: 1px solid black;
            border-collapse: collapse;
        }
        th,td {
            border-bottom: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        th{
        	font-weight: bold;
        }
        div{
            padding: 10px;
        }
        #word {
            height: 34px;
                    padding: 0 10px;
                    border: 1px solid #ddd;
                    border-radius: 5px;
                    box-sizing: border-box;
                    outline: none;
                    box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.75);
                    font-size: 16px;
        }
    </style>
    <script>
		function info(did){
			let url = "/hairmenu";
			url += "?did=";
			url += did;
		    location.href = url;
		}    
    </script>
</head>
<body>
	<div class="container">
		<h2>디자이너 검색</h2>
		<form class="form-inline" action="/search">
			<div class="form-group" id="search">
				<select class="form-control" name="col">
					<option value="address1"
					<c:if test="${col='address1'}"> selected </c:if>
					>주소</option>
					<option value="hairshop"
					<c:if test="${col='hairshop'}"> selected </c:if>
					>미용실</option>
					<option value="total"
					<c:if test="${col='total'}"> selected </c:if>
					>전체출력</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="word" id="word" placeholder="검색어 입력" value="${word }">
			</div>
			<button type="submit" class="btn btn-default">검색</button>
		</form>
		<c:choose>
			<c:when test="${empty slist }">
				<tr><td colspan="4">등록된 디자이너가 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
		<c:forEach var="ddto" items="${slist }">
<%-- 		<c:forEach var="innerdto" items="${ddto.reviewcount} ">	 --%>
		<table class="table table-hover">
				<tr>
					<td rowspan="4" class="col-sm-2">
					<img src="/designer/${ddto.dfilename}" class="img-rounded" width="150px" height="150px">
					</td>
					<th class="col-sm-2">이름</th>
					<td class="col-sm-8"><a href="javascript:info('${ddto.did }')">${ddto.dname }</a></td>
				</tr>
				<tr>
					<th class="col-sm-2">주소</th>
					<td class="col-sm-8">${ddto.address1 }</td>
			    </tr>
			    <tr>
					<th class="col-sm-2">미용실</th>
					<td class="col-sm-8">${ddto.hairshop }</td>
				</tr>
				<tr>	
					<th class="col-sm-2">리뷰수</th>
					<td class="col-sm-8">.. </td>
				</tr>
		</table>
<%-- 			</c:forEach> --%>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		<div class="text-center">
			${paging }
		</div>
	</div>
</body>
</html>