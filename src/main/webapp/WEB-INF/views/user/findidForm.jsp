<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
    <style>
        .find {
            width: 800px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
            text-align: center;
        }
        .find > h2 {
            padding: 0 0 20px;
            font-size: 32px;
            color: #111;
            border-bottom: 2px solid #111;
            text-align: center;
            line-height: 1;
        }
        .find > div input {
            width: 60%;
            height: 46px;
            box-sizing: border-box;
            text-indent: 16px;
        }
        .find > div input::-webkit-input-placeholder {
            font-size:16px;
            color: #9fa19f;
            text-indent: 16px;
        }
        .find > div button {
            display: flex;
            width: 60%; height: 56px;
            background: rgb(67, 67, 255);
            border: solid rgb(67, 67, 255);
            font-size: 18px;
            color: white;
            margin: auto;
            align-items:center;
            justify-content: center;
        }
        div {
            padding-bottom: 10px;
        }
    </style>    
</head>
<body>
    <form class="find">
        <h2>ID찾기</h2>
        <div>
            <input type="text" id="uname" class="uname" name="uname" placeholder="이름">
        </div>
        <div>
            <input type="email" id="uemail" class="uemail" name="uemail" placeholder="이메일">
        </div>
        <div>
            <span id="msg"></span>
        </div>
        <div>
            <button onclick="">확인</button><br>
            <button onclick="">취소</button><br>
            <button onclick="location.href='#'">PW찾기</button>
        </div>
    </form>
</body>
</html>