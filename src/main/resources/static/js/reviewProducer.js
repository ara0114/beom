console.log("*****Reply Module........");

function get(rno) {  //조회
        return fetch(`/review/list/${rno}`,{
			method: 'get'})
               .then(response => response.json())
               .catch(console.log);
}
