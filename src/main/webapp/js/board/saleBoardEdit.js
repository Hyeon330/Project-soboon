$(function(){
	CKEDITOR.replace("writeContent", {
		height:'400px',
		startupFocus : false,
	});
	
	let totalFile = $("#innerFiles").attr("class"); 
	
	$(".xbtn").on('click', function(){
		$(this).parent().css("display", "none");
		$(this).parent().next().attr("name", "deleteFile");
		$(this).parent().next().next().attr("type","file");
		totalFile--;
	});
	
	$("#saleEditForm").submit(function(){
		if($("#saleBoardTitle").val()==''){
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
	
	$("#backList").click(function(){
		location.href="/board/saleBoardList";
	})
	
});