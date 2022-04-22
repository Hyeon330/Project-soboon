	//전역변수
	let idx = 1;
	let areaNum1 = 10;
	let areaNum2 = 10;
	let areaNum3 = 10;
	/*------------------------------on load----------------------------------------*/
	$(function() {

		/*-----------------------------------on load-------------------------------------*/
		ajaxSend_mp(1, areaNum1);
		/*--------------------------------------tab 클릭시-----------------------------------------*/
		$('.nav-item').click(function() {
			idx = $(this).index() + 1;
			ajaxSend_mp(idx, 10);
		});

		/*--------------------------------------select 클릭시 범위 설정변경--------------------------------*/

		$('#mypostSelect').change(function() {
			areaNum1 = Number($(this).val());
			ajaxSend_mp(idx, areaNum1);
		});
		
		$('#mycommentSelect').change(function() {
			areaNum2 = Number($(this).val());
			ajaxSend_mp(idx, areaNum2);
		});
		
		$('#mypickSelect').change(function() {
			areaNum3 = Number($(this).val());
			ajaxSend_mp(idx, areaNum3);
		});
	});
	/*----------------------------------------------------------------------*/
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
			url += '/mypick';
		}
		$.ajax({
			url : url,
			type : 'GET',
			data : {
				onePageRecord : num
			},
			success : function(dataArr) {
				if (idx === 1) {
					showMyPost(dataArr, num);
				} else if (idx === 2) {
					showMyComment(dataArr, num);
				} else {
					showMyPick(dataArr, num);
				}

			},
			error : function(e) {
				alert('데이터 받는 도중에 에러발생!');
			}

		});//$.ajax
	}//jaxToss
/*--------------------------------------------------------------------------------------------*/
	function showMyPost(dataArr, num) {
		$('#mypostSelect>option').each(function(i, sel){
			if($(sel).val()==num){
				$(sel).prop('selected',true);
			}
		})
		/*------------------------------------------------------------------------------------------- */
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
		// 프로필 카운터(mypost-board)
		//헤더
		str += "<ul>";
		str += "<li><input type='checkbox' id='allCheck'/></li>";
		str += "<li>제목</li>";
		str += "<li>조회수</li>";
		str += "<li>작성일</li>";
		str += "</ul>";
		//본문
		
		$.each(
			dataArr.plist,
			function(i, data) {
				//db에 가져올 데이터들
				str += "<ul>";
				str += "<li><input type='checkbox' name='noList' value='"+data.no+"' class='chk'/></li>";
				str += "<li><a href='/board/shareBoardView?no="+ data.no + "'>" + data.title + "</a></li>";
				str += "<li>" + data.views + "</li>";
				str += "<li>" + data.createdate + "</li>";
				str += "</ul>";
			});

		//페이지 네비게이션 문자열 만들기
		let pageStr = "";
		pageStr += '<ul class="pagination" id="paging-mp">';
		// 이전 페이지
		if (dataArr.pVO.pageNum <= 1) {
			pageStr += '<li class="page-item disabled"><a class="page-link" id="prevBtn" href="javascript:void(0)"><i class="fa fa-angle-left"></i></a></li>';
		} else {
			pageStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" id="prevBtn" onclick="ml2(' + (dataArr.pVO.pageNum - 1) + ', ' + num + ', ' + idx +')"><i class="fa fa-angle-left"></i></a></li>';
		}
		//페이지
		for (var p = dataArr.pVO.startPage; p <= dataArr.pVO.startPage+dataArr.pVO.onePageCount-1; p++) {
			// 총 페이지수보다 출력할 페이지 번호가 작을 때
			if (p <= dataArr.pVO.totalPage) {
				if (p === dataArr.pVO.pageNum) {
					pageStr += '<li class="page-item active"><a class="page-link"  href="javascript:void(0)" onclick="ml2('+ p + ', ' + num + ', ' + idx +')">' + p + '</a></li>';
				} else {
					pageStr += '<li class="page-item"><a class="page-link " href="javascript:void(0)" onclick="ml2('+ p + ', ' + num + ', ' + idx +')">' + p + '</a></li>';
				}//if~else2	
			}//if1
		}//for

		//다음 페이지
		if (dataArr.pVO.pageNum >= dataArr.pVO.totalPage) {
			pageStr += '<li class="page-item disabled"><a class="page-link" href="javascript:void(0)" id="nextBtn"><i class="fa fa-angle-right"></i></a></li>';
		} else {
			pageStr += '<li class="page-item"><a class="page-link" id="nextBtn" href="javascript:void(0)" id="nextBtn" onclick="ml2(' + (dataArr.pVO.pageNum + 1) + ', ' + num + ', ' + idx +')"><i class="fa fa-angle-right"></i></li>';
		}
		pageStr += '</ul>';
		/*-----------------------출력(print)----------------------------------------------------*/
		$('#myPostCnt').html(dataArr.pVO.totalRecord);
		$('#printFrm1').html(str);
		$('.pagingwrap').html(pageStr);
	}//showPost in sucess in ajax
	
