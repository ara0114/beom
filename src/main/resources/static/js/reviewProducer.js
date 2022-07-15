console.log("*****Reply Module........");

function get(rno) {  //조회
		//alert(rno);
        return fetch(`/review/list/${rno}`,{
			method: 'get'})
               .then(response => response.json())
               .catch(console.log);
}

function add(review) {  //추가
	return fetch('/review/list/create', {
		method: 'post',
		body: JSON.stringify(review),
		headers: { 'Content-Type': "application/json; charset=utf-8" }
	})
		.then(response => response.json())
		.catch(console.log);
}

function update(reply) {  //수정
	return fetch(`/review/`, {
		method: 'put',
		body: JSON.stringify(reply),
		headers: { 'Content-Type': "application/json; charset=utf-8" }
	})
		.then(response => response.text())
		.catch(console.log);
}

// 삭제
// 요청 uri이 같아도 reply 방식이 다르기 때문에 괜찮다(method=delete)
function remove(rno) {
	return fetch(`/review/list/${rno}`, { method: 'delete' })
		.then(response => response.text())
		.catch(console.log);
}