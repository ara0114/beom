<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Login</title>
    <style>
        .login {
            width: 800px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
            text-align: center;
        }
        .login > h2 {
            padding: 0 0 20px;
            font-size: 32px;
            color: #111;
            border-bottom: 2px solid #111;
            text-align: center;
            line-height: 1;
        }
        ul, li {
            list-style: none;
        }
        .login > ul li {
            padding: 0 0 12px;
            text-align: center; 
        }
        .login > ul li input {
            width: 60%;
            height: 46px;
            box-sizing: border-box;
            text-indent: 16px;
        }
        .login > ul li input::-webkit-input-placeholder {
            font-size:16px;
            color: #9fa19f;
            text-indent: 16px;
        }
        .login > ul li button {
            width: 60%; height: 56px;
            line-height: 56px;
            background: rgb(67, 67, 255);
            border: solid rgb(67, 67, 255);
            font-size: 18px;
            color: white;
        }
        .login > ul div {
            padding-bottom: 10px;
        }
        .login > div ul {
            display: flex;
            justify-content: center;
        }
        .login > div ul li {
            position: relative;
            padding: 0 18px;
        }

        .login > div ul li ~ li:after {
            content:"";
            position: absolute;
            left: 0;
            right: 0;
            top: 4px;
            height: 14px;
            width: 1px;
            background: #111;
            transform: rotate(25deg) ;
        }
        .login > div ul li a {
            font-size: 14px;
            color: #111;
        }
    </style>
    <script>
    	function moveForm(){
    		alert("디자이너 로그인페이지로 이동합니다.");
    		//location.href="/ooo/ooo";
    	}
    </script>
</head>
<body>
    <form class="login" action="/user/login" method="post">
        <h2>로그인</h2>
        <ul>
            <div><input type="radio" name="selectuser" checked><label>고객</label>
                <input type="radio" name="selectuser" onclick="javascript:moveForm()"><label>디자이너</label></div>
            <li><input type="text" id="uid" name="uid" placeholder="아이디"></li>
            <li><input type="password" id="upw" name="upw" placeholder="비밀번호"></li>
            <div><input type="checkbox" id="chk_id"><label for="chk_id">아이디저장</label></div>
            <li><button type="submit">로그인</button></li>         
        </ul>
        <div>
            <ul>
                <li><a href="/user/userchoice">회원가입</a></li>
                <li><a href="#">아이디찾기</a></li>
                <li><a href="#">비밀번호찾기</a></li>
            </ul>        
        </div>
    </form>
</body>
</html>