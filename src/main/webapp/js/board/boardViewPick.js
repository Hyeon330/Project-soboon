$(function(){

	// 찜하기 버튼을 클릭하면 하트 + 찜(버튼)이 나오고 Pick DB insert, board DB +1
	$("#pick1").on('click', function(){
		console.log($("#pick1").hasClass('pick2'))
		if(!$("#pick1").hasClass('pick2')){
			$.ajax({
			url: '/board/insertPick',
				data: 'no='+$('#category').attr('title'),
				type: 'get',
				success: function() {
					alert("찜했습니다!!");
					$("#pick1").addClass("pick2");
				}
			});
		
		}else{ // 찜하기 취소 버튼을 클릭하면 Pick DB delete, board DB -1
			if(confirm("이미 찜한 게시글입니다. 찜하기를 취소시겠습니까?")){
				$.ajax({
					url:'/board/deletePick',
					data:'no='+$('#category').attr('title'),
					type:'get',
					success: function() {
						alert("찜하기가 취소되었습니다!!");
						$("#pick1").removeClass("pick2");
					} 
				});
			}	
		}
		
	});
			
});


