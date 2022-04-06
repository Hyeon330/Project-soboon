<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/signup.css" type="text/css"/>
<script src="/js/member.js"></script>
<div class="container" style="min-height:717px">
	<h2>회원가입</h2>
	<hr/>
	<form method="post" action="/member/signup" id="memberFrm" onsubmit="return memberCheck()">
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
			<li><input type="password" name="userpwd" id="userpwd2" placeholder="비밀번호확인" /></li>
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
			<li><input type="text" name="addr" id="addr" placeholder="ex) 서울시 광진구" /></li>
			<li><input type="submit" class="btn" value="가입하기" /></li>
		</ul>
	</form>
</div>
