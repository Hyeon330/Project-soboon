<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
#mypageContainer {
	height: 500px;
	margin-top: 50px;
	background-color: RGB(241, 232, 223);
}

#mypageContainer>div {
	float: left;
}

#button_overlapCheck, .btn-last {
	background: rgb(239, 136, 105) !important;
	border-style: none !important;
}

.viewPage-mypage>hr {
	height: 5px;
	background: #ddd;
	border-style: none;
}

.topMemu-mypageView>div {
	float:left; display: flex; justify-content: center; align-items: center; height: 100%;
}
#postPoint>div {
	width:30%; height:80%; display: flex; justify-content: center; align-items: center;
}
.resultView-mypageView {
	height:300px; width: 100%;
}
.listMenuTab {
	width: 100%; height: 30px; display: flex; justify-content: space-between;
}
.listMenuTab ul {
	display: flex; justify-content: space-around; width: 30%; font-size:20px;
}
#postPoint>div>div>div {
	text-align: center; font-size:18px;
}
#postPoint>div>div>div:last-child {
	width:80px; 
	height: 50px; 
	line-height: 50px; 
	background-color: orange; 
	border-radius: 5px; 
	font-size: 20px;
	margin-top: 10px;
	font-weight: bold;
	color: white;
}
#postPoint {
	margin-top : -8px;
}

#image-mypage {
	margin-top : -4px;
}
#info-topMenu {
	margin-top: -5px;
}
.resultFrm>li {
	float:left;
}
.resultFrm li {
	float:left;
}
.resultFrm ul:first-of-type {
	border-top: 2px solid #ddd; 
	height: 50px; 
	padding-top : 10px; 
	margin-top: 10px;
	border-bottom: 1px solid #ddd;
}
.resultFrm ul {
	border-bottom: 1px solid #ddd; height:30px;
}
#info-topMenu>div>div {
	margin-bottom:7px;
}
.resultFrm>ul>li {
	width:20%; text-align: center;
}
.tabs>li{
		cursor:pointer;
	}
.active-tabs>span {font:ornange !important; border-bottom: 2px silid orange !important;}
</style>


<script>
	$(function(){
		
		
		//when page loads....
		$('.tab_content').hide() // 모든 콘텐츠를 숨김.
		$('ul.tabs li:first').add("active-tabs").show();//첫번째 탭 활성화
		$('.tab_content:first').show(); //첫번째 탭 콘텐츠 보여줌.
		
		//On click Event
		$('.tabs>li').click(function(){
			var idx = $('.tabs>li').index(this); 
			var activeTab = $(this).attr('id');
			console.log(activeTab);
			console.log('event');
			$('.tabs li').removeClass('active-tabs') // active클래스 사전에 모두 제거
			console.log('event2');
			$(this).addClass('active-tabs')// 선택된 탭에 active클래스 추가함.
			$('.tab_content').hide(); // 모든 탭 콘텐츠를 숨김
			console.log($('.tabs>li'));
			
			$('.tab_content').eq(idx).fadeIn('linear'); // Fade in the active ID content
		
			return false;			
		});
		// 체크박스 전체선택 ---> 하위 체크박스 체크
		$("#cbx_chk_mypageAll_mypage").click(function() {
			if($("#cbx_chk_mypageAll_mypage").is(":checked")) $("input[name=chk_mypage]").prop("checked", true);
			else $("input[name=chk_mypage]").prop("checked", false);
		});

		$("input[name=chk_mypage]").click(function() {
			var total = $("input[name=chk_mypage]").length;
			var checked = $("input[name=chk_mypage]:checked").length;

			if(total != checked) $("#cbx_chk_mypageAll_mypage").prop("checked", false);
			else $("#cbx_chk_mypageAll_mypage").prop("checked", true); 
		});
		
		
	});
</script>

<div class="container" id="mypageContainer">
	<!--   사이드 메뉴 (include) -->
	<%@ include file="/WEB-INF/views/inc/mypageSideBar.jsp"%>

	<!--  view -->
	<div style="width: 65%; height: 100%;" class="viewPage-mypage">
		<h1>내가 쓴 글보기</h1>
		<hr />
		<div class="topMemu-mypageView" style="width:100%; height: 150px">
			<div style="width:20%;" id="image-mypage">
				<i class="bi bi-person-circle" style="font-size: 100px; color: gray; padding-top:10px;"></i>
			</div>
			<div style="width:30%; height: 100%" id="info-topMenu">
				<div>
					<div>bobyshot</div>
					<div>서울시 도봉구</div>
					<div>kgh4464@naver.com</div>
				</div>
			</div>	
			<div id="postPoint" style="width:50%; height: 100%;">
				<div>
					<div>
						<div>작성글</div>
						<div>3개</div>
					</div>
				</div>
				<div>
					<div>
						<div>댓글</div>
						<div>3개</div>
					</div>
				</div>
				<div>
					<div>
						<div>찜한글</div>
						<div>3개</div>
					</div>
				</div>	
			</div>
		</div><!-- topMenu-mypageView -->
		<div class="listMenuTab">
		<!-- 탭메뉴 영역 -->
			<ul class="tabs"> 
				<li id="t1"><span>작성글</span></li>
				<li id="t2"><span>댓글</span></li>
				<li id="t3"><span>찜한글</span></li>
			</ul>
			<span>
			<select id="dataPerPage">
        		<option value="10">10개씩보기</option>
        		<option value="15">15개씩보기</option>
        		<option value="20">20개씩보기</option>
			</select></span>
		</div>
		<div class="resultView-mypageView">
			<!-- Content -->
			<div id="tab1" class="tab_content">
				<form class="resultFrm"><!-- 제목란 -->
					<ul>
						<li><input type="checkbox" id="cbx_chk_mypageAll_mypage"/> 전체선택</li>
						<li>&nbsp;</li>
						<li>제목</li>
						<li>작성일</li>
						<li>조회수</li>
					</ul>
					<ul>	
						<li><input type="checkbox"name="chk_mypage"/></li>
						<li>11231</li>
						<li>휴지통 공구합니다.</li>
						<li>2022.04.28</li>
						<li>30</li>			
					</ul>
					<ul>	
						<li><input type="checkbox" name="chk_mypage"/></li>
						<li>11231</li>
						<li>휴지통 공구합니다.</li>
						<li>2022.04.28</li>
						<li>30</li>			
					</ul>
					<ul id="pagingul"></ul>
				</form>	
			</div><!-- tab1 -->
			<div id="tab2" class="tab_content">
				<h1>TAB2</h1>
				내용내용내용내용내용
			</div><!-- tab2 -->
			<div id="tab3" class="tab_content">
				<h1>TAB3</h1>
				내용내용내용내용내용
			</div><!-- tab3 -->
		</div><!-- resultView-mypageView" -->
	</div><!-- viewpage-mypage  -->
</div><!-- container -->