<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/mypage.css" type="text/css" />

<script>
	let idx=1; // 전역변수
	/*------------------------------on load----------------------------------------*/
	$(function() {
	
		/*-----------------------------------on load-------------------------------------*/
		ajaxSend_mp(idx, 10); 
		/*--------------------------------------tab 클릭시-----------------------------------------*/
		$('.nav-item').click(function(){
			idx = $(this).index()+1;
			ajaxSend_mp(idx, 10); 
		});
		
		/*--------------------------------------select 클릭시 범위 설정변경--------------------------------*/
		
		$('#mypostSelect').change(function(){
			areaNum = Number($(this).val());
			console.log('areaNum--->',areaNum);
			ajaxSend_mp(idx, areaNum); 
		});
		
	});
	//$(documnt).onload
	
	// javascript 함수 작성
	// ajax로 보내기
	 function ajaxSend_mp(idx, num) {
		let url = "";
		url = "/mypage";
		
		if (idx === 1) {
			url += "/mypost";

		} else if (idx === 2) {
			url += '/mycomment';
		} else {
			url += '/myfavorite';
		}
		console.log('ajax돌입', num);
		$.ajax({
			url : url,
			type : 'GET',
			data :  {
				onePageRecord : num
			},
			success : function(dataArr) {
				if (idx === 1) {
					console.log('######### idx=1 통과######');
					showMyPost(dataArr, num);
				} else if (idx === 2) {
					showMyComment(dataArr, num);
				} else {
					showMyFavorite(dataArr, num);
				}
				
			},
			error : function(e) {
				alert('데이터 받는 도중에 에러발생!');
				console.log('데이터 받는 도중에 에러!!!');
			}

		});//$.ajax
	}//jaxToss
	
	function showMyPost(dataArr, num) {
		var str = "";
		/*<ul>
			<li><input type="checkbox" id="cbx_chk_mypageAll_mypage" />전체선택</li>
			<li>&nbsp;</li>
			<li>제목</li>
			<li>작성일</li>
			<li>조회수</li>
		</ul>
		<ul>
			<li><input type="checkbox" name="chk_mypage" /></li>
			<li>11231</li>
			<li>휴지통 공구합니다.</li>
			<li>2022.04.28</li>
			<li>30</li>
		</ul>*/
		// form - enter
		
		//헤더
		str += "<ul>";
		str += "<li><input type='checkbox' id='allCheck'/> 전책선택</li>";
		str += "<li>&nbsp;</li>";
		str += "<li>제목</li>";
		str += "<li>내용</li>";
		str += "<li>조회수</li>";
		str += "<li>작성일</li>";
		str += "</ul>";
		//본문
		$.each(dataArr.plist, function(i, data){
			//db에 가져올 데이터들
			str += "<ul>";
			str += "<li><input type='checkbox' name='nolist' value='"+data.no+"' class='chk'/></li>";
			str += "<li>"+data.no+"</li>";
			str += "<li>"+data.title+"</li>";
			str += "<li>"+data.content+"</li>";
			str += "<li>"+data.views+"</li>";
			str += "<li>"+data.createdate+"</li>";
			str += "</ul>";
		});
		// form - exit
		// 한 페이지당 10명 기준
		 
		console.log('totalRecord--->'+ dataArr.pVO.totalRecord);
		console.log('totalPage----->'+ dataArr.pVO.totalPage);
		
		
		//페이지 네비게이션 문자열 만들기
		let pageStr = "<br/>";
		pageStr+='<ul class="pagination" id="paging-mp">';
		pageStr+='<li class="page-item"><a class="page-link" id="prevBtn">Prev</a></li>';
		for(var p=1; p <= dataArr.pVO.onePageCount; p++){
			pageStr += '<li class="page-item"><a class="page-link"href="javascript:void(0);" onclick="ml2('+p+', '+num+')">' + p + '</a></li>'
		}
		pageStr += '<li class="page-item"><a class="page-link" id="nextBtn" onclick=nextpg('+(dataArr.pVO.currentPage+1)+')>Next</a></li>'
		pageStr +='</ul>';
		$('#inTab1').html(str);
		$('.pagingwrap').html(pageStr);	
	}//showPost in sucess in ajax
	
	function ml2(p, num) {
		let url = "/mypage/mypost" 
		data = {
				pageNum : p,
				onePageRecord : num	
		}
		console.log("data.onePageRecord",data.onePageRecord);

		$.ajax({
			url: url,
			dateType:'json',
			data : data,
			success:function(dataArr){
				showMyPost(dataArr, num);
			}
		});
	}
	function nextpg() {
		let url = "/mypage/mypost"
		data = {
				currentPage : p + 1
		}
	}
	
	/*$(function(){
		//--------------------내가 쓴 게시글 -----------------------
		// 체크박스 전체선택 ---> 하위 체크박스 체크
		$(document).on('click', "#cbx_chk_mypageAll_mypage", function() {
			if ($("#cbx_chk_mypageAll_mypage").is(":checked"))
				$("input[name=chk_mypage]").prop("checked", true);
			else
				$("input[name=chk_mypage]").prop("checked", false);
		});

		$("input[name=chk_mypage]").click(function() {
			var total = $("input[name=chk_mypage]").length;
			var checked = $("input[name=chk_mypage]:checked").length;

			if (total != checked)
				$("#cbx_chk_mypageAll_mypage").prop("checked", false);
			else
				$("#cbx_chk_mypageAll_mypage").prop("checked", true);
		});
	});*/
	
	$(function(){
		$(document).on('click', "#allCheck", function() {
			$(".chk").prop("checked", $("#allCheck").prop("checked"));
		});
	
	});
