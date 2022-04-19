<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/mypage/mypage.css" type="text/css"/>
<script src="/js/mypage/mypageDel.js"></script>
<div id="mypageContainer">
<!--   사이드 메뉴 (include) -->
	<%@ include file="/WEB-INF/views/inc/mypageSideBar.jsp" %>

<!--  view -->
	<div id="delMemberView" style="width:75%; height:100%;"class="viewPage-mypage" >
		<h3>회원 탈퇴</h3>
		<hr/>
		<form id="delFrm" method="post" action="/mypage/delMemberOk" class="formFrm-YES">
			<div style="width:100%; height: 80%;">
				<ul>
					<li><span>※ 회원 탈퇴 신청 전, 반드시 확인해주세요.</span></li>
					<li>
						<select name="selectBoxForDel" id="selectBoxForDel">
							<option value="" selected disabled>탈퇴사유를 선택해주시기 바랍니다.</option>
							<option value="reason1">아이디 변경을 위해 탈퇴 후 재가입</option>
							<option value="reason2">사용법의 어려움</option>
							<option value="reason3">이용빈도 낮음</option>
							<option value="reason4">기타</option>
						</select>
					</li>
				</ul>
				<ul>
					<li class="div1"><span>회원 탈퇴를 기타 사유를 적어주세요.</span></li>
					<li class="div1"><input type="text" id="directReason" placeholder="탈퇴사유 직업입력(기타)"/></li>
				</ul>
				<ul>
					<li><span>※ 마지막으로, 회원탈퇴를 위한 고객님의 비밀번호를 입력해주세요.</span></li>
					<li>
						<input type="password" id="pwdForCheck" name="pwdForCheck" placeholder="PASSWORD"/>	
						<input type="hidden" id ="hiddenPwd" value= "${vo.userpwd}"/>
					</li>
					
				</ul>
			</div>
			<div style="width:100%; height: 90px;"><input type="submit" class="btn" value="회원탈퇴" id="btn_delMember"/></div>
		</form>
	</div>
</div>