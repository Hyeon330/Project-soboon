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
			if($("#username").val()==''){
				alert("이름을 먼저 입력해주세요.");
				$("#username").focus();
				return false;
			}
			$(".searchinfo_searchemail").css("display","none");
			$("#tel").css("display","block");
			$(".searchinfo_searchtel").css("display","none");
		});
		//이메일로 아이디찾기 버튼 클릭시
		$(".searchinfo_searchemail").on('click',function(){
			if($("#username").val()==''){
				alert("이름을 먼저 입력해주세요.");
				$("#username").focus();
				return false;
			}
			$(".searchinfo_searchtel").css("display","none");
			$("#email").css("display","block");
			$(".searchinfo_searchemail").css("display","none");
		});
		
	});
	
	var id = "";
	var searchinfo_idClick = function(){
		$.ajax({
			type:'post',
			url:'/member/search_info?username='+$("#username").val()
					+'&tel='+$("#tel").val(),
			success:function(res){
				if(res==0){
					$("#userid").text("회원정보를 확인해주세요.");
				} else{
					$("#userid").text(res);
					id = res;
				}
			}
		});
	}