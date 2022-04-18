<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>
<script src="/js/memberEdit.js"></script>
<div id="mypageContainer">
	<!--   사이드 메뉴 (include) -->
	<%@ include file="/WEB-INF/views/inc/mypageSideBar.jsp"%>

	<!--  view -->
	<div id="editView" style="width:75%; height: 100%;">
		<h3>개인정보수정</h3>
		<hr />
		<form id="editFrm" method="post" action="/mypage/mypageEditOk">
			<div style="width: 90%; height: 80%;">
				<ul id="editFrm">
					<li>
						<div style="width: 20%;">아이디</div>
						<div style="width: 5%;"></div>
						<div style="width: 75%;">
							<input type="text" id="userid" name="userid"
								value="${VO.userid }" readonly="readonly" />
						</div>
					</li>
					<li id="passwordCSS">
						<div>비밀번호</div>
						<div class="pwd_control">
							<input type="password" id="userpwd1" name="userpwd" />
							<i class="fa fa-eye fa-md"></i>
						</div>
					</li>
					<li id="passowrdCheckCSS">
						<div>비밀번호 확인</div>
						<div class="pwd_control">
							<input type="password" id="userpwd2" />
							<i class="fa fa-eye fa-md"></i>
						</div>
					</li>
					<li>
						<div style="width: 20%">이름</div>
						<div style="width: 5%;"></div>
						<div style="width: 75%">
							<input type="text" id="username" name="username"
								value="${VO.username }" readonly="readonly" />
						</div>
					</li>
					<li>
						<div style="width: 20%">닉네임</div>
						<div style="width: 5%"></div>
						<div style="width: 30%">
							<input type="text" id="nickname" name="nickname"
								value="${VO.nickname }" />
						</div>
						<div style="width: 40%">
							<button class="btn" id="button_overlapCheck">중복확인</button>
						</div> <input type="hidden" id="nicknameCheck" />
						<div id="VO_nickname_hidden">${VO.nickname }</div>
					</li>
					<li>
						<div style="width:100px;">전화번호</div>
						<div></div>
						<div style="width:24%">
							<input type="text" class="edit-tel" id="tel1" name="tel1" style="width: 80%"
								value="${VO.tel1 }" />&nbsp;&nbsp;-
						</div>
						<div style="width: 24%">
							<input type="text" class="edit-tel" id="tel2" name="tel2" style="width: 80%"
								value="${VO.tel2 }" />&nbsp;&nbsp;-
						</div>
						<div style="width: 24%">
							<input type="text" class="edit-tel" id="tel3" name="tel3" style="width: 80%"
								value="${VO.tel3 }" />
						</div>
						<div><input type="button" id="sms-btn1" class="btn signup-btn" value="SMS인증"/></div>
						<div class="sms" style="width: 10%">&nbsp;&nbsp;&nbsp;&nbsp;</div>
						<div class="sms" style="width: 80%">
							<input type="text" class="signup-sms" name="smsCode" id="smsCode" placeholder="인증번호 5자리를 입력하세요" disabled required/>
							<input type="hidden" id="authCode"/>	
							<input type="button" id="sms-btn2" class="btn signup-btn" value="인증" required/>
						</div>
					</li>
					<li>
						<div style="width: 20%">이메일</div>
						<div style="width: 5%;"></div>
						<div style="width: 75%">
							<input type="email" id="email" name="email" value="${VO.email }" />
							<span id="echk"></span> 
							<input type="hidden" id="emailChk" value="N" />
						</div>
					</li>

				</ul>
			</div>
			<div style="width: 100%; height: 90px;">
				<input type="submit" class="btn" value="수정"
					id="button_editSubmit" />
			</div>
		</form>
	</div>
</div>