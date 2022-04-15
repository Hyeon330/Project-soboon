<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/mypage.css" type="text/css"/>
<script>
	var pageSubmitFn = function(menu) {
		if(menu === 'editForm') {
			location.href="/mypage/"+menu+"?pageName="+menu;
		}
		if(menu === 'showView') {
			location.href="/mypage/"+menu+"?pageName="+menu;
		}
		if(menu === 'delMember') {
			location.href="/mypage/"+menu+"?pageName="+menu;
		}
	}
	
	$(function(){
		$(".list-group-item").removeClass('active_sub');
		
		var pageName = "<c:out value='${param.pageName}'/>";
		
		$('#'+pageName).addClass('active_sub');
		
		$('.list-group-item').click(function(){
			console.log(this);
			
			var menu = $(this).attr('id');
			
			console.log(menu);
			
			pageSubmitFn(menu);
		});
		
		
	});

</script>

<div id= "sideMenuFrm"style="width:20%; height:100%;">
		<h3>마이페이지</h3>
		<br/>
		<ul id="sideMenu"  class="list-group list-group-flush">
			<li class="list-group-item" id="showView"><a href="#" class="sidebarMenu">내가 쓴 글보기</a></li>
			<li class="list-group-item" id="editForm"><a href="#"  class="sidebarMenu">개인정보수정</a></li>
			<li class="list-group-item" id="delMember"><a href="#" class="sidebarMenu">회원탈퇴</a></li>
		</ul>
</div>
<div style="width:5%; height:100%"></div>
</body>


