$(function(){
		CKEDITOR.replace("content", {
			height:'400px',
			startupFocus : false,
		});

		$("#shareUploadBtn").click(function(){
			if($("#innerFiles").css("display")=='none'){
				$("#innerFiles").show();
			}else{
				$("#innerFiles").hide();
			};
		});
		
		$("#shareForm").submit(function(){
			if($("#writeTitle").val()==''){
				alert("🚫 제목을 입력해주세요");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==''){
				alert("🚫 내용을 입력해주세요");
				return false;
			}
		});
	});