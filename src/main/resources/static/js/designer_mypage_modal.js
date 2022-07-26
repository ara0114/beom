function modal(reserveno){
            
    let rnum = reserveno;
            
    get(rnum)
    .then(reserve => {
        $("#uname").val(reserve.udto.uname);
        $("#gender").val(reserve.edto.hdto.hgender);
        $("#date").val(reserve.edto.enrolldate);
        $("#time").val(reserve.edto.enrolltime);
        $("#menu").val(reserve.edto.emenu);
        $("#price").val(reserve.edto.eprice);
        $("#message").val(reserve.message);
        $(".modal").modal("show");
            
    });
        
}

function get(rnum) {
    return fetch(`/reserve/${rnum}`,{method: 'get'})
           .then(response => response.json())
           .catch(console.log);
}