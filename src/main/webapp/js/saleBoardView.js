$(function(){
	// 찜하기 버튼을 클릭하면 하트 + 찜(버튼)이 나오고 Pick DB insert, board DB +1
	$("#pick1").on('click', function(){

		$.ajax({
			url: '/board/insertPick',
			data: 'no='+$('#category').attr('title'),
			type: 'get',
			success: function(result) {
				alert("찜했습니다!!");
				console.log(result);
				if(result!=null){
					$("#pickDiv").html("<input type='button' class='btn' id='pick2' value='찜하기'/>");
				}
			}
		});
		
	});
	
	// 찜하기 취소 버튼을 클릭하면 Pick DB delete, board DB -1
	$("#pick2").on('click', function(){
		
		if(confirm("이미 찜한 게시글입니다. 찜하기를 취소시겠습니까?")){
			$.ajax({
				url:'/board/deletePick',
				data:'no='+$('#category').attr('title'),
				type:'get',
				success: function(result) {
					alert("찜하기가 취소되었습니다!!");
					console.log(result);
					$("#pickDiv").html("<input type='button' class='btn' id='pick1' value='찜하기'/>");
				} 
			});
		}
	});

});


