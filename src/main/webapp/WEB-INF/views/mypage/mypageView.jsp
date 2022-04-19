<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/mypage/mypage.css" type="text/css" />
<script src="/js/mypage/mypageView.js"></script>


<div id="mypageContainer">
	<!--   사이드 메뉴 (include) -->
	<%@ include file="/WEB-INF/views/inc/mypageSideBar.jsp"%>

	<!--  view -->
	<div style="width: 75%; height: 100%;" class="viewPage-mypage">
		<h3>내가 쓴 글보기</h3>
		<hr />
		<br />
		<div class="topMemu-mypageView" style="width: 100%; height: 150px">
			<div style="width: 20%;" id="image-mypage">
				<i class="bi bi-person-circle"
					style="font-size: 100px; color: gray; padding-top: 10px;"></i>
			</div>
			<div style="width: 30%; height: 100%" id="info-topMenu">
				<div>
					<div>${vo.userid }</div>
					<div>${vo.large }&nbsp;${vo.medium }&nbsp;${vo.small }</div>
					<div>${vo.email }</div>
				</div>
			</div>
			<div id="postPoint">
				<div>
					<div>
						<div>작성글</div>
						<div id="myPostCnt">${mpCnt }</div>
					</div>
				</div>
				<div>
					<div>
						<div>댓글</div>
						<div id="myReplyCnt">${mrCnt }</div>
					</div>
				</div>
				<div>
					<div>
						<div>찜한 글</div>
						<div id="myPickCnt">${mkCnt }</div>
					</div>
				</div>
			</div>
		</div>
		<!-- topMenu-mypageView -->
		<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
		<!-- 탭메뉴 영역 -->
		<ul class="tabs nav nav-tabs">
			<li id="t1" class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#tab1">작성글</a></li>
			<li id="t2" class="nav-item"><a class="nav-link"
				data-toggle="tab" href="#tab2">댓글</a></li>
			<li id="t3" class="nav-item"><a class="nav-link"
				data-toggle="tab" href="#tab3">찜한 글</a></li>
		</ul>
		<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
		<div class="tab-content">
			<!-- Content -->
			<!-- ---------------------------- tab1 ---------------------------------------------- -->
			<!-- tab1 -->
			<div id="tab1" class="tab-pane fade show active">
				<div class="innerTab">
					<!-- -------------------------- 메뉴 ---------------------------------------------- -->
					<div class="tabTopMenu">
						<select name="boardArea-mp" id="mypostSelect">
							<option value="5">5개</option>
							<option value="10" selected>10개</option>
						</select>
					</div>
					<!-- ----------------------------  출력  ---------------------------------------------------- -->
					<!-- tab1 -->
					<div id="inTab1">
						<!-- 데이터 출력 -->
						<form method="post" id="printFrm1"></form>
					</div>
					<!-- --------------------------------------------------------- -->
					<!-- 페이징 목록 -->
					<div class="bottom-myView">
						<div class="pagebox">
							<div class="pagingwrap"></div>
						</div>
						<div class="buttonDel">
							<button id="delPost">삭제하기</button>
						</div>
					</div>
				</div>
				<!-- innerTab -->
			</div>
			<!-- tab1 -->
			<!-- --------------------------------------------------------------------------------------- -->
			<!-- -----------------------------tab2-------------------------------------------------- -->
			<!-- tab2 -->
			<div id="tab2" class="tab-pane fade">
				<div class="innerTab">
					<!-- -------------------------- 메뉴 ---------------------------------------------- -->
					<div class="tabTopMenu">
						<select name="boardArea-mp" id="mycommentSelect">
							<option value="5">5개</option>
							<option value="10" selected>10개</option>
						</select>
					</div>
					<!-- ----------------------------  출력  ---------------------------------------------------- -->
					<!-- tab2 출력 -->
					<div id="inTab2">
						<!-- 데이터 출력 -->
						<form method="post" id="printFrm2"></form>
					</div>
					<!-- --------------------------------------------------------- -->
					<!-- 페이징 목록 -->
					<div class="bottom-myView">
						<div class="pagebox">
							<div class="pagingwrap2"></div>
						</div>
						<div class="buttonDel">
							<button id="delComment">삭제하기</button>
						</div>
					</div>
				</div>
				<!-- innerTab -->
			</div>
		<!-- tab2 -->
		<!-- --------------------------------------------------------------------------------------- -->
		<!-- -----------------------------tab3-------------------------------------------------- -->
		<!-- tab3 -->
		<div id="tab3" class="tab-pane fade">
				<div class="innerTab">
					<!-- -------------------------- 메뉴 ---------------------------------------------- -->
					<div class="tabTopMenu">
						<select name="boardArea-mp" id="mypickSelect">
							<option value="5">5개</option>
							<option value="10" selected>10개</option>
						</select>
					</div>
					<!-- ----------------------------  출력  ---------------------------------------------------- -->
					<!-- tab3 출력 -->
					<div id="inTab3">
						<!-- 데이터 출력 -->
						<form method="post" id="printFrm3"></form>
					</div>
					<!-- --------------------------------------------------------- -->
					<!-- 페이징 목록 -->
					<div class="bottom-myView">
						<div class="pagebox">
							<div class="pagingwrap3"></div>
						</div>
						<div class="buttonDel">
							<button id="delPick">삭제하기</button>
						</div>
					</div>
				</div>
				<!-- innerTab -->
			</div><!-- tab3 -->		
	</div><!-- tab content -->
	<!-- resultView-mypageView" -->
</div>
<!-- viewpage-mypage  -->
</div>
<!-- container -->
