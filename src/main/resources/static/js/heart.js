$(function() {   //페이지가 로딩될때
	heartFill.hide();
	heart.show();

});

let heart = $("#heart")
let heartFill = $("#heart_fill")


function update(did) {   // 좋아요 추가
	return fetch(`/plusHeart/${did}`, {
		method: 'put',
		body: JSON.stringify(did),
		headers: { 'Content-Type': "application/json; charset=utf-8" }
	})
		.then(response => response.text())
		.catch(console.log);
}


heart.on("click", function(e){   // 좋아요 추가
	alert(uid);

	if(uid.heart_chk == 0) {
		
		
	} else {
		// 주석
	}
	
	heartFill.show();  //빨간색
	heart.hide();

//	let heart = {uid:uid, did:did}
	update(did)
//		.then(result => {
//
//	});
})


function update2(did) {   // 좋아요 삭제
	return fetch(`/minusHeart/${did}`, {
		method: 'put',
		body: JSON.stringify(did),
		headers: { 'Content-Type': "application/json; charset=utf-8" }
	})
		.then(response => response.text())
		.catch(console.log);
}

heartFill.on("click", function(e){  // 좋아요 삭제
	//alert(did);
	
	heart.show();
	heartFill.hide();
	
	update2(did)
		.then(result => {

	});
	
})
