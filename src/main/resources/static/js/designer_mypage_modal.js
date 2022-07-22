//let modalInputContent = $("#modal").find("p[id='message']");
	
let modalex = $("#message"); 

function modal(reserveno){
            
    let rnum = reserveno;
            
    //modalInputContent.val(reply.content);
    get(rnum)
    .then(reserve => {
        alert(reserve.message);
        $("#message").val(reserve.message);
        $(".modal").modal("show");
            
    });
        
}

function get(rnum) {
    return fetch(`/reserve/${rnum}`,{method: 'get'})
           .then(response => response.json())
           .catch(console.log);
}