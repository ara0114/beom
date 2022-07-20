//let modalInputContent = $(".modal").find("p[class='message']");
	
let modalex = $(".message"); 

function modal(reserveno){
            
    let rnum = reserveno;
            
    //modalInputContent.val(reply.content);
    get(rnum)
    .then(reserve => {
        alert(reserve.message);
        alert(modalex);
        modalex.val(reserve.message);
        //modalInputContent.val(reserve.message);
        $(".modal").modal("show");
            
    });
        
}

function get(rnum) {
    return fetch(`/reserve/${rnum}`,{method: 'get'})
           .then(response => response.json())
           .catch(console.log);
}