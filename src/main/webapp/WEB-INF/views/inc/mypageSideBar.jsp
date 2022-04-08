<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	var pageSubmitFn = function(menu) {
		if(menu === 'editForm') {
			location.href="/mypage/"+menu+"?pageName="+menu;
		}
		if(menu === 'showView') {
			location.href="/mypage/"+menu+"?pageName="+menu;
		}
		if(menu === 'withdrawal') {
			location.href="/mypage/"+menu+"?pageName="+menu;
		}
		
		
	}

</script>


<style>
	#sideMenu>li {
		background-color:RGB(252, 249, 248);
	}
	#sideMenuFrm>hr {
		height: 5px; background: #ddd; border-style: none;
	}
	.active {font-size:1.5em;}
</style>


<div id= "sideMenuFrm"style="width:30%; height:100%;">
		<h1>마이페이지</h1>
		<hr/>
		<ul id="sideMenu"  class="list-group list-group-flush">
			<li class="list-group-item" id="showView"><a href="#" id="myNote" class="sidebarMenu" onclick="pageSubmitFn('showView')">내가쓴글보기</a></li>
			<li class="list-group-item" id="editInfo"><a href="#" id="editInfo" class="sidebarMenu" onclick="pageSubmitFn('editForm')">개인정보수정</a></li>
			<li class="list-group-item" id="withdrawal"><a href="#" id="withdrawal" class="sidebarMenu" onclick="pageSubmitFn('withdrawal')">회원탈퇴</a></li>
		</ul>
</div>
<div style="width:5%; height:100%"></div>
</body>


