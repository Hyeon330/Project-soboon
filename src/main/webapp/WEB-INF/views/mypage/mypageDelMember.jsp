<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
	#mypageContainer {
		height: 500px;
	  	margin-top: 50px;
	  	background-color:RGB(252, 249, 248);
	  }
	#mypageContainer>div {
		float: left;
	}
	#button_overlapCheck ,.btn-last {
		background:rgb(239, 136, 105) !important;
		border-style: none !important;
	}
	.viewPage-mypage>hr {		
		height: 5px; background: #ddd; border-style: none;
	}
	.div1 {
		display: none;
	}
	#selectBoxForDel, #pwdForCheck {
		background-color: transparent; border-style: none; border-bottom: 2px solid #ddd;
	}
	#delFrm span {
		font-size: 1.1em;
	}
	#delFrm ul {
		margin-bottom: 30px;
	}
</style>
<script>
$(function() {
	  $('#selectBoxForDel').change(function() {
	    var result = $('#selectBoxForDel>option:selected').val();
	    if (result === 'reason4') {
	      $('.div1').show();
	    } else {
	      $('.div1').hide();
	    }
	  }); 
	  
	  $('#delFrm').submit(function(){
		  var reason = $('#selectBoxForDel>option:selected').val();
		  if(reason === '') {
			  alert('회원 탈퇴를 사유를 선택해주세요.');
			  $('#selectBoxForDel').focus();
			  return false;
		  }
		  if(reason === 'reason4') {
			  if($('#directReason').val() === '') {
				  alert('회원탈퇴 기타 사유를 적어주세요.');
				  $('#directReason').focus();
				  return false;
			  }
		  }
		  if($('#pwdForCheck').val()===''||$('#pwdForCheck').val()!=="${vo.userpwd}") {
			  alert('기존 비밀번호와 일치하지 않습니다.\n다시 확인해주시기 바랍니다.');
			  $('#pwdForCheck').focus();
			  return false;
		  }
		  
		  
		  return true;
	  });

	
});
</script>


<div class="container" id="mypageContainer">
<!--   사이드 메뉴 (include) -->
	<%@ include file="/WEB-INF/views/inc/mypageSideBar.jsp" %>

<!--  view -->
	<div id="delMemberView" style="width:65%; height:100%;"class="viewPage-mypage" >
		<h1>회원 탈퇴</h1>
		<hr/>
		<form id="delFrm" method="post" action="/mypage/delMemberOk" class="formFrm-YES">
			<div style="width:100%; height: 80%;">
				<ul>
					<li><span>회원 탈퇴 신청 전, 반드시 확인해주세요.</span></li>
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
					<li><span>마지막으로, 회원탈퇴를 위한 고객님의 비밀번호를 입력해주세요.</span></li>
					<li>
						<input type="password" id="pwdForCheck" name="pwdForCheck" placeholder="PASSWORD"/>	
					</li>
					
				</ul>
			</div>
			<div style="width:100%; height: 90px;"><input type="submit" class="btn btn-success btn-last" value="탈퇴" id="btn_delMember"/></div>
		</form>
	</div>
</div>