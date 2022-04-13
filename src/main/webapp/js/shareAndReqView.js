$(function(){
	function selectReplyList(){ // 댓글 목록 가져오기
		let url = "/reply/replyList";
		let data = $("#replyno").val();
		$.ajax({
			url:url,
			data:data,
			success:function(result){ 
			}
		});
	}
		
});
