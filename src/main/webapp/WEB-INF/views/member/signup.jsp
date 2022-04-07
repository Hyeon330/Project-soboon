<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/signup.css" type="text/css"/>
<script src="/js/member.js"></script>
<script>
	$(function(){
		$("#userid").keyup(function(){
			var userid = $("#userid").val();
			if(userid!='' && userid.length>=6){
				var url = "/member/memberIdCheck";
				$.ajax({
					url:url,
					data:"userid="+userid,
					type:"post",
					success:function(res){
						if(res>0){
							$("#chk").html("사용불가합니다.");
							$("#idChk").val('N');
							$("#chk").css("color","red");
						} else{
							$("#chk").html("사용가능합니다.");
							$("#idChk").val('Y');
							$("#chk").css("color","green");
						}
					}
				});
			} else{
				$("#chk").html("사용불가합니다.");
				$("#idChk").val('N');
				$("#chk").css("color","red");
			}
		});
		$("#nickname").keyup(function(){
			var nickname = $("#nickname").val();
			if(nickname!=''){
				var url = "/member/memberNicknameCheck";
				$.ajax({
					url:url,
					data:"nickname="+nickname,
					type:"post",
					success:function(res){
						if(res>0){
							$("#nchk").html("사용불가합니다.");
							$("#nickChk").val('N');
							$("#nchk").css("color","red");
						} else{
							$("#nchk").html("사용가능합니다.");
							$("#nickChk").val('Y');
							$("#nchk").css("color","green");
						}
					}
				});
			} else{
				$("#nchk").html("사용불가합니다.");
				$("#nickChk").val('N');
				$("#nchk").css("color","red");
			}
		});
	});
</script>
<div class="container" style="min-height:717px">
	<h2>회원가입</h2>
	<hr/>
	<form method="post" action="/member/memberOk" id="memberFrm" onsubmit="return memberCheck()">
		<ul>
			<li>아이디</li>
			<li>
				<input type="text" name="userid" id="userid" placeholder="아이디" />
				<input type="button" class="btn" value="중복확인" /> 
				<span id="chk"></span> 
				<input type="hidden" id="idChk" value="N" />
			</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호" /></li>
			<li>비밀번호확인</li>
			<li><input type="password" name="userpwd2" id="userpwd2" placeholder="비밀번호확인" /></li>
			<li>이름</li>
			<li><input type="text" name="username" id="username" placeholder="이름" /></li>
			<li>닉네임</li>
			<li>
				<input type="text" name="nickname" id="nickname" placeholder="닉네임" />
				<input type="button" class="btn" value="중복확인" />
				<span id="nchk"></span> 
				<input type="hidden" id="nickChk" value="N" />
			</li>
			<li>연락처</li>
			<li>
				<input type="text" name="tel1" id="tel1" maxlength="3" /> - 
				<input type="text" name="tel2" id="tel2" maxlength="4" /> -
				<input type="text" name="tel3" id="tel3" maxlength="4" />
				<input type="button" id="tbtn" class="btn" value="인증"/>
			</li>
			<li>이메일</li>
			<li><input type="text" name="email" id="email" placeholder="example@naver.com"/></li>
			<li>주소</li>
			<li><input type="text" name="address" id="address" placeholder="ex) 서울시 광진구" /></li>
			<li><input type="submit" class="btn" id="signSub" value="가입하기" /></li>
		</ul>
	</form>
</div>
