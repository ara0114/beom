let likecnt = $("#heart");

function add(did) {  //추가
	return fetch('/heart/plus', {
		method: 'get',
	})
		.then(response => response.json())
		.catch(console.log);
}

$("#heart").click(function(){
	
	let did =$(this).attr('value');	
	alert(did);
	
	add(ddto)
		.then(result=>{
			
			likecnt.val(designer.likecnt);
			
		})
})