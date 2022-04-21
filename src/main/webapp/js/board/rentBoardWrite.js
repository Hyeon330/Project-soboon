$(function(){
	CKEDITOR.replace("writeContent", {
		height:'400px',
		startupFocus : false,
	});

	
	$("#uploadBtn").click(function(){
		if($("#innerFiles").css("display")=='none'){
			$("#innerFiles").show();
		}else{
			$("#innerFiles").hide();
		};
	});
	
	$("#rentForm").submit(function(){
		if($("#rentBoardTitle").val()==''){
			alert("🚫 제목을 입력해주세요");
			return false;
		}
		if(CKEDITOR.instances.writeContent.getData()==''){
			alert("🚫 내용을 입력해주세요");
			return false;
		}
		if($("#price").val()==''){
			alert("🚫 가격을 입력해주세요");
			return false;
		}
	});
	
	$("#resetBtn").on('click', function(){
		CKEDITOR.instances.writeContent.setData("");
	});
	
	$("#backList").click(function(){
		location.href="/board/shareBoardList";
	})
	
});