<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#container {
	width: 1800px;
	margin: 0 auto;
	text-align: center;
}

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
.tab li {
	float: left;
}
.tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
.tabcontent {
	display: none;
	background-color: rgb(0, 154, 200);
	padding: 6px 12px;
	color: #fff;
}

ul.tab li.current {
	background-color: rgb(0, 154, 200);
	color: #222;
}

.tabcontent.current {
	display: block;
}
/* =========↓↓↓========회 원 관 리========↓↓↓========= */
.memberList{text-align:center;}
.memberList li {
	float: left;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #ddd;
	width: 12%;
}

.memberList li:nth-child(8n), .memberList li:nth-child(8n+1) {
	width: 18%;
	white-space: nowrap; /*줄안바꿈*/
	overflow: hidden; /*넘친 내용 숨기기*/
	text-overflow: ellipsis; /*넘친 내용 있으면 ... 표시*/
}

.memberList li:nth-child(8n+2) {
	width: 4%;
}
/* =========↓↓↓========신 고 관 리========↓↓↓========= */
.reportList{text-align:center;}
.reportList li{
	float: left;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #ddd;
	width:20%;
}
.reportList li:nth-child(5n+4) {
	width: 36%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.reportList li:nth-child(5n+1) {
	width: 4%;
}
/* =======↓↓↓==========탈 퇴 내 역=========↓↓↓========
.resignList{text-align:center;}
.resignList li{
	float: left;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #ddd;
	width:20%;
}
.resignList li:nth-child(5n+4) {
	width: 40%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
} */
</style>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
$(function(){
	$("#checkAll").click(function() {
		$("input[name=check]").prop("checked", $("#checkAll").prop("checked"));
	});
	$("input[name=check]").click(function(){
		let total = $("input[name=check]").length;
		let checked = $("input[name=check]:checked").length;
		
		if(total != checked) $("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true);
	});
	
	// 선택한 레코드 삭제
	$("#multiDel").click(function() {
		if($("input[name=noList]:checked").length==0) return false;
		if(!confirm("선택한 레코드를 삭제하시겠습니까?")) return false;
		$("#checkFrm").submit();
	});
});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"	data-toggle="tab" href="#memberMgr">회원관리</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#reportMgr">신고관리</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#listupMgr">게시글 현황</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#resignMgr">탈퇴 내역</a></li>
				</ul>
				
				<div class="tab-content">
					<br />
					<div class="tab-pane fade show active" id="memberMgr">
						<div style="float: left">현재인원 : ${pVO.totalRecord }명</div>
						<button type="button" id="multiDel" class="btn btn-outline-danger"
							style="float: right">선택 삭제</button>
						<br />
						<!-- 회원관리 -->
						<ul class="memberList">
							<br/>
							<li><input type="checkbox" id="checkAll"></li>
							<li>아이디</li>
							<li>경고횟수</li>
							<li>이름</li>
							<li>닉네임</li>
							<li>전화번호</li>
							<li>이메일</li>
							<li>주소</li>
						
						<li><input type="checkbox" id="checkAll"></li>
							<li>soboona3b3</li>
							<li>0 회</li>
							<li>관리자</li>
							<li>관리자</li>
							<li>010-1111-2222</li>
							<li>admin@admin.co.kr</li>
							<li>서울시 강남구</li>
						</ul>
					</div>
					<div class="tab-pane fade" id="reportMgr">
						<!-- 신고관리 -->
						<ul class="reportList">
							<li><input type="checkbox" id="checkAll"></li>
							<li>아이디</li>
							<li>누적신고</li>
							<li>신고내용</li>
							<li>신고처리</li>
						</ul>
					</div>
						<!-- 게시글 현황 -->
					<div class="tab-pane fade" id="listupMgr">
						<ul class="listupList">
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"	data-toggle="tab" href="#days">일일</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#months">주간</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#months">월</a></li>
							</ul>
						</ul>
					</div>
					<!-- 	탈퇴내역
					<div class="tab-pane fade" id="resignMgr">
						<ul class="resignList">
							<li>아이디</li>
							<li>탈퇴사유</li>
							<li>탈퇴일자</li>
						</ul>
					</div> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>
</body>
</html>