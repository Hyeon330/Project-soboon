$(document).ready(function(){
		// 모달창 불러오기
		$(".searchId-btn").click(function(){
			$(".background-modal").show();
		});
		// 모달창 닫기
		$(".btn-close").on('click',function(){
			$(".background-modal").hide();
		});
		
		//아이디찾기 버튼 클릭시
		
		//휴대폰 번호로 아이디찾기 버튼 클릭시
		$(".searchinfo_searchtel").on('click',function(){
			$(".searchinfo_searchemail").css("display","none");
			$("#searchinfo-tel").css("display","block");
			$(".searchinfo_searchtel").css("display","none");
		});
		//이메일로 아이디찾기 버튼 클릭시
		$(".searchinfo_searchemail").on('click',function(){
			$(".searchinfo_searchtel").css("display","none");
			$("#searchinfo-email").css("display","block");
			$(".searchinfo_searchemail").css("display","none");
		});
		
	});
	
	var id = "";
	var searchinfo_idClick = function(){
		$.ajax({
			type:'post',
			url:'/member/search_info?searchinfo-name='+$("#searchinfo-name").val()
					+'&searchinfo-tel='+$("#searchinfo-tel").val(),
			success:function(res){
				if(res==0){
					$("#id_value").text("회원정보를 확인해주세요.");
				} else{
					$("#id_value").text(res);
					id = res;
				}
			}
		});
	}