/*------------------------------------------------------------------------------------------------------------------------------------------------------*/
	function showMyComment(dataArr, num) {
		$('#mycommentSelect>option').each(function(i, sel){
			if($(sel).val()==num){
				$(sel).prop('selected',true);
			}
		})
		/*------------------------------------------------------------------------------------------- */
		var str = "";
		// form - enter
		// 프로필 카운터(mypost-board)
		//헤더
		str += "<ul>";
		str += "<li><input type='checkbox' id='allCheck2'/></li>";
		str += "<li>댓글</li>";
		str += "<li>제목</li>";
		str += "<li>작성일</li>";
		str += "</ul>";
		//본문
		$.each(
			dataArr.rlist,
			function(i, data) {
				//db에 가져올 데이터들
				str += "<ul>";
				str += "<li><input type='checkbox' name='replynoList' value='"+data.replyno+"' class='chk2'/></li>";
				str += "<li><a href='/board/shareBoardView?no="+ data.no + "'>" + data.coment + "</a></li>";
				str += "<li><a href='/board/shareBoardView?no="+ data.no + "'>" + data.title + "</a></li>";
				str += "<li>" + data.createdate + "</li>";
				str += "</ul>";
		});
		// form - exit
		// 한 페이지당 10명 기준
		//페이지 네비게이션 문자열 만들기
		let pageStr = "";
		pageStr += '<ul class="pagination" id="paging-mp">';
		// 이전 페이지
		if (dataArr.pVO.pageNum <= 1) {
			pageStr += '<li class="page-item disabled"><a class="page-link" id="prevBtn" href="javascript:void(0)"><i class="fa fa-angle-left"></i></a></li>';
		} else {
			pageStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" id="prevBtn" onclick="ml2(' + (dataArr.pVO.pageNum - 1) + ', ' + num + ', ' + idx +')"><i class="fa fa-angle-left"></i></a></li>';
		}
		//페이지
		for (var p = dataArr.pVO.startPage; p <= dataArr.pVO.startPage+dataArr.pVO.onePageCount-1; p++) {
			// 총 페이지수보다 출력할 페이지 번호가 작을 때
			if (p <= dataArr.pVO.totalPage) {
				if (p === dataArr.pVO.pageNum) {
					pageStr += '<li class="page-item active"><a class="page-link" href="javascript:void(0)" onclick="ml2('+ p + ', ' + num + ', ' + idx +')">' + p + '</a></li>';
				} else {
					pageStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="ml2('+ p + ', ' + num + ', ' + idx +')">' + p + '</a></li>';
				}//if~else2	
			}//if1
		}//for

		//다음 페이지
		if (dataArr.pVO.pageNum >= dataArr.pVO.totalPage) {
			pageStr += '<li class="page-item disabled"><a class="page-link" id="nextBtn" href="javascript:void(0)" ><i class="fa fa-angle-right"></i></a></li>';
		} else {
			pageStr += '<li class="page-item"><a class="page-link" id="nextBtn" href="javascript:void(0)" onclick="ml2(' + (dataArr.pVO.pageNum + 1) + ', ' + num + ', ' + idx +')"><i class="fa fa-angle-right"></i></a></li>';
		}
		pageStr += '</ul>';
		console.log(pageStr);
		/*-----------------------출력(print)----------------------------------------------------*/
		$('#myReplyCnt').html(dataArr.pVO.totalRecord);
		$('#printFrm2').html(str);
		$('.pagingwrap2').html(pageStr);		
	}//showMyComment in sucess in ajax
	
