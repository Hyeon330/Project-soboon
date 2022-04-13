$(function(){
	
	// 댓글 등록한 뒤 필요한 댓글 리스트 선택하는 메서드
	function selectReplyList(){
		let url = "/reply/replyList";
		let data = "no="+$('#no').val();
		$.ajax({
			url:url,
			data:data,
			success:function(result){
				let sucResult = $(result);
				
				let body = "<ul>";
				sucResult.each(function(idx,obj){
					body += "<li><div><span>"+obj.nickname+"  (" + obj.createdate + ")</span>"
					if(obj.nickname == nickname){
						body += "<span><input type='button' class='btn' value='수정'>";
						body += "<input type='button' class='btn' value='삭제' title="+obj.replyno+">";
					}
					body += "<br/>" +obj.coment+ "</span></div>"
					
					if(obj.nickname == nickname){
						body += "<div style='display:none'><form method='post'>";
						body += "<input type='hidden' name='replyno' value="+obj.replyno+">";
						body += "<textarea name='coment'>"+obj.coment+"</textarea>";
						body += "<input type='submit' class='btn' value='수정하기'></form></div>";
					}
					body += "<hr/></li>";
				});
				body += "</ul>"
				$("#replyList").html(body);
				
			},error:function(){
				console.log("리스트 보이기 실패!");
			}
		});
	}

	// 수정버튼 누르면 수정폼 보이게 하기
	$(document).on('click','#replyList input[value=수정]',function(){ // 수정버튼을 누르면      
		$(this).parent().css("display","none");                    // 댓글 폼 안보이게
		$(this).parent().parent().next().css("display", "block");  // 수정폼 보이게
	});

	// 댓글 등록하기
	$("#replyForm").on('submit', function(event){
		event.preventDefault();
		
		if($("#coment").val()==""){ // 댓글 입력 안함
			alert("댓글을 입력 후에 등록해주세요");
		}else{ // 댓글 입력
			let data = $("#replyForm").serialize(); // form데이터 보내기
			
			$.ajax({
				url :'/reply/writeOk',
				data : data,
				type : 'POST',
				success : function(result){
					$("#coment").val("");
					selectReplyList();
				},error : function(e){
					alert("로그인 후 이용해주세요");
				}
			});
		}
	});
		

	
	// 수정하기 DB연결
	$(document).on('submit','#replyList form',function(){
		event.preventDefault();
		
		$.ajax({
			url:'/reply/editOk',
			data: $(this).serialize(),
			type: 'POST',
			success:function(){
				selectReplyList();
			},error:function(){
				console.log('수정에러');
			}
		});
	});

	// 댓글 삭제하기 
	//$("#replyList input[value=삭제]").on('click',function(){
	$(document).on('click', "#replyList input[value=삭제]", function(){
		if(confirm('댓글을 삭제하시겠어요?')){
			let data = "replyno="+$(this).attr("title");
			$.ajax({
				url:'/reply/delOk',
				data:data,
				success:function(){
					selectReplyList();
				},error:function(){
					console.log('삭제에러');
				}
			});
		}
	});
	
	selectReplyList();
});


