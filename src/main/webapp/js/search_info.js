$(function(){	
	$(".searchId-btn").click(function(){	
		if($(".searchinfo_1").css("display")=="none"){
			alert("핸드폰번호로 아이디찾기 혹은 이메일로 아이디찾기 버튼을 눌러주세요.");
			return false;
		}
		if($("#searchinfo_tel").val()==''){
			alert("핸드폰 번호를 입력해주세요.");
			$("#search_tel").focus();
			return false;
		}
		reg = /^(010)[0-9]{3,4}[0-9]{4}$/;
		if (!reg.test($("#searchinfo_tel"))) {
			alert("전화번호를 잘못 입력하였습니다.");
			$("#searchinfo_tel").focus();
			return false;
	}
	});

	//휴대폰 번호로 아이디찾기 버튼 클릭시
		$(".searchinfo_searchtel").on('click', function() {
			$(".searchinfo_searchemail").css("display", "none");
			$("#searchinfo_tel").css("display", "block");
			$(".searchinfo_searchtel").css("display", "none");
		});
		//이메일로 아이디찾기 버튼 클릭시
	$(".searchinfo_searchemail").on('click', function() {
		$(".searchinfo_searchtel").css("display", "none");
		$(".searchinfo_email").css("display", "block");
		$(".searchinfo_searchemail").css("display", "none");
	});
	
});
