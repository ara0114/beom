<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function dmypage_update() {
		let url = "/dmypage_update";
		location.href = url;
	}

	function dmypage_photo_update() {
		let url = "/designer/dupdateFileForm/";
		location.href = url;
	}

	function dmypage_intro_update() {
		let url = "/dmypage_intro_update";
		location.href = url;
	}
	function delete_enroll(enrollno){
		let url = "/designer/deleteEnroll/" + enrollno;
		location.href = url;
	}
	function enroll(){
		let url = "/enroll/designer";
		location.href = url;
	}
	
	//function modal(){
	//	$("#staticBackdrop").modal("show");
	//}
	
	function get(rnum) {
	    return fetch(`/reserve/${rnum}`,{method: 'get'})
	           .then(response => response.json())
	           .catch(console.log);
	}
	
	let modalInputContent = $(".modal").find("p[id='message']");
	
	$("#reserve_modal").on("click", function (e) {
		 
		  let rnum = $(this).data("rnum");
		 
		   get(rnum)
		    .then(reserve => {
		      
		      modalInputContent.val(reserve.message);
			  $(".modal").modal("show");
		 
		    });
		});
	
	
	function hairmenu(){   // ??????????????? ???????????????????????? ??????
		let url = "/hairmenu";
		location.href = url;
	}
	
	function cut(cateno){
		let url = "/hairmenu/" + 1;
		location.href = url;
	}
	function perm(cateno){
		let url = "/hairmenu/" + 2;
		location.href = url;
	}
	function color(cateno){
		let url = "/hairmenu/" + 3;
		location.href = url;
	}
	function clinic(cateno){
		let url = "/hairmenu/" + 4;
		location.href = url;
	}
	function etc(cateno){
		let url = "/hairmenu/" + 5;
		location.href = url;
	}
	
	
	//?????? ??? 
	function hairenrollCheck(f){
		if (f.catename.value.length == 0){
			alert("??????????????? ???????????????");
			f.catename.focus()
            return false;
		}
		if (f.hgender.value.length == 0){
			alert("????????? ???????????????");
			f.hgender.focus()
            return false;
		}
		if (f.menu.value.length == 0){
			alert("?????? ????????? ???????????????");
			f.menu.focus()
            return false;
		}
		if (f.price.value.length == 0){
			alert("????????? ???????????????");
			f.price.focus()
            return false;
		}
	}
	
</script>
<style>
label {
	font-size: 150%;
}

button {
	border: 1px solid;
	float: right;
}

td button {
	border: 1px solid;
}

a:link {
	color: maroon;
}

a:hover, a:active {
	background-color: yellow;
}
.nav-link.active{
	color : purple;
	font-weight: 900;
}
</style>
<title>My page</title>
</head>
<body>
	<div style="width: 100%; height: 100%; display: flex;">
		<div
			style="width: 30%; height: 100%; padding-left: 2%; padding-top: 3%; float: left;">
			<img src="/designer/${ddto.dfilename }"
				style="width: 100%; height: 80%;">
			<div>
				<button class="btn btn-outline-success"
					style="width: 100%; border: 1px solid;">???????????????(${ddto.likecnt })</button>
			</div>
			<div style="font-size: 20px; font-weight: bold; text-align: center;">${ddto.hairshop }</div>
			<div style="font-size: 20px; font-weight: bold; text-align: center;">${ddto.dname }
				?????? ????????????</div>
			<div>${ddto.introduction }</div>
			<div style="float: right">
				<button class="btn btn-outline-success"
					style="border: 1px solid; margin-bottom: 2px;"
					onclick="dmypage_update()">???????????? ?????? ??????</button>
				<button class="btn btn-outline-success" style="border: 1px solid;"
					onclick="dmypage_photo_update()">???????????? ?????? ??????</button>
			</div>
		</div>


		<!-- ????????? ?????? START -->
		 <div style="width : 80%; float : right;">
		 
            <div style="padding-top: 3%; padding-bottom: 3%; text-align: center; font-size: 20px; font-weight: bold">
              <ul id="nav2" class="nav justify-content-center">
                <li class="nav-item">
                    <a class="nav-link active" href="/hairmenu">??????</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">?????????</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/review/list">??????</a>
                </li>
              </ul>
            </div>



              <section class="vh-100">
                <div class="container py-5 h-150">
                    <form action="./hairmenuEnroll" method="post" onsubmit="return hairenrollCheck(this)">
                        <div class = "form-group">
                            <label for = "category">????????????</label>
                            <div>
                                <select name="category" id="category" class = "form-select" aria-label="Default select example">
                                    <option value="1">??????&?????????</option>
                                    <option value="2">???</option>
                                    <option value="3">??????</option>
                                    <option value="4">?????????</option>
                                    <option value="5">??????</option>
                                </select>
                            </div>
                          </div>

                        <div class = "form-group">
                          <label for = "hgender">??????</label>
                            <div>
                              <select name="hgender" id="hgender" class = "form-select" aria-label="Default select example">
                                  <option value="1">??????</option>
                                  <option value="2">??????</option>
                              </select>
                            </div>
                        </div>

                        
                        <div class="form-group">
                          <label for="menu">?????? ??????</label>
                          <input type="text" class="form-control" name="menu" id="menu" placeholder="?????? ??????">
                        </div>
                        <div class="form-group">
                          <label for="price">??????</label>
                          <input type="text" class="form-control" name="price" id="price" placeholder="??????">
                        </div>
                        
                        <div style = "float: right;">
		                  <button class = "btn btn-outline-success" type="submit">?????? ??????</button>
		                </div>
                
              </form>
                </div>

                
              </section>

          

        </div>

        <div style="width: 20%; float : right;">


        </div>
    </div>
</body>
</html>