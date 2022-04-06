<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#memberFrm li{
	float:left;
	height:50px;
	line-height:30px;
	width:20%;
	text-align:center;
	
}
#memberFrm li:nth-child(2n+1){
	font-weight:bold;
	margin-left:30px;
	padding:5px;
}
#memberFrm li:nth-child(2n){
	width:70%;
}
#memberFrm li:last-of-type{
	width:100%;
	margin-top:30px;
}
h2{
	margin:50px;
	text-align:center;
}
#userid,
#userpwd,
#userpwd2,
#username,
#email,
#nickname,
#tel1,#tel2,#tel3,
#addr{
	width:40%;
	border:none;
	border-bottom:2px solid #adadad;
	outline:none;
	color:#636e72;
	font-size:16px;
	height:25px;
	background:none;
}
#userid, #nickname{
	width:25%;
	margin-right:20px;
}
#tel1,#tel2,#tel3{
	width:49px;
}
#tbtn{
	margin-left:20px;
	width:60px;
}
</style>
<div class="container">
	<h2>회원가입</h2>
	<hr/>
	<form method="post" action="/member/signup" id="memberFrm">
		<ul>
			<li>아이디</li>
			<li>
				<input type="text" name="userid" id="userid" placeholder="아이디" />
				<input type="button" value="중복확인" /> 
				<span id="chk"></span> 
				<input type="hidden" id="idChk" value="N" />
			</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호" /></li>
			<li>비밀번호확인</li>
			<li><input type="password" name="userpwd" id="userpwd2" placeholder="비밀번호확인" /></li>
			<li>이름</li>
			<li><input type="text" name="username" id="username" placeholder="이름" /></li>
			<li>닉네임</li>
			<li>
				<input type="text" name="nickname" id="nickname" placeholder="닉네임" />
				<input type="button" value="중복확인" />
				<span id="nchk"></span> 
				<input type="hidden" id="nickChk" value="N" />
			</li>
			<li>연락처</li>
			<li>
				<input type="text" name="tel1" id="tel1" maxlength="3" /> - 
				<input type="text" name="tel2" id="tel2" maxlength="4" /> -
				<input type="text" name="tel3" id="tel3" maxlength="4" />
				<input type="button" id="tbtn" value="인증"/>
			</li>
			<li>이메일</li>
			<li><input type="text" name="email" id="email" /></li>
			<li>주소</li>
			<li><input type="text" name="addr" id="addr" /></li>
			<li><input type="submit" class="btn btn-gold" value="가입하기" style="width:100px;height:35px;" /></li>
		</ul>
	</form>
</div>

