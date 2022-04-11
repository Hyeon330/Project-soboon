<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
	#mypageContainer { height: 500px; margin-top: 10px;}
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
</style>
<script>
</script>


<div class="container" id="mypageContainer">
<!--   사이드 메뉴 (include) -->
	<%@ include file="/WEB-INF/views/inc/mypageSideBar.jsp" %>

<!--  view -->
	<div id="delMemberView" style="width:65%; height:100%;"class="viewPage-mypage" >
		<h1>내가 쓴 글보기</h1>
		<hr/>
		<form id="delFrm" method="post" action="/mypage/delMemberOk" class="formFrm-YES">
			<div style="width:100%; height: 80%;">
				<i class="bi bi-person-circle" style="font-size: 100px; color: cornflowerblue;"></i>
			</div>
			<div style="width:100%; height: 90px;"><input type="submit" class="btn btn-success btn-last" value="탈퇴" id="btn_delMember"/></div>
		</form>
	</div>
</div>