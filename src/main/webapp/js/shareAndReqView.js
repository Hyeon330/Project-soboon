$(function(){
	

	
	
	// 댓글 등록하기
	$("#replyFrm").on('submit', function(){
		event.preventDefault();
		
		if($("#coment").val()==""){ // 댓글 입력 안함
			alert("댓글을 입력 후에 등록해주세요");
			return false;
		}else{ // 댓글 입력
			let data = $("#replyFrm").serialize(); // form데이터 보내기
			
			$.ajax({
				url :'/reply/writeOk',  
				data : data,
				type : 'POST',
				success : function(result){
					$("#coment").val("");
					selectReplyList();
					$("#replyList").html(result)
				}
			});
		}
	});
		
});

// 댓글 등록한 뒤 필요한 댓글 리스트 선택하는 메서드
function selectReplyList(){
	
}
