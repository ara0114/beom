
function replaceAll(str, searchStr, replaceStr) { // replaceAll 함수 
	return str.split(searchStr).join(replaceStr); // split으로 나눠서 배열로 만들고 join으로 하나의 문자열로 만듦
}

let reviewUL = $(".chat");//클래스가 chat인거 ->ul
let reviewPageFooter = $(".panel-footer");//클래스가 panel-footer인거 
let modal = $(".modal");

// 객체 가져오기
//let rtitle=$("#rtitle").val();
let modalInputRcontent = modal.find("textarea[name='rcontent']");
let modalInputRtitle = modal.find("input[name='rtitle']");
let modalInputUid = modal.find("input[name='uid']");
let modalInputDid = modal.find("input[name='did']");
let modalInputRdate = modal.find("input[name='rdate']");
let modalInputRfilename = modal.find("img[name='rfilename']");

let addFile = modal.find("input[name='addfile']");  // 모달 이미지부분
let labelImg = $(".modal-img");


let modalModBtn = $("#modalModBtn");
let modalRemoveBtn = $("#modalRemoveBtn");
let modalRegisterBtn = $("#modalRegisterBtn");

//리뷰 삭제
modalRemoveBtn.on("click", function(e) {

	let rno = modal.data("rno");
	remove(rno)
		.then(result => {
			modal.modal("hide");
		});
});//remove


// 리뷰 수정
modalModBtn.on("click", function(e) {

	let review = { 
		rno: modal.data("rno"),
		rtitle: modalInputRtitle.val(),
		rcontent: modalInputRcontent.val() };
	update(review)
		.then(result => {
			modal.modal("hide");

		});

});//modify


// 등록 버튼을 눌렀을 때
$("#reviewCreate").on("click", function(e) {
	modalInputUid.val(uid);
	modalInputDid.val("");
	modalInputRtitle.val("");
	modalInputRcontent.val("");
	modalInputRfilename.val("");
	modal.find("button[id !='modalCloseBtn']").hide();

	modalRegisterBtn.show();

	$(".modal").modal("show");

});

// 리뷰 등록
modalRegisterBtn.on("click", function(e) { 
     

	if (modalInputRtitle.val() == '') {
		alert("제목을 입력하세요");
		return;
	}
	if (modalInputRcontent.val() == '') {
		alert("내용을 입력하세요")
		return;
	}


	let review = {   // json 객체로 만듦
		uid: modalInputUid.val(),
		did: modalInputDid.val(),
		//rstar: modalInputRstar.val(),
		//rfilename: modalInputRfilename.val(),
		rtitle: modalInputRtitle.val(),
		rcontent: modalInputRcontent.val()
		//rdate: modalInputRdate.val(),
		
		
	};
	
	add(review)
		.then(result => {
			
			modal.find("input[name='uid']").val("");
			modal.find("input[name='did']").val("");
			modal.find("div[name='rstar']").val("");
			//modal.find("img[name='rfilename']").val("");    //파일 초기화 잘 안됌...
			modal.find("input[name='rtitle']").val("");
			modal.find("textarea[name='rcontent']").val("");
			modal.find("input[name='rdate']").val("");
			
			modal.modal("hide");

		}); //end add

}); //end modalRegisterBtn.on


//리뷰 조회
$(".chat").on("click", function (e) {
 
  let rno = $(this).data("rno");
  //alert(rno);
  
  get(rno)  //조회
    .then(review => { 
			//alert(`/hairReview/storage/${review.rfilename}`);
			
			$("#rtitle").val(review.rtitle);
			modalInputRcontent.val(review.rcontent);
			modalInputUid.val(review.uid);
			modalInputDid.val(review.did);
			modalInputRfilename.attr('src',`/hairReview/storage/${review.rfilename}`);
			modalInputRdate.val(review.rdate);
			
			modal.data("rno", review.rno);
			modal.find("button[id !='modalCloseBtn']").hide();
			
			if (review.rfilename == null) {   // 올린 이미지 없이 조회할때 이미지구역 숨기기
				
				labelImg.hide();
				addFile.hide();
				modalInputRfilename.hide();
			}
			
			if (uid == review.uid) {    // 리뷰쓴 id랑 세션아이디랑 같을때만 수정, 삭제버튼 보이게
				
				modalModBtn.show();
				modalRemoveBtn.show();
			}
			
			//modalModBtn.show();
			//modalRemoveBtn.show();
 			$(".modal").modal("show");
 			
 		});
    })

//close버튼 눌렀을 때
$("#modalCloseBtn").on("click", function (e) {
   modal.modal('hide'); //모달숨기기
});

