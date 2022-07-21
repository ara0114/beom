<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
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
        h3{
        	padding-bottom: 10px;
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
    </style>
    <script>
    	function updateInfo(){
    		let url ="/user/update";
    		url += "?uid=${dto.uid}";
    		location.href = url;
    	}
    </script>
</head>
<body>
    <div class="container">
        <div class="row">
            <h2>My Page</h2>
                <div class="col-sm-4" style="float:left;">
                    <h3>내 정보</h3>
                    <div style="padding-bottom:10px;">
                    <img align="left" src="/svg/person-circle.svg"/> <p>&nbsp;${dto.uname} 님(${dto.uid}) </p>
                    <img align="left" src="/svg/envelope.svg"/>   <p>&nbsp; ${dto.uemail} </p>
                    <img align="left" src="/svg/phone.svg"/>    <p>&nbsp; ${dto.uphone} </p>
                    </div>               
                    <button type="button" class="btn" onclick="javascript:updateInfo()">정보 수정</button>
                    <button type="button" class="btn" onclick="location.href='#'">비밀번호 수정</button>
                    <button type="button" class="btn" onclick="location.href='#'">회원 탈퇴</button>
                </div>
                <div class="col-sm-8" style="float:right;">
                    <div class="list1">
                        <h3>예약 신청 내역</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>미용실</th>
                                    <th>디자이너</th>
                                    <th>날짜</th>
                                    <th>시간</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>XX헤어</td>
                                    <td>블리</td>
                                    <td>2022-07-06</td>
                                    <td>13시</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>               
                        </table>
                    </div>
                    <br>
                    <div class="list2">
                        <h3>예약 확정</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>미용실</th>
                                    <th>디자이너</th>
                                    <th>날짜</th>
                                    <th>시간</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>XX헤어</td>
                                    <td>블리</td>
                                    <td>2022-07-18</td>
                                    <td>13시</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>               
                        </table>
                    </div>
                    <br>
                    <div class="list3">
                        <h3>전체 이용 내역</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>미용실</th>
                                    <th>디자이너</th>
                                    <th>날짜</th>
                                    <th>시간</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>XX헤어</td>
                                    <td>블리</td>
                                    <td>2022-03-15</td>
                                    <td>17시</td>
                                </tr>
                                <tr>
                                    <td>XX헤어</td>
                                    <td>블리</td>
                                    <td>2022-05-30</td>
                                    <td>19시</td>
                                </tr>
                            </tbody>               
                        </table>
                    </div>
                </div>
        </div>
    </div>
</body>
</html>