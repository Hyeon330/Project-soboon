<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/admin.css" type="text/css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/js/admin.js"></script>
	<div class="admincontainer">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs" id="tab">
					<li class="nav-item" id='tab1'><a class="nav-link active"	data-toggle="tab" href="#memberMgr">회원관리</a></li>
					<li class="nav-item" id='tab2'><a class="nav-link" data-toggle="tab" href="#reportMgr">신고관리</a></li>
					<!-- <li class="nav-item" id='tab3'><a class="nav-link" data-toggle="tab" href="#boardMgr">게시글 현황</a></li> -->
				</ul>
				
				<div class="tab-content">
					<br />
					<!-- 회원관리 -->
					<div class="tab-pane fade show active" id="memberMgr">
						<div style="float: left" id="membercnt"></div>
						<br />
						<ul class="clientList">
						</ul>
					</div> 
				
					<!-- 신고관리 -->
					<div class="tab-pane fade" id="reportMgr">
						<div style="float: left" id="reportcnt"></div>
						<div><button id="fake" style='float:right;'>허위신고</button></div>
						<div><button id="multiDel" style="float:right; margin-right: 7px;">게시물 삭제</button></div> <!-- 31,32구분방법 -->
						<br/>
						<form method="GET" action="" id="checkFrm">
							<ul class="reportList">
								<!-- <li><input type="checkbox" id="checkAll"></li>
									<li>아이디</li>
									<li>누적신고</li>
									<li>신고내용</li>
									<li>신고처리</li>-->
							</ul> 
						</form>
					</div>					
				</div>
			</div>
		</div>
		<div id="page">
				page
		</div>
	</div>
