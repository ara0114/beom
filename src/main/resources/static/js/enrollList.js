
//예약 삭제 처리 버튼
$("button[id='deletebtn']").on('click', function() {
	let enrollno = $(this).attr('value');
	let did = document.getElementById("hidden").value;
	deleteFetch(enrollno, did).then(res=>{
		alert(res);
	})
})
function deleteFetch(enrollno, did) {
	let result = fetch(`/enrollList/${enrollno}/${did}`,
		{ method: "DELETE" })
		.then((res) =>  res.text()).catch(error => console.log(error))
	return result;
}