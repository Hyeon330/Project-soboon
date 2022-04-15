$(function(){	
	$(".searchId-btn").click(function(){
		if($(".searchinfo_tel").css("display")=="none" && $(".searchinfo_email").css("display")=='none'){
			alert("핸드폰번호로 아이디찾기 혹은 이메일로 아이디찾기 버튼을 눌러주세요.");
			return false;
		}
		if($("#searchinfo_email").css("display")=='block'){
			if ($("#searchinfo_email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#searchinfo_email").focus();
				return false;
			}
			reg = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if (!reg.test($("#searchinfo_email").val())) {
				alert("이메일을 잘못 입력하였습니다. \n예시)example@domain.xxx");
				$("#searchinfo_email").focus();
				return false;
			}
			alert($("#searchinfo_email").val()+" 확인!!!!");
		}
		if($("#searchinfo_tel").css("display")=='block'){
			if($("#searchinfo_tel").val()==''){
				alert("휴대폰 번호를 입력해주세요.");
				$("#search_tel").focus();
				return false;
			}
			reg = /^(010)[0-9]{3,4}[0-9]{4}$/;
			if (!reg.test($("#searchinfo_tel").val())) {
				alert("휴대폰 번호를 잘못 입력하였습니다. \n예시)01011111111");
				$("#searchinfo_tel").focus();
				return false;
			}
			alert($("#searchinfo_tel").val()+"확인");
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
		$("#searchinfo_email").css("display", "block");
		$(".searchinfo_searchemail").css("display", "none");
	});
	
		
});
