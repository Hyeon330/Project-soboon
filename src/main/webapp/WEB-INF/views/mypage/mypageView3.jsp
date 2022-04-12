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
	float: left;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
}

#postPoint>div {
	width: 30%;
	height: 80%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.resultView-mypageView {
	height: 300px;
	width: 100%;
}

.listMenuTab {
	width: 100%;
	height: 30px;
}

.listMenuTab ul {
	display: flex;
	justify-content: space-around;
	width: 30%;
	font-size: 20px;
}

#postPoint>div>div>div {
	text-align: center;
	font-size: 18px;
}

#postPoint>div>div>div:last-child {
	width: 80px;
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
	margin-top: -8px;
}

#image-mypage {
	margin-top: -4px;
}

#info-topMenu {
	margin-top: -5px;
}

.resultFrm>li {
	float: left;
}

.resultFrm li {
	float: left;
}

.resultFrm ul:first-of-type {
	border-top: 2px solid #ddd;
	height: 50px;
	padding-top: 10px;
	margin-top: 10px;
	border-bottom: 1px solid #ddd;
}

.resultFrm ul {
	border-bottom: 1px solid #ddd;
	height: 30px;
}

#info-topMenu>div>div {
	margin-bottom: 7px;
}

.resultFrm>ul>li {
	width: 20%;
	text-align: center;
}
/*TAB CSS*/
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px; /*--Set height of tabs--*/
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}

ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	/*--Subtract 1px from the height of the unordered list--*/
	line-height: 31px; /*--Vertically aligns the text within the tab--*/
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px; /*--Pull the list item down 1px--*/
	overflow: hidden;
	position: relative;
	background: #e0e0e0;
}

ul.tabs li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	/*--Gives the bevel look with a 1px white border inside the list item--*/
	border: 1px solid #fff;
	outline: none;
}

ul.tabs li a:hover {
	background: #ccc;
}

html ul.tabs li.active, html ul.tabs li.active a:hover {
	/*--Makes sure that the active tab does not listen to the hover properties--*/
	background: #fff;
	/*--Makes the active tab look like it's connected with its content--*/
	border-bottom: 1px solid #fff;
}

/*Tab Conent CSS*/
.tab_container {
	border: 1px solid #999;
	border-top: none;
	overflow: hidden;
	clear: both;
	float: left;
	width: 100%;
	background: #fff;
}

.tab_content {
	padding: 20px;
	font-size: 1.2em;
}
</style>
<script>
$(document).ready(function() {

    //When page loads...
    $(".tab_content").hide(); //Hide all content
    $("ul.tabs li:first").addClass("active").show(); //Activate first tab
    $(".tab_content:first").show(); //Show first tab content

    //On Click Event
    $("ul.tabs li").click(function() {

        $("ul.tabs li").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab_content").hide(); //Hide all tab content

        var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
        $(activeTab).fadeIn(); //Fade in the active ID content
        return false;
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
		<div class="topMemu-mypageView" style="width: 100%; height: 150px">
			<div style="width: 20%;" id="image-mypage">
				<i class="bi bi-person-circle"
					style="font-size: 100px; color: gray; padding-top: 10px;"></i>
			</div>
			<div style="width: 30%; height: 100%" id="info-topMenu">
				<div>
					<div>bobyshot</div>
					<div>서울시 도봉구</div>
					<div>kgh4464@naver.com</div>
				</div>
			</div>
			<div id="postPoint" style="width: 50%; height: 100%;">
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
		</div>
		<!-- topMenu-mypageView -->
		<div class="listMenuTab">
			<ul>
				<li>작성글</li>
				<li>댓글</li>
				<li>찜한글</li>
			</ul>
		</div>
		<div class="resultView-mypageView">
			<div id="wrapper">
				<!--탭 메뉴 영역 -->
				<ul class="tabs">
					<li><a href="#tab1">tab1</a></li>
					<li><a href="#tab2">tab2</a></li>
				</ul>

				<!--탭 콘텐츠 영역 -->
				<div class="tab_container">

					<div id="tab1" class="tab_content">
						<!--Content-->
						<h1>tab1영역</h1>
						내용 내용 내용 내용 내용 내용 <br /> 자바킹 블로그 : <a
							href="http://javaking75.blog.me">javaking75.blog.me</a>

					</div>

					<div id="tab2" class="tab_content">
						<!--Content-->
						<h1>tab2영역</h1>
						내용 내용 내용 내용 내용 내용
					</div>

				</div>

			</div>
		</div>
	</div>
	<!-- viewpage-mypage  -->
</div>
<!-- container -->