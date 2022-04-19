<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>
<script src="/js/memberEdit.js"></script>
<div id="mypageContainer">
	<!--   사이드 메뉴 (include) -->
	<%@ include file="/WEB-INF/views/inc/mypageSideBar.jsp"%>

	<!--  view -->
	<div id="editView">
		<h3>개인정보수정</h3>
		<hr />
		<form id="editFrm" method="post" action="/mypage/mypageEditOk">
			<div id="editArea"style="width: 90%; height: 80%;">
				<ul>
					<li>아이디</li>
					<li>
						<input type="text" id="userid" name="userid" value="${VO.userid }" readonly="readonly" />
					</li>
					
					<li id="passwordCSS">비밀번호</li>
					<li class="pwd_control">
						<input type="password" id="userpwd1" name="userpwd" />
						<i class="fa fa-eye-slash fa-md"></i>
					</li>
					
					<li id="passowrdCheckCSS">비밀번호 확인</li>
					<li class="pwd_control">
						<input type="password" id="userpwd2" />
						<i class="fa fa-eye-slash      fa-md"></i>
					</li>
					
					<li>이름</li>
					<li>
						<input type="text" id="username" name="username" value="${VO.username }" readonly="readonly" />
					</li>
					
					<li>닉네임</li>
					<li>	
						<input type="text" id="nickname" name="nickname" value="${VO.nickname }" />
						<button class="btn">중복확인</button>
						<input type="hidden" id="nicknameCheck"/>
					</li>
					
					<li>전화번호</li>
					<li>
						<input type="text" class="edit-tel" id="tel1" name="tel1" value="${VO.tel1 }" />&nbsp;&nbsp;-
						<input type="text" class="edit-tel" id="tel2" name="tel2" value="${VO.tel2 }" />&nbsp;&nbsp;-
						<input type="text" class="edit-tel" id="tel3" name="tel3" value="${VO.tel3 }" />
						<input type="button" id="sms-btn1" class="btn signup-btn" value="SMS인증"/>
					</li>
						
					<li></li>
					<li>
						<input type="text" class="signup-sms" name="smsCode" id="smsCode" placeholder="인증번호 5자리를 입력하세요" disabled required/>
						<input type="hidden" id="authCode"/>	
						<input type="button" id="sms-btn2" class="btn signup-btn" value="인증" required/>
					</li>
					
					<li>이메일</li>
					<li>
						<input type="email" id="mypageEmail" name="email" value="${VO.email }" />
						<span id="echk"></span> 
						<input type="hidden" id="emailChk" value="N" />
					</li>
				</ul>
			</div>
			<div id="mypageeditSubmit"><input type="submit" class="btn" id="editSubmit" value="수정"/></div>
		</form>
	</div>
</div>