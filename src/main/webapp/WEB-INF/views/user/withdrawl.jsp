<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 탈퇴</title>
    <style>
        .withdrawl {
            width: 800px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
            text-align: center;
        }
        .withdrawl h2 {
            padding: 0 0 20px;
            font-size: 32px;
            color: #111;
            border-bottom: 2px solid #111;
            text-align: center;
            line-height: 1;
        }
        .withdrawl div{
            padding-top:10px;
        }
        .withdrawl button{
            margin-right: 4px;
            display: inline;
            align-items: center;
            height: 34px;
            padding: 0 12px;
            border: 1px solid #d5d5d5;
            border-radius: 4px;
            font-size: 14px;
            color: #333;
            text-align: center;
        }
        .pw-text {
            height: 34px;
            padding: 0 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            outline: none;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.75);
            font-size: 16px;
        }
        .pw-text:focus {
            border-color: #000;
        }
    </style>
</head>
<body>
    <form class="withdrawl" action="/user/delete" method="post">
        <h2>회원탈퇴</h2>
        <p>
            탈퇴 전 확인하세요! <br>
            탈퇴하면 모든 정보가 사라지게 되며 복구할 수 없습니다. <br>
            - 프로필, 예약내역, 리뷰 등 모든 정보 삭제<br>
        </p>
            <input type="checkbox" id="chk_warning" for="chk_warning">
            안내사항을 모두 확인하였으며 동의합니다.
            <input type="hidden" name="uid" value="${dto.uid}">
            <div>
                <label for="upw">비밀번호</label>
                <input type="password" id="upw" name="upw" class="pw-text" placeholder="비밀번호를 입력해주세요">
                <button type="submit" class="btn">확인</button>
                <button type="button" class="btn" onclick="history.back()">취소</button>
            </div>
    </form>
</body>
</html>