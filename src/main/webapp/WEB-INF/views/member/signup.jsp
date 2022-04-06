<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}
</style>
<div class="container">
	<h1>회원가입</h1>
	<hr/>
	<form method="post" action="" id="" onsubmit="">
		<ul class="memberFrm">
			<li>아이디</li>
			<li>
				<input type="text" name="userid" id="userid" placeholder="아이디"/>
				<span id="chk"></span>
				<input type="hidden"/>
			</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호"/></li>
			<li>비밀번호확인</li>
			<li><input type="password" name="userpwd" id="userpwd2" placeholder="비밀번호확인"/></li>
			<li>이름</li>
			<li><input type="text" name="username" id="username" placeholder="이름"/></li>
			<li>닉네임</li>
			<li><input type="text" name="nickname" id="nickname" placeholder="닉네임"/></li>
			
		</ul>
	</form>
</div>