/*------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	function showMyPick(dataArr, num) {
		$('#mypickSelect>option').each(function(i, sel){
			if($(sel).val()==num){
				$(sel).prop('selected',true);
			}
		})
	/*------------------------------------------------------------------------------------------- */
		var str = "";
		// form - enter
		// 프로필 카운터(mypost-board)
		//헤더
		str += "<ul>";
		str += "<li><input type='checkbox' id='allCheck3'/></li>";
		str += "<li>제목</li>";
		str += "<li>닉네임</li>";
		str += "<li>작성일</li>";
		str += "</ul>";
		//본문
		$.each(
			dataArr.klist,
			function(i, data) {
				//db에 가져올 데이터들
				str += "<ul>";
				str += "<li><input type='checkbox' name='picknoList' value='"+data.pickno+"' class='chk3'/></li>";
				str += "<li><a href='/board/shareBoardView?no="+ data.no + "'>" + data.title + "</a></li>";
				str += "<li>" + data.nickname + "</li>";
				str += "<li>" + data.createdate + "</li>";
				str += "</ul>";
			});
		// form - exit
		// 한 페이지당 10명 기준
		//페이지 네비게이션 문자열 만들기
		let pageStr = "";
		pageStr += '<ul class="pagination" id="paging-mp">';
		// 이전 페이지
		if (dataArr.pVO.pageNum <= 1) {
			pageStr += '<li class="page-item disabled"><a class="page-link" id="prevBtn" href="javascript:void(0)"><i class="fa fa-angle-left"></i></a></li>';
		} else {
			pageStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" id="prevBtn" onclick="ml2(' + (dataArr.pVO.pageNum - 1) + ', ' + num + ', ' + idx +')"><i class="fa fa-angle-left"></i></a></li>';
		}
		//페이지
		for (var p = dataArr.pVO.startPage; p <= dataArr.pVO.startPage+dataArr.pVO.onePageCount-1; p++) {
			// 총 페이지수보다 출력할 페이지 번호가 작을 때
			if (p <= dataArr.pVO.totalPage) {
				if (p === dataArr.pVO.pageNum) {
					pageStr += '<li class="page-item active"><a class="page-link" href="javascript:void(0)" onclick="ml2('+ p + ', ' + num + ', ' + idx +')">' + p + '</a></li>';
				} else {
					pageStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="ml2('+ p + ', ' + num + ', ' + idx +')">' + p + '</a></li>';
				}//if~else2	
			}//if1
		}//for

		//다음 페이지
		if (dataArr.pVO.pageNum >= dataArr.pVO.totalPage) {
			pageStr += '<li class="page-item disabled"><a class="page-link" id="nextBtn" href="javascript:void(0)"><i class="fa fa-angle-right"></i></a></li>';
		} else {
			pageStr += '<li class="page-item"><a class="page-link" id="nextBtn" href="javascript:void(0)" onclick="ml2(' + (dataArr.pVO.pageNum + 1) + ', ' + num + ', ' + idx +')"><i class="fa fa-angle-right"></i></a></li>';
		}
		pageStr += '</ul>';
		console.log(pageStr);
		/*-----------------------출력(print)----------------------------------------------------*/
		$('#myPickCnt').html(dataArr.pVO.totalRecord);
		$('#printFrm3').html(str);
		$('.pagingwrap3').html(pageStr);		
	}//showMyPick in sucess in ajax
	
	
	/*------------------------function----------------------------------------------------------*/
	function ml2(p, num, idx) {
		let url = "";
		if(idx===1) {
			url = "/mypage/mypost";
		}else if(idx===2) {
			url = "/mypage/mycomment";
		}else {
			url = "/mypage/mypick";
		}
		data = {
			pageNum : p,
			onePageRecord : num
		}
		$.ajax({
			url : url,
			dateType : 'json',
			data : data,
			success : function(dataArr) {
				if(idx===1) {
					showMyPost(dataArr, num);
				}else if(idx===2) {
					showMyComment(dataArr, num);
				}else {
					showMyPick(dataArr, num);
				}
			}
		});
	}
	$(function() {
		/*-------------------------------------------------------------------------*/
		/*tab1 내가 쓴 글 전체선택 체크박스 적용*/	
		$(document).on('click', "#allCheck", function() {
			$(".chk").prop("checked", $("#allCheck").prop("checked"));
		});
		
		/*tab2 내 댓글 전체선택 체크박스 적용*/
		$(document).on('click', "#allCheck2", function() {
			$(".chk2").prop("checked", $("#allCheck2").prop("checked"));
		});
		
		/*tab3 내 찜한 글 전체선택 체크박스 적용*/
		$(document).on('click', "#allCheck3", function() {
			$(".chk3").prop("checked", $("#allCheck3").prop("checked"));
		});
		/*-------------------------------------------------------------------------*/
		/* tab1 내가 쓴 글 삭제하기 */
		$(document).on('click', '#delPost', function() {
			let cnt = 0;
			$(".chk").each(function(i, obj) {
				if (obj.checked) {
					cnt++; // checkbox가 체크상태일 떄
				}
			});
			if (cnt <= 0) {
				alert('목록을 선택 후 선택해주세요.');
				return false;
			}
			let params = $('#printFrm1').serialize();
			let url = "/mypage/multiDel?index=1";
			if (confirm('선택한 목록을 삭제하시겠습니까?')) {
				$.ajax({
					data : params,
					method : "POST",
					url : url,
					success : function(result) {
						if (result <= 0) {
							alert("데이터 목록 삭제를 실패하였습니다.");
						} else {
							ajaxSend_mp(idx, areaNum1);
						}
					},
					error : function(e) {
						alert('데이터 교환 중 오류발생');
					}

				});//ajax
			}//if confirm
		});
		/* tab2 내가 쓴 댓글 삭제하기 */
		$(document).on('click', '#delComment', function() {
			let cnt = 0;
			$(".chk2").each(function(i, obj) {
				if (obj.checked) {
					cnt++; // checkbox가 체크상태일 떄
				}
			});
			if (cnt <= 0) {
				alert('목록을 선택 후 선택해주세요.');
				return false;
			}
			let params = $('#printFrm2').serialize();
			let url = "/mypage/multiDel?index=2";
			if (confirm('선택한 목록을 삭제하시겠습니까?')) {
				$.ajax({
					data : params,
					method : "POST",
					url : url,
					success : function(result) {
						if (result <= 0) {
							alert("데이터 목록 삭제를 실패하였습니다.");
						} else {
							ajaxSend_mp(idx, areaNum2);
						}
					},
					error : function(e) {
						alert('데이터 교환 중 오류발생');
					}

				});//ajax
			}//if confirm
		});
		/* tab3 내가 찜한 글 삭제하기 */
		$(document).on('click', '#delPick', function() {
			let cnt = 0;
			$(".chk3").each(function(i, obj) {
				if (obj.checked) {
					cnt++; // checkbox가 체크상태일 떄
				}
			});
			if (cnt <= 0) {
				alert('목록을 선택 후 선택해주세요.');
				return false;
			}
			let params = $('#printFrm3').serialize();
			let url = "/mypage/multiDel?index=3";
			if (confirm('선택한 목록을 삭제하시겠습니까?')) {
				$.ajax({
					data : params,
					method : "POST",
					url : url,
					success : function(result) {
						console.log('>>>>>>', result);
						if (result <= 0) {
							alert("데이터 목록 삭제를 실패하였습니다.");
						} else {
							ajaxSend_mp(idx, areaNum3);
						}
					},
					error : function(e) {
						alert('데이터 교환 중 오류발생');
					}

				});//ajax
			}//if confirm
		});

	});