<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<li>
						<div style="width: 20%;">비밀번호</div>
						<div style="width: 5%;"></div>
						<div style="width: 75%">
							<input type="password" id="userpwd1" name="userpwd" />
						</div>
					</li>
					<li>
						<div style="width: 20%;">비밀번호 확인</div>
						<div style="width: 5%;"></div>
						<div style="width: 75%">
							<input type="password" id="userpwd2" />
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
						<div style="width: 20%">전화번호</div>
						<div style="width: 5%;"></div>
						<div style="width: 24%">
							<input type="text" id="tel1" name="tel1" style="width: 80%"
								value="${VO.tel1 }" />&nbsp;&nbsp;-
						</div>
						<div style="width: 24%">
							<input type="text" id="tel2" name="tel2" style="width: 80%"
								value="${VO.tel2 }" />&nbsp;&nbsp;-
						</div>
						<div style="width: 24%">
							<input type="text" id="tel3" name="tel3" style="width: 80%"
								value="${VO.tel3 }" />
						</div>
					</li>
					<li>
						<div style="width: 20%">이메일</div>
						<div style="width: 5%;"></div>
						<div style="width: 75%">
							<input type="email" id="email" name="email" value="${VO.email }" />
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