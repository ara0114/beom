// 바로실행
$(function() {
	updateProgress();
	
});

function CategoryGender(gender, category) {
	return fetch(`/datareq/${gender}/${category}`)
		.then((res) => res.json()).catch((error) => console.log(error));
}
let selectTag = $('#price');
$("#gender").change(function() {
	updateProgress();
	let gender = $("#gender").val();
	let category = $("#category option:selected").val();
	//let selectTag = document.getElementById("price");
	CategoryGender(gender, category).then(list => {
		let str = ""
		for (let i = 0; i < list.length; i++) {
			str += "<option>시술 선택</option>";
			str += "<option>" + list[i].menu + " : " + list[i].price + "</option>"
			selectTag.html(str);
			console.log(str);
		}
	});
});


//날짜
$("#startDate").datepicker({
	minDate: new Date(),
	showOn: "both",
	buttonImage:
		"https://cdn-icons.flaticon.com/png/512/939/premium/939128.png?token=exp=1657774669~hmac=1c3ac533c4f996c6ba86b17be0cda07d",
	buttonImageOnly: true,
	buttonText: "Click Here",
	dateFormat: "yy-mm-dd",
	changeMonth: true,
	changeYear: true,
	nextText: "다음 달",
	prevText: "이전 달",
	showAnim: "drop",
	showButtonPanel: true,
	currentText: "오늘 날짜",
	closeText: "닫기",
	autoSize: true,
	dayNames: [
		"월요일",
		"화요일",
		"수요일",
		"목요일",
		"금요일",
		"토요일",
		"일요일",
	],
	dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
	monthNamesShort: [
		"1월",
		"2월",
		"3월",
		"4월",
		"5월",
		"6월",
		"7월",
		"8월",
		"9월",
		"10월",
		"11월",
		"12월",
	],
});

//체크박스 radio
$("input[type='radio']").checkboxradio();


$("#submit").button({
	disabled: true,
});
//progress var 진행율
$("#progress").progressbar({
	value: 0,
});
// 시술선택을 변경하면 성별과 가격이 다시 초기값으로 세팅 된다
$("#category").change(function() {
	updateProgress();
	$('#gender option:eq(0)').prop("selected",true);
	$('#price option:eq(0)').prop("selected",true);
	
});
$("input").change(function() {
	updateProgress();
});
$("select").change(function() {
	updateProgress();
});

function updateProgress() {
	let $progress = 0,
		$itemCount = 5,
		$itemCompleted = 0;

	let $category = $("#category option:selected").val();
	let $gender = $("#gender option:selected").val();
	let $price = $("#price option:selected").val();
	let $time = $("input[type='time']").val();
	let $date = $("#startDate").val();
	//let $referrer = $('input[type="radio"]:checked').val();

	if ($gender != "성별 선택") $itemCompleted++;
	if ($category != "시술 선택") $itemCompleted++;
	if ($time) $itemCompleted++;
	if ($date) $itemCompleted++;
	if ($price != "시술 선택") $itemCompleted++;
	$progress = ($itemCompleted / $itemCount) * 100;
	$("#progress").progressbar("option", "value", $progress);
	$("#progress").progressbar("option", "color", "green");
	$(".pct span").text($progress);
	if ($progress == 100) {
		$("#submit").button({
			disabled: false,
		});
	}
}
