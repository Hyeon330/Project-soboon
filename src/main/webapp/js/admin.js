$(function(){

	$(document).on('click',"#fake, #multiDel",function(){
		
		event.preventDefault();	
		
		var data = $("#checkFrm").serialize();
		if(data==''){alert('체크박스 체크해주세요');return false;}
		if($(this).attr("id")=="fake"){//허위신
			data += "&fake=true";
			alert("허위신고 삭제하시겠습니까?");
		}else{
			alert("게시글 삭제하시겠습니까?");
		}
		/*alert(data)*/
		location.href="/admin/multiDel?"+data;
	});

	ajaxsend('tab1');
	$('ul#tab li').click(function() {
		var activeTab = $(this).attr('id');
		$('ul#tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
		ajaxsend(activeTab);
	});

});//jquery
		
function ajaxsend(tab){
	/* alert(tab) */
	var url='/admin';
	if(tab=='tab1'){
		url+='/memberMgr'
	}else if (tab=='tab2'){
		url+='/reportMgr'
/*				$('#page').html("");*/
	}		
	$.ajax({
		url:url,
		dataType:'json',
		success:function(dataArr){
			/*alert(JSON.stringify(dataArr))*/
			/* var str='<table>';
			$.each(dataArr,function(i, data){
				str+="<tr><td>"+data.proName+"</td><td>"+data.price+"</td></tr>"
			})
			str+="</table>"
			$('#'+tab).html(str)*/
			if(tab=='tab1'){
				/*alert("회원")*/
				showMember(dataArr, tab)
			}else if (tab=='tab2'){
				/*alert("신고")*/
				showReport(dataArr, tab)
			}
		}			
	})
}// ajaxsend


/* =================회원관리================= */
function showMember(dataArr, tab){
	$("#membercnt").html("현재인원 :" +dataArr.cnt +"명")
	/* alert('총회원수: '+dataArr.cnt) */
	//헤더 
	var str ="<br/><ul id='clientManage'>";
	str +="<li>아이디</li>";
	str +="<li>경고회수</li>";
	str +="<li>이름</li>";
	str +="<li>닉네임</li>";
	str +="<li>전화번호</li>";
	str +="<li>이메일</li>";
	str +="<li>주소</li>";
	
	$.each(dataArr.userList, function(i, data){
		//DB에서 가져올 데이터들
		str+="<li>"+data.userid+"</li>";
		str+="<li>"+data.warn+ "회"+"</li>";
		str+="<li>"+data.username+"</li>";
		str+="<li>"+data.nickname+"</li>";
		str+="<li>"+data.tel+"</li>";
		str+="<li>"+data.email+"</li>";
		str+="<li>"+data.large +" "+data.medium +" "+ data.small+"</li>";
		
	})
	str+="</ul>";
	
	let pVo = dataArr.paging;
	console.log(pVo);
	//let onePageRecord=dataArr.paging.onePageRecord;	//totalrecord/onepagerecord=페이지수계산 ex) 5개일때 출력되는 페이지수계산
	
	//페이지수 구하기 pageCount ==> 연산하는 로직 보면서 구하기
	/*if(totalCount%onePageRecord == 0){
		pageCount = totalCount/onePageRecord;
	}else {
		pageCount = totalCount/onePageRecord+1;
	}
	pageCount = Math.floor(pageCount);*/
		/* alert(pageCount) */
	//페이지 네비게이션 문자열 만들기
	let pageStr='<br/><ul class="pagination justify-content-center" id="paging">';
		//prev
		if(pVo.currentPage==1){
		pageStr += '<li class="page-item disabled"><a class="page-link" id="prevBtn"><i class="fa fa-angle-left"></i></a></li>';
		}else{
			pageStr += '<li class="page-item"><a class="page-link" id="prevBtn" href="javascript:void(0);" onclick="ml('+(pVo.currentPage-1)+')"><i class="fa fa-angle-left"></i></a></li>';
		}
		
		//current page
		for(var p=pVo.startPage; p <= pVo.startPage+pVo.onePageCount-1; p++){  //   11       11+10
	 		if(p<=pVo.totalPage){
				if(p==pVo.currentPage){
	 				pageStr += '<li class="page-item disabled"><a class="page-link">' + p + '</a></li>';
	 			}else{
					pageStr += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="ml('+p+')">' + p + '</a></li>';
				}
	 		}
		}
		
		//next
		if(pVo.currentPage==pVo.totalPage){
			pageStr += '<li class="page-item disabled"><a class="page-link" id="nextBtn"><i class="fa fa-angle-right"></i></a></li>'
		}else{
			pageStr += '<li class="page-item"><a class="page-link" id="nextBtn" href="javascript:void(0);" onclick="ml('+(pVo.currentPage+1)+')"><i class="fa fa-angle-right"></i></a></li>';
		}

		/*pageStr += '<li class="page-item"><a class="page-link" id="nextBtn" onclick=nexttpg('+(dataArr.pVO.currentPage+1)+')>Next</a></li>'*/
		
	pageStr +='</ul>';
	/* alert(pageStr) */
	$('.clientList').html(str);
	$('#page').html(pageStr);
}//setmember
function ml(p){ // ml = member list
	//alert(p)
	var url="/admin/memberMgr?currentPage="+p+"&recordPerPage=12"
	$.ajax({
		url:url,
		dataType:'json',
		success:function(dataArr){
			showMember(dataArr, 'tab1')
			
		}			
	})
}//ml

 /*=================신고관리=================*/ 
function showReport(dataArr, tab){ //showReport로 변경했음.
/*alert(JSON.stringify(dataArr))*/
	$("#reportcnt").html("신고 갯수 :" +dataArr.cnt +"개");
	$(".report-process").on('click',function() {
			var reportBtnId = $(this).attr("Id");
			if($("input[name=noList]:checked").length==0) return false;
			if(!confirm("신고 처리를 하시겠습니까?")) return false;
			console.log(reportBtnId)
			/*
			$("#checkFrm").submit(function(e){
				
				e.preventDefault();	
				console.log("aab");
				var data = $("#checkFrm").serialize();
				if(reportBtnId=="fake"){//허위신
					data += "&fake=true";
					console.log(data);
					
				}
				location.href="/admin/multiDel?"+data;
		});//*/
	});
	/* alert('총회원수: '+dataArr.cnt) */
	//헤더 
	var str ="<br/><ul id='reportManage'>"
	str +="<li>  </li>"
	str +="<li>신고한사람</li>"
	str +="<li>신고당한사람</li>"
	str +="<li>카테고리</li>"
	str +="<li>신고사유</li>"
		
	$.each(dataArr.reportList, function(i, data){
		//DB에서 가져올 데이터들
		str +="<li><input type='checkbox' name='noList' value='"+data.no+"'></li>"
		str+="<li>"+data.reporter+"</li>"
		str+="<li>"+data.suspect+"</li>"
		str+="<li>"+data.category+"</li>"
		str+="<li>"+"<a href='/board/"+data.category+"BoardView?no="+data.board_no+"'>"+data.board_no+"</a>"+ "번 " +data.report_content+"</li>"	
	})
	str+="</ul>";
			
	let pVo = dataArr.paging;
	console.log(pVo);
	//let onePageRecord=dataArr.paging.onePageRecord;	//totalrecord/onepagerecord=페이지수계산 ex) 5개일때 출력되는 페이지수계산
	
	//페이지수 구하기 pageCount ==> 연산하는 로직 보면서 구하기
	/*if(totalCount%onePageRecord == 0){
		pageCount = totalCount/onePageRecord;
	}else {
		pageCount = totalCount/onePageRecord+1;
	}
	pageCount = Math.floor(pageCount);*/
		/* alert(pageCount) */
	//페이지 네비게이션 문자열 만들기
	let pageStr='<br/><ul class="pagination justify-content-center" id="paging">';
		//prev
		if(pVo.currentPage==1){
		pageStr += '<li class="page-item disabled"><a class="page-link" id="prevBtn"><i class="fa fa-angle-left"></i></a></li>';
		}else{
			pageStr += '<li class="page-item"><a class="page-link" id="prevBtn" href="javascript:void(0);" onclick="ml2('+(pVo.currentPage-1)+')"><i class="fa fa-angle-left"></i></a></li>';
		}		
		//current page
		for(var p=pVo.startPage; p <= pVo.startPage+pVo.onePageCount-1; p++){  //   11       11+10
	 		if(p<=pVo.totalPage){
				if(p==pVo.currentPage){
	 				pageStr += '<li class="page-item" disabled><a class="page-link">' + p + '</a></li>';
	 			}else{
					pageStr += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="ml2('+p+')">' + p + '</a></li>';
				}
	 		}
		}
		
		//next
		if(pVo.currentPage==pVo.totalPage){
			pageStr += '<li class="page-item disabled"><a class="page-link" id="nextBtn"><i class="fa fa-angle-right"></i></a></li>'
		}else{
			pageStr += '<li class="page-item"><a class="page-link" id="nextBtn" href="javascript:void(0);" onclick="ml2('+(pVo.currentPage+1)+')"><i class="fa fa-angle-right"></i></a></li>';
		}

		/*pageStr += '<li class="page-item"><a class="page-link" id="nextBtn" onclick=nexttpg('+(dataArr.pVO.currentPage+1)+')>Next</a></li>'*/
		
	pageStr +='</ul>';
	/* alert(pageStr) */
	$('.reportList').html(str);
	$('#page').html(pageStr);
}//showreport

function ml2(p){ // ml = member list
	//alert(p)
	var url="/admin/reportMgr?currentPage="+p+"&recordPerPage=12"
	$.ajax({
		url:url,
		dataType:'json',
		success:function(dataArr){
			showReport(dataArr, 'tab2')
		}			
	})
}//ml2