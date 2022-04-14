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
	width: 10%;
	overflow: hidden;
	text-overflow: ellipsis;
}
 
.memberList li:nth-child(8n+1), .memberList li:nth-child(8n) { 
	width: 23%;
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
<link rel="stylesheet" href="/css/shareAndReqList.css" type="text/css"/>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	$("#delMember").click(function() {
		if($("input[name=noList]:checked").length==0) 
			return false;
		if(!confirm("선택한 레코드를 삭제하시겠습니까?")) 
			return false;
		$("#checkFrm").submit();
	});
});
</script>
<script>
	$(function() {
		ajaxsend('tab1')
			$('ul#tab li').click(function() {
			var activeTab = $(this).attr('id');
				$('ul#tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
					ajaxsend(activeTab)
				})
			});
						function ajaxsend(tab){
							/* alert(tab) */
							var url='/admin';
							if(tab=='tab1'){
								url+='/memberMgr'
							}else if (tab=='tab2'){
								url+='/reportMgr'
									$('#page').html("");
							}		
							$.ajax({
								url:url,
								dataType:'json',
								success:function(dataArr){
									/* alert(JSON.stringify(dataArr)) */
									/* var str='<table>';
									$.each(dataArr,function(i, data){
										str+="<tr><td>"+data.proName+"</td><td>"+data.price+"</td></tr>"
									})
									str+="</table>"
									$('#'+tab).html(str)*/
									if(tab=='tab1'){
										showMember(dataArr, tab)
									}else if (tab=='tab2'){
										//alert("bbb")
										
										showReport(dataArr, tab)
									}
								}			
							})
						}
						
						
						
						function showMember(dataArr, tab){
							$("#membercnt").html("현재인원 :" +dataArr.cnt +"명")
							/* alert('총회원수: '+dataArr.cnt) */
							var str='<h3>회원관리</h3>';
							//헤더 
							str +="<li><input type='checkbox' id='checkALL'></li>";
							str +="<li>아이디</li>";
							str +="<li>경고회수</li>";
							str +="<li>이름</li>";
							str +="<li>닉네임</li>";
							str +="<li>전화번호</li>";
							str +="<li>이메일</li>";
							str +="<li>주소</li>";
							
							$.each(dataArr.userList, function(i, data){
								//DB에서 가져올 데이터들
								str+="<li><input type='checkbox'></li>";
								str+="<li>"+data.userid+"</li>";
								str+="<li>"+data.warn+ "회"+"</li>";
								str+="<li>"+data.username+"</li>";
								str+="<li>"+data.nickname+"</li>";
								str+="<li>"+data.tel+"</li>";
								str+="<li>"+data.email+"</li>";
								str+="<li>"+data.address+"</li>";
								
							})
							
							let onePageRecord=10;	//한 페이지당 10명 기준
							let totalCount=Number(dataArr.cnt)	//총 인원수 integer로 가져옴
							
							//페이지수 구하기 pageCount ==> 연산하는 로직 보면서 구하기
							if(totalCount%onePageRecord == 0){
								pageCount = totalCount/onePageRecord;
							}else {
								pageCount = totalCount/onePageRecord+1;
							}
							pageCount = Math.floor(pageCount);
								/* alert(pageCount) */
							//페이지 네비게이션 문자열 만들기
							let pageStr='<br/><ul class="pagination justify-content-center" id="paging">';
								pageStr += '<li class="page-item disabled"><a class="page-link" id="prevBtn">Prev</a></li>'

								for(var p=1; p <= pageCount; p++){
									pageStr += '<li class="page-item"><a class="page-link"href="javascript:void(0);" onclick="ml('+p+')">' + p + '</a></li>'
								}
								pageStr += '<li class="page-item"><a class="page-link" id="nextBtn">Next</a></li>'
									
							pageStr +='</ul>';
							/* alert(pageStr) */
							$('.memberList').html(str);
							$('#page').html(pageStr);
						}
						function ml(p){
							//alert(p)
							var url="/admin/memberMgr?currentPage="+p+"&recordPerPage=10"
							$.ajax({
								url:url,
								dataType:'json',
								success:function(dataArr){
									showMember(dataArr, 'tab1')								
								}			
							})
						}
						function showReport(dataArr, tab){			
							var str='<h3>신고관리</h3><table>';
							$.each(dataArr,function(i, data){
								/* str+="<tr><td>"+data.proName+"</td><td>"+data.price+"</td></tr>" */
							})
							str+="</table>"
							$('#'+tab).html(str)
						}
						/* $.ajax({ 
							type: "GET", 
							url: url, 
							data: data, 
							success: success, 
							dataType: dataType 
						}); */
				
					</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs" id="tab">
					<li class="nav-item" id='tab1'><a class="nav-link active"	data-toggle="tab" href="#memberMgr">회원관리</a></li>
					<li class="nav-item" id='tab2'><a class="nav-link" data-toggle="tab" href="#reportMgr" >신고관리</a></li>
					<li class="nav-item" id='tab3'><a class="nav-link" data-toggle="tab" href="#listupMgr" id='tab3'>게시글 현황</a></li>
				</ul>
				
				<div class="tab-content">
					<br />
					<div class="tab-pane fade show active" id="memberMgr">
						<div style="float: left" id="membercnt"></div>
						<button type="button" id="multiDel" class="btn btn-outline-danger"
							style="float: right">선택 삭제</button>
						<br />
						<!-- 회원관리 -->
						<ul class="memberList">
						<!--
						<li><input type="checkbox" id="checkAll"></li>
							<li>아이디</li>
							<li>경고횟수</li>
							<li>이름</li>
							<li>닉네임</li>
							<li>전화번호</li>
							<li>이메일</li>
							<li>주소</li>
							-->
							
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
		<div id="page">
				page
		</div>
	</div>
</body>
</html>
</body>
</html>