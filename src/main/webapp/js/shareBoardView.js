$(function(){
	// 찜하기 버튼을 클릭하면 하트 + 찜(버튼)이 나오고 Pick DB insert, board DB +1
	$("#pick1").on('click', function(){
		
		$(this).css("display", "none");
		$(this).next().css("display", "block");

		$.ajax({
			url: '/pick/insertPick',
			data: 'no='+$('#category').attr('title'),
			type: 'get',
			success: function() {
				alert("찜했습니다.");
			}
		});
	});
	
	// 찜하기 취소 버튼을 클릭하면 Pick DB delete, board DB -1
	$("#pick2").on('click', function(){
		
		$(this).css("display", "none");
		$(this).prev().css("display", "block");
		
		if(confirm("이미 찜한 게시글입니다. 찜하기를 취소시겠습니까?")){
			
		}
	});

});


