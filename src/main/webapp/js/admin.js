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
	
	/* =================신고관리================= */
	function showReport(dataArr, tab){			
		var str='<h3>신고관리</h3><table>';
		/* alert('총회원수: '+dataArr.cnt) */
		//헤더 
		str +="<li><input type='checkbox' id='checkALL'></li>";
		str +="<li>아이디</li>";
		str +="<li>누적신고수</li>";
		str +="<li>신고내용</li>";
		str +="<li>신고처리</li>";
								
		$.each(dataArr.userList, function(i, data){
			//DB에서 가져올 데이터들
			str+="<li><input type='checkbox'></li>";
			str+="<li>"+data.userid+"</li>";
			str+="<li>"+data.warn+ "회"+"</li>";
			str+="<li>"+report+"</li>";
			str+="<li>"+버튼+"</li>";			
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
		var url="/admin/showReport?currentPage="+p+"&recordPerPage=10"
		$.ajax({
			url:url,
			dataType:'json',
			success:function(dataArr){
				showReport(dataArr, 'tab2')								
			}			
		})
	}
	/* $.ajax({ 
		type: "GET", 
							url: url, 
							data: data, 
							success: success, 
							dataType: dataType 
						}); */