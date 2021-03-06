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
    function inCheck(f) {
		if (f.did.value.length == 0) {
			alert("???????????? ???????????????");
			f.did.focus();
			return false;
		}
		if (f.dpw.value.length == 0) {
			alert("??????????????? ???????????????");
			f.dpw.focus();
			return false;
		}
    }
    </script>
    <script>
    	function moveForm(){
    		alert("?????? ????????????????????? ???????????????.");
    		location.href="/user/login";
    	}
    </script>
</head>
<body>
    <form class="login" action = "/dlogin" method = "post" onsubmit="return inCheck(this)">
        <h2>???????????? ?????????</h2>
        <ul>
            <div>
            	<input type="radio" name="selectuser" onclick="javascript:moveForm()"><label>??????</label>
                <input type="radio" name="selectuser" checked><label>????????????</label>
            </div>
            <li><input type="text" id="did" name="did" placeholder="?????????" 
            		   required="required" value="${cookie_id_val }"></li>
            <li><input type="password" id="dpw" name="dpw" placeholder="????????????" required="required"></li>
            <div>
            	<input type="checkbox" name="chk_id" id="chk_id" value="Y" checked="checked">
            	<label for="chk_id">????????? ??????</label>
            </div>
            <li><button type="submit">?????????</button></li>         
        </ul>
        <div>
            <ul>
                <li><a href="/user/agree">????????????</a></li>
                <li><a href="/dfindid">???????????????</a></li>
                <li><a href="/dfindpw">??????????????????</a></li>
            </ul>        
        </div>
    </form>
</body>
</html>