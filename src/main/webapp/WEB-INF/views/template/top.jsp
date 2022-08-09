<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
 <c:choose>
    <c:when test="${not empty sessionScope.uid && sessionScope.grade == 'A'}">
        <c:set var="str">안녕하세요 관리자님!</c:set>
    </c:when>
    <c:when test="${not empty sessionScope.uid && sessionScope.grade != 'A'}">
        <c:set var='str'>안녕하세요  ${sessionScope.uid} 님!</c:set>
    </c:when>
    <c:when test="${not empty sessionScope.dname}">
		<c:set var='str'>안녕하세요  ${sessionScope.dname } 디자이너 님!</c:set>
	</c:when>
    <c:otherwise>
        <c:set var="str">기본 페이지 입니다.</c:set>
    </c:otherwise>
</c:choose>
<!DOCTYPE html> 
<html> 
<head>
<script src="https://kit.fontawesome.com/320c5e3232.js" crossorigin="anonymous"></script>
  <title>hair</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/main.css">
  <link rel="stylesheet" href="/css/reset.css">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style type="text/css">
  #grade{
  
   color :black;
  }  
  </style>

</head>
<body> 
<!--상단메뉴-->
<header class="section">
            <div class="inner clearfix">

                <div class="menu-group float--left">
                    <div class="logo">
                        <a href="#">GitHub</a>
                    </div>
                    <ul class="main-menu">
                        <li><a href="#">TeamBEOM</a></li>
                  <!-- 드롭다운 예정  
                  		<li><a href="#">Story</a></li>
                        <li><a href="#">Developer</a></li>
                        <li><a href="#">Support</a></li> 
                        									-->
                        <li><a href="${root}/">Home</a></li>									
                        <li><a href="${root }/notice/list">Notice</a></li>
                        <li><a href="${root }/faq/chat">FAQ</a></li>
                    </ul>
                </div>

                <div class="sign-group float--right">
                <li><a id="grade">${str }</a></li>
                <c:choose>
                <c:when test="${empty sessionScope.uid && empty sessionScope.did}"> <!-- 로그인안했을때 -->
                    <div class="btn-group">
                        <a href="${root }/user/login" class="btn sign-in">Sign in</a>
                        <a href="${root }/user/agree" class="btn sign-up">Sign up</a>
                    </div>
                </c:when>
                <c:when test="${not empty sessionScope.uid || not empty sessionScope.did}"> <!-- 로그인했을때 -->
                	<div class="btn-group">
                	<a href="${root }/logout" class="btn sign-in">Logout</a>
                	</div>
                </c:when>
                </c:choose>
                    
                    <ul class="sub-menu">
                    <c:choose>
                    	<c:when test="${not empty sessionScope.uid && sessionScope.grade == 'A' }"> <!-- 관리자 로그인했을때 -->
                    		<li><a href="${root }/admin/user/list">고객 목록</a></li>
                    		<li><a href="${root }/admin/designer/list">디자이너 목록</a></li>
                    	</c:when>
                    	<c:when test="${not empty sessionScope.uid }"> <!-- 고객 로그인했을때 -->
                    		<li><a href="${root }/user/mypage">Mypage</a></li>
                    		<li><a href="${root }/search">Reserve</a></li>
                    	</c:when>
                    	<c:when test="${not empty sessionScope.did }"> <!-- 디자이너 로그인했을때 -->
                    		<li><a href="/dmypage">Mypage</a></li>
      						<li><a href="/hairmenu/${sessionScope.did }">Hairmenu</a></li>
                    		<li><a href="#">Style</a></li>
                    		<li><a href="/review/${sessionScope.did}/list">Review</a></li>
                    	</c:when>
                    </c:choose>             
                    </ul>
                </div>
                
            </div>
        </header>
</body>
</html>