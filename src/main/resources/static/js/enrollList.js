
//예약 삭제 처리 버튼
$("button[id='deletebtn']").on('click', function() {
	let enrollno = $(this).attr('value');
	let did = document.getElementById("hidden").value;
	if (confirm("해당 예약을 삭제하시겠습니까?")) {
	  deleteFetch(enrollno, did).then(res => {alert(res);	window.location.reload();})
	}
})
function deleteFetch(enrollno, did) {
	let result = fetch(`/enrollList/${enrollno}/${did}`,
		{ method: "DELETE" })
		.then((res) => res.text()).catch(error => console.log(error))
	return result;
}