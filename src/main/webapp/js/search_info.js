$(function(){	
	$(".searchId-btn").click(function(){
		//이름입력
		reg = /^[a-zA-Z가-힣]{2,7}$/;
		if ($("#searchinfo_name").val() == '') {
			alert("이름을 입력하세요.");
			$("#searchinfo_name").focus();
			return false;
		}
		if (!reg.test($("#searchinfo_name").val())) {
			alert("이름을 잘못 입력하였습니다. 이름은 2~7글자내로 입력하셔야 합니다.");
			$("#searchinfo_name").focus();
			return false;
		}
		
		if($(".searchinfo_tel").css("display")=="none" && $(".searchinfo_email").css("display")=='none'){
			alert("핸드폰번호로 아이디찾기 혹은 이메일로 아이디찾기 버튼을 눌러주세요.");
			return false;
		}
		
		//이메일로 아이디 찾기
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
			$.ajax({
				data:{
					username:$("#searchinfo_name").val(),
					email:$("#searchinfo_email").val()
				}, url:'/member/searchid_email',
				type:'post',
				success:function(res){
					if(res==''){
						alert("찾으시는 정보가 존재하지 않습니다.\n 다시 입력해주세요.");
						return ;
					}
					alert("찾으시는 아이디는 " + res);
					location.href="/member/search_info";
				}
			})
		}
		
		//휴대폰번호로 아이디찾기
		if($("#searchinfo_tel").css("display")=='block'){
			if($("#searchinfo_tel").val()==''){
				alert("휴대폰 번호를 입력해주세요.");
				$("#search_tel").focus();
				return false;
			}
			reg = /^(010)[-][0-9]{3,4}[-][0-9]{4}$/;
			if (!reg.test($("#searchinfo_tel").val())) {
				alert("정보를 잘못 입력하였습니다. \n예시)010-xxxx-xxxx");
				$("#searchinfo_tel").focus();
				return false;
			}
			$.ajax({
				data:{
					username:$("#searchinfo_name").val(),
					tel:$("#searchinfo_tel").val()
				}, url:'/member/searchid_tel',
				type:'post',
				success:function(res){
					if(res==''){
						alert("찾으시는 정보가 존재하지 않습니다.\n 다시 입력해주세요.");
						return ;
					}
					alert("찾으시는 아이디는 "+res);
					location.href="/member/search_info";
				}
			})
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
	
	$(".searchId-cancel").click(function(){
		if($("#searchinfo_tel").css("display")=="block"){
			$("#searchinfo_name").val('');
			$("#searchinfo_tel").val('');
			$("#searchinfo_tel").css("display","none");
			$(".searchinfo_searchtel").css("display","block");
			$(".searchinfo_searchemail").css("display","block");
		}
		if($("#searchinfo_email").css("display")=="block"){
			$("#searchinfo_name").val('');
			$("#searchinfo_email").val('');
			$("#searchinfo_email").css("display","none");
			$(".searchinfo_searchtel").css("display","block");
			$(".searchinfo_searchemail").css("display","block");
		}
	});
	$(".searchPwd-btn").click(function(){
		reg = /^[a-zA-Z]{1}[a-zA-Z0-9_]{5,11}$/;
		if ($("#searchinfo-id").val() == "") {
			alert("아이디를 입력하세요.");
			$("#searchinfo-id").focus();
			return false;
		}
		if (!reg.test($("#searchinfo-id").val())) {
			alert("아이디를 잘못 입력하였습니다.\n아이디는 6~12 사이여야 합니다.\n아이디는 영문자로 시작해야합니다.");
			$("#searchinfo-id").focus();
			return false;
		}
		
		reg = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if ($("#searchinfo-email2").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#searchinfo-email2").focus();
			return false;
		}
		if (!reg.test($("#searchinfo-email2").val())) {
			alert("이메일을 잘못 입력하였습니다. \n예시)example@domain.xxx");
			$("#searchinfo-email2").focus();
			return false;
		}
		alert("확인!!");
		/*$.ajax({
			data: {
				userid: $("#searchinfo-id").val(),
				email: $("#searchinfo-email2").val()
			}, url: '/member/searchpwd',
			type: 'post',
			success: function(res) {
				if (res == '') {
					alert("입력한 아이디 혹은 이메일이 잘못되었습니다.\n 확인하고 다시 입력해주세요.");
					return;
				}
				alert("찾으시는 아이디는 " + res);
				location.href = "/member/search_info";
			}
		})*/
	});
});