</script>

<div id="mypageContainer">
	<!--   사이드 메뉴 (include) -->
	<%@ include file="/WEB-INF/views/inc/mypageSideBar.jsp"%>

	<!--  view -->
	<div style="width: 75%; height: 100%;" class="viewPage-mypage">
		<h3>내가 쓴 글보기</h3>
		<hr/>
		<br/>
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
						<div>${mpCnt }</div>
					</div>
				</div>
				<div>
					<div>
						<div>댓글</div>
						<div>${mrCnt }</div>
					</div>
				</div>
				<div>
					<div>
						<div>찜한글</div>
						<div>3</div>
					</div>
				</div>
			</div>
		</div>
		<!-- topMenu-mypageView -->
		<!-- <div class="listMenuTab"> -->
		<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
		<!-- 탭메뉴 영역 -->
		<ul class="tabs nav nav-tabs">
			<li id="t1" class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#tab1">작성글</a></li>
			<li id="t2" class="nav-item"><a class="nav-link"
				data-toggle="tab" href="#tab2">댓글</a></li>
			<li id="t3" class="nav-item"><a class="nav-link"
				data-toggle="tab" href="#tab3">찜한글</a></li>
		</ul>
		<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
		<div class="tab-content">
			<!-- Content -->
			<div id="tab1" class="tab-pane fade show active">
				<div class="innerTab">
					
					<div class="tabTopMenu">
						<h1>tab1</h1>
	<!-- ------------------------------------------------------------------------------------- -->
						<select name="boardArea-mp" id="mypostSelect">
							<option value="5" >5개</option>
							<option value="10" selected>10개</option>
						</select>
	<!-- ------------------------------------------------------------------------------------- -->
					</div>
					<!-- 페이징 목록 -->
					<div id="inTab1"></div>
					<div class="pagingwrap">
						
					</div>
					<div><button id="delPost">삭제하기</button></div>
				</div><!-- innerTab -->
			</div>
			<!-- tab1 -->
			<div id="tab2" class="tab-pane fade">
				<h1>TAB2</h1>
				<div class="innerTab"></div>
			</div>
			<!-- tab2 -->
			<div id="tab3" class="tab-pane fade">
				<div class="innerTab">
					<h1>TAB3</h1>
					내용내용내용내용내용
				</div>
			</div>
			<!-- tab3 -->
		</div>
		<!-- resultView-mypageView" -->
	</div>
	<!-- viewpage-mypage  -->
</div>
<!-- container -->
