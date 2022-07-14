
let reviewUL = $(".chat");//클래스가 chat인거 ->ul
let reviewPageFooter = $(".panel-footer");//클래스가 panel-footer인거 


let modal = $(".modal");
let title=$("#title").val();
let modalInputRcontent = modal.find("textarea[name='rcontent']");
 
let modalModBtn = $("#modalModBtn");
let modalRemoveBtn = $("#modalRemoveBtn");
let modalRegisterBtn = $("#modalRegisterBtn");


//댓글 조회 클릭 이벤트 처리 
$(".chat").on("click", function (e) {
 
  let rno = $(this).data("rno");
  
  get(rno)  //조회
    .then(review => { 
			modalInputRcontent.val(review.rcontent);
			modal.data("rno", review.rno);
			modal.find("button[id !='modalCloseBtn']").hide();
			
 			
			modalModBtn.show();
			modalRemoveBtn.show();
 			$(".modal").modal("show");
 			
 		});
    })

//close버튼 눌렀을 때
$("#modalCloseBtn").on("click", function (e) {
   modal.modal('hide'); //모달숨기기
});

