 $(function() {
   //페이지가 로딩될때
	whiteHeart.show();

 });

let whiteHeart = $("#heart");


function update(uid,did) {   // 좋아요 추가
	return fetch(`/plusHeart/${uid}/${did}`, {
		method: 'get',
		//body: JSON.stringify(uid, did),
		headers: { 'Content-Type': "application/json; charset=utf-8" }
	})
		.then(response => response.text())
		.catch(console.log);
}

whiteHeart.on("click", function(e){   // 좋아요 추가
	alert(uid);
		
	update(uid, did)
		.then(result => {
		
		
		
	});
		

})

function update2(uid,did) {   // 좋아요 삭제
	return fetch(`/minusHeart/${uid}/${did}`, {
		method: 'get',
		//body: JSON.stringify(did),
		headers: { 'Content-Type': "application/json; charset=utf-8" }
	})
		.then(response => response.text())
		.catch(console.log);
}

redHeart.on("click", function(e){  // 좋아요 삭제
	alert(did);
	
	update2(uid, did)
		.then(result => {
		
	});
	
	whiteHeart.show();
	
})
