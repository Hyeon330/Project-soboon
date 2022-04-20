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
	
	// 첨부파일 선택 갯수
	if($("#bvoImg1").val()!=""){
		totalFile++;
	}else if($("#bvoImg2").val()!=''){
		totalFile++;
	}else if($("#bvoImg3").val()!=''){
		totalFile++;
	}else if($("#bvoImg4").val()!=''){
		totalFile++;
	}
	
	$("#shareEditForm").submit(function(){
		if($("#shareAndReqTitle").val()==''){
			alert("🚫 제목을 입력해주세요");
			return false;
		}
		if(CKEDITOR.instances.writeContent.getData()==''){
			alert("🚫 내용을 입력해주세요");
			return false;
		}
	});
	

	
	
	$("#backList").click(function(){
		location.href="/board/shareBoardList";
	})
	
});