function memberCheck(){
	var reg = /^[a-zA-Z]{1}[a-zA-Z0-9_]{5,11}$/;
	if(sessionStorage.getItem('kakao') != 'Y'){
		if($("#userid").val()==""){
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return false;
		}
		if(!reg.test($("#userid").val())){
			alert("아이디를 잘못 입력하였습니다.\n아이디는 6~12 사이여야 합니다.\n아이디는 영문자로 시작해야합니다.");
			$("#userid").focus();
			return false;
		}
		
		reg = /^[a-zA-Z0-9~!@#^*_]{7,15}$/;
		if($("#userpwd").val()==''){
			alert("비밀번호를 입력하세요.");
			$("#userpwd").focus();
			return false;
		}
		if (!reg.test($("#userpwd").val())) {
			alert("비밀번호를 잘못 입력하였습니다.\n비밀번호는 8~20자의 영문 소대문자, 숫자와 특수기호 '~!@#^*_'만 사용 가능합니다.");
			$("#userpwd").focus();
			return false;
		}
		if ($("#userpwd").val() != $("#userpwd2").val()) {
			alert("비밀번호가 일치하지 않습니다.\n다시 입력해주세요.");
			$("#userpwd2").focus();
			return false;
		}
		
		reg = /^[a-zA-Z가-힣]{2,7}$/;
		if($("#username").val()==''){
			alert("이름을 입력하세요.");
			$("#username").focus();
			return false;
		}
		if (!reg.test($("#username").val())) {
			alert("이름을 잘못 입력하였습니다. 이름은 2~7글자내로 입력하셔야 합니다.");
			$("#username").focus();
			return false;
		} 
	}
	reg = /^[가-힣]{2,7}$/;
	if($("#nickname").val()==''){
		alert("닉네임을 입력하세요.");
		$("#nickname").focus();
		return false;
	}
	if (!reg.test($("#nickname").val())) {
		alert("닉네임을 잘못 입력하였습니다. 닉네임은 2~7글자내로 입력하셔야 합니다. 한글만 가능합니다.");
		$("#nickname").focus();
		return false;
	}  
	
	var tel = $("#tel1").val() + "-";
		tel += $("#tel2").val() + "-";
		tel += $("#tel3").val();
	reg = /^(010|02|031|032|041|043|051|061)[-][0-9]{3,4}[-][0-9]{4}$/;
	if (!reg.test(tel)) {
		alert("전화번호를 잘못 입력하였습니다.");
		$("#tel1").focus();
		return false;
	}
	if($("#smsCode").val()==''){
		alert("핸드폰 인증을 해주세요!");
		$("#tel1").focus();
		return false;
	}
	if($("#sms-btn2").prop("disabled")==false){
		alert("인증번호를 작성 후 인증 버튼을 눌러주세요.");
		return false;
	}
	reg=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;	
	if($("#email").val()==''){
		alert('이메일을 입력하세요.');
		$("#email").focus();
		return false;
	}
	if (!reg.test($("#email").val())) {
		alert("이메일을 잘못 입력하였습니다. \n예시)example@naver.com");
		$("#email").focus();
		return false;
	}
	
	if($("#addrLarge").val()==''){
		alert("시를 선택하세요.");
		$("#addrLarge").focus();
		return false;
	}
	if($("#addrMedium").val()==''){
		alert("구를 선택하세요.");
		$("#addrMedium").focus();
		return false;
	}
	if($("#addrSmall").val()==''){
		alert("동을 선택하세요.");
		$("#addrSmall").focus();
		return false;
	}
}
$(function() {
	$("#userid").keyup(function() {
		var userid = $("#userid").val();
		if (userid != '' && userid.length >= 6) {
			var url = "/member/memberIdCheck";
			$.ajax({
				url: url,
				data: "userid=" + userid,
				type: "post",
				success: function(res) {
					if (res > 0) {
						$("#chk").html("사용불가합니다.");
						$("#idChk").val('N');
						$("#chk").css("color", "red");
					} else {
						$("#chk").html("사용가능합니다.");
						$("#idChk").val('Y');
						$("#chk").css("color", "green");
					}
				}
			});
		} else {
			$("#chk").html("사용불가합니다.");
			$("#idChk").val('N');
			$("#chk").css("color", "red");
		}
	});
	$("#nickname").keyup(function() {
		var nickname = $("#nickname").val();
		if (nickname != '') {
			var url = "/member/memberNicknameCheck";
			$.ajax({
				url: url,
				data: "nickname=" + nickname,
				type: "post",
				success: function(res) {
					if (res > 0) {
						$("#nchk").html("사용불가합니다.");
						$("#nickChk").val('N');
						$("#nchk").css("color", "red");
					} else {
						$("#nchk").html("사용가능합니다.");
						$("#nickChk").val('Y');
						$("#nchk").css("color", "green");
					}
				}
			});
		} else {
			$("#nchk").html("사용불가합니다.");
			$("#nickChk").val('N');
			$("#nchk").css("color", "red");
		}
	});
	$("#email").keyup(function() {
		var email = $("#email").val();
		if (email != '') {
			var url = "/member/memberEmailCheck";
			$.ajax({
				url: url,
				data: "email=" + email,
				type: "post",
				success: function(res) {
					if (res > 0) {
						$("#echk").html("사용불가합니다.");
						$("#emailChk").val('N');
						$("#echk").css("color", "red");
					} else {
						$("#echk").html("사용가능합니다.");
						$("#emailChk").val('Y');
						$("#echk").css("color", "green");
					}
				}
			});
		} else {
			$("#echk").html("사용불가합니다.");
			$("#emailChk").val('N');
			$("#echk").css("color", "red");
		}
	});
	$.ajax({
		url: '/addr/getLargeAddr',
		type: 'get',
		success: function(result) {
			$('#addrLarge').html('<option value="">선택안함</option>');
			result.forEach(largeData => {
				$('#addrLarge').append('<option value="' + largeData + '">' + largeData + '</option>');
			})
		}
	});
	$('#addrLarge').on('change', function() {
		document.getElementById('addrMedium').options.length = 1;
		document.getElementById('addrSmall').options.length = 1;
		if ($('#addrLarge').val() != '') {
			$.ajax({
				url: '/addr/getMediumAddr',
				data: 'large=' + $(this).val(),
				type: 'get',
				success: function(result) {
					console.log(result);
					result.forEach(d => {
						$('#addrMedium').append('<option value="' + d + '">' + d + '</option>');
					})
				}
			});
		}
	});
	$('#addrMedium').on('change', function() {
		document.getElementById('addrSmall').options.length = 1;
		if ($('#addrMedium').val() != '') {
			$.ajax({
				url: '/addr/getSmallAddr',
				data: 'large=' + $('#addrLarge').val() + '&medium=' + $(this).val(),
				type: 'get',
				success: function(result) {
					result.forEach(smallData => {
						$('#addrSmall').append('<option value="' + smallData + '">' + smallData + '</option>');
					})
				}
			});
		}
	});
	
	//눈 아이콘 눌러서 비밀번호 확인하기
	$(".pwd_control i").on('click',function(){
		$("input").toggleClass('active');
		if($("input").hasClass('active')){
			$(this).attr('class',"fa fa-eye-slash fa-lg").prev('input').attr('type','text');
		} else{
			$(this).attr('class',"fa fa-eye fa-lg").prev('input').attr('type',"password");
		}
	});
});

// SMS문자 인증 ---------------------------------------------------
$(document).on('click','#sms-btn1',function(){ //sms인증 버튼 클릭했을 때
	let tel = $("#tel1").val() + $("#tel2").val() + $("#tel3").val(); //사용자가 입력한 번호
	var authCode = $("#authCode");

	//사용자가 입력한 전화번호가 공백이 아니고, 11자리 이상일 경우
	if(tel != '' && tel.length>10){
		$.ajax({
			url:'/member/memberTelCheck',
			method:'get',
			data:{'tel':tel},
			success:function(res){
				authCode.attr('value', res);
				$(".sms").css("display","block");
				$("#smsCode").attr("disabled", false);
				
				alert('인증번호가 발송 되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
				$(".signup-tel").attr("readonly",true);
				$("#sms-btn1").attr("disabled",true);
			}, error:function(){
				alert('인증번호 발송에 실패하였습니다.\n잠시 후 다시 시도해주시기 바랍니다.');
			}
		});
	}else{
		alert("휴대폰 번호를 입력해 주세요");
	}
	
	// 인증번호 확인
	$("#sms-btn2").click(function() {
		if ($("#smsCode").val() == $("#authCode").val()) {
			$("#smsCode").attr("disabled", true);
			alert("인증 완료되었습니다.");
			$("#sms-btn2").attr("disabled",true);
		} else {
			alert("인증번호가 일치하지 않습니다. 다시 확인해주시기 바랍니다.");
			$("#smsCode").attr("autofocus", true);
		}
	});
});
