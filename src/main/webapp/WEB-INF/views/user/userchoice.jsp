<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입유형선택</title>
    <style>
        .userchoice {
            width: 800px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
            text-align: center;
        }
        .userchoice > h2 {
            padding: 0 0 20px;
            font-size: 32px;
            color: #111;
            border-bottom: 2px solid #111;
            text-align: center;
            line-height: 1;
        }
        .userchoice > button {
            width: 60%; height: 56px;
            line-height: 56px;
            background: rgb(67, 67, 255);
            border: solid rgb(67, 67, 255);
            font-size: 18px;
            color: white;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
	<section class="userchoice">
	    <h2>가입유형선택</h2>
	    <button onclick="location.href='/user/joinForm'">고객으로 회원가입</button><br>
	    <button onclick="location.href='/dcreate'">디자이너로 회원가입</button>
    </section>
</body>
</html>