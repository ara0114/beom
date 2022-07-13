const dragArea = document.querySelector(".drag-area");
const dragText = document.querySelector(".header");
const styleButton = document.querySelector(".select-btn");
let input = document.getElementById("input-file");
const allImg = document.querySelector(".all-img");
const womanImg = document.querySelector(".woman-img");
const manImg = document.querySelector(".man-img");
let file;
// 파일이름 저장된 fileName ---------------------------
let fileName;
let promiseData;
let dto;


$(function() {

	$('#input-file').hide();
	fetchAPI(allImg, "all");
	$('.woman-img').empty();
	$('.man-img').empty();
})

//input radio 변경될때마다 val 체크
$('input:radio[name="gender"]').change(function() {

	let gender = $('input:radio[name="gender"]:checked').val();
	if (gender == "여자") {
		fetchAPI(womanImg, gender);
		$('.all-img').empty();
		$('.man-img').empty();
	} else if (gender == "남자") {
		fetchAPI(manImg, gender);
		$('.all-img').empty();
		$('.woman-img').empty();
	} else {
		fetchAPI(allImg, gender);
		$('.woman-img').empty();
		$('.man-img').empty();
	}

})

function fetchAPI(genderTag, gender) {
	promiseData = styleGet(gender)
	promiseData.then(list => {
		for (let i = 0; i < list.length; i++) {
			let img = document.createElement("img");
			img.src = "data:" + list[i].imagetype + ";base64," + list[i].imagecode;
			img.data = list[i].imageno;
			img.value = list[i].imageno;
			img.classList = "images";
			img.onclick = function() {
				let imageno = $(this).val();
				console.log(imageno);
				if (confirm("사진을 삭제하시겠습니까?")) {
					let text = deleteStyle(imageno);
					text.then(res=>alert(res));
				} 
			}
			genderTag.append(img);
		}
	})

}
function styleGet(gender) {
	return fetch(`/style/list/${gender}`).then((res) => res.json()).catch((error) => console.log(error));
}
function deleteStyle(imgno){
	return fetch(`/style/delete/${imgno}`).then(res=>res.text()).catch(error=>console.log(error));
}
//드래그영역 클릭시 숨어있는 input 클릭
dragArea.onclick = () => {
	input.click();
};
//파일을 클릭해서 선택할때
input.addEventListener("change", function() {
	file = this.files[0];

	//file.name 을 데이터베이스에 저장하면되겠다.
	dragArea.classList.add('active');
	displayFile(file);
});

//드래그영역에 들어왔을때
dragArea.addEventListener("dragover", (event) => {
	event.preventDefault();
	dragText.textContent = "Release to Upload";
	dragArea.classList.add("active");
});
//드래그영역에서 벗어났을때
dragArea.addEventListener("dragleave", () => {
	dragText.textContent = "Drag & Drop";
	dragArea.classList.remove("active");
});
//드래그영역에 파일이 드롭되었을때
dragArea.addEventListener("drop", (event) => {
	event.preventDefault();

	//드롭된 파일의 전송된 file 데이터 object
	file = event.dataTransfer.files[0];

	//file에 name 을 추출하기위해 displayFile 에파라미터에 전달
	displayFile(file);
	//console.log(file)
	//console.log(fileType);
});
function displayFile(file) {
	let fileType = file.type;
	let validExtensions = ["image/jpeg", "image/jpg", "image/png"];
	if (validExtensions.includes(fileType)) {
		let fileReader = new FileReader();
		fileReader.onload = (e) => {
			//fileName 에 해당파일 이름 저장
			fileName = file.name;
			console.log(fileName);
			//fileUrl 은  img Tag 를만들고 속성 src에 값을 준다 매우긴URL 코드가나온다
			let fileURL = fileReader.result;
			let imgTag = `<img src="${fileURL}" alt="">`;
			dragArea.innerHTML = imgTag;
		};
		fileReader.readAsDataURL(file);
	} else {
		alert("이 파일은 이미지가 아닙니다.");
		dragArea.classList.remove("active");
	}
}
