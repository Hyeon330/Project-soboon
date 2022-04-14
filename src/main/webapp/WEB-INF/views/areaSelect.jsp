<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/css/areaSelect.css" type="text/css"/>
<script>
	function addressKindChange(e){
		var seoul =["강남구", "송파구", "용산구"];
		var gyeonggi = ["성남시", "수원시", "남양주시", "구리시"];
		var inc = ["부평구", "계양구", "남동구"];
		var target = document.getElementById("addressKindS");
		
		if(e.value=="seoul") var d = seoul;
		else if(e.value=="gyeonggi") var d = gyeonggi;
		else if(e.value=="inc") var d = inc;
		
		target.options.length=0;
		
		for(x in d){
			var opt = document.createElement("option");
			opt.value=d[x];
			opt.innerHTML=d[x];
			target.appendChild(opt);
		}
	}
	
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
	        	
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('member_post').value = data.zonecode;
	            if(roadAddr !== ''){
	                document.getElementById("member_addr").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("member_addr").value = jibunAddr;
	            }
	        }
	    }).open();
	}
	
	/* function setSelectBox(o){
		var selectVal = o.value;
		var upper = $(o).parent().parent();	//셀렉트 박스의 상위 객체
											//위 코드에서 <div class="row">가 해당된다
		var cnt = $('select', upper).size();	//셀렉트 박스 갯수
		var idx = $('select', upper).index(o);	//현재 셀렉트 박스의 순서
		var depth = idx+1;	//선택한 selectbox가 몇 depth인지
		var level = 4+idx;	//db에 저장되어 있는 level이 3 level 이라 다음 레벨을 구하기 위해 기본값을 4level로 잡았다.
		var selectBox = $('select', upper).eq(depth);	//선택한 하위값selectbox
		var text = '<option value="">전체 </option>';	//기본으로 설정할 값
		var selectVal02 = selectVal.substring(2,4);	//선택한 코드값으로 하위 코드값을 찾기
		
		if(selecrtVal == ''){	//전체를 선택했을 경우
			$('select:gt('+idx+')',upper).html(text);	//선택한 하위값들의 값 전체로 변경		
			$('select:gt('+idx+')',div).attr("disabled", true);	//선택한 하위값들 disabled	
			return;
		}
		$.post("/setDirectoryList_ajax.do"
				, {"level":level, "selectVal":selectVal, "selectVal02":selectVal02}
				, {function(res){
					if(res.result>0){
						var dirList = eval(res.resultJList);	//jsonArray의 값을 list로
						var loop = res.resultCnt;	//반복할 횟수(뿌려질 리스트의 size)
						
						$('select:gt('+idx+')', upper).html(text);	//select한 하위값들을 모두 전체로
						selectBox.attr("disabled", false);	//선택한 하위값의 disable을 풀어준다.
						for(var i=0;i<loop;i++){
							var list = disList[i];
							//객체를 가져와 append시킨다
							selectBox.append('<option value="' +list.selectVal+'">'+list.valName+'</option>');
						}
					}
		});
	} */
</script>
<div class="entireContainer">
	<div class="addrContainer">
		<div class="form-group col-lg-5">
			<label for="addressKindB">시/도 선택</label>
			<select class="form-control" id="addressKindB" name="addressKindB" 
			onchange="addressKindChange(this)">
				<option>주소를 선택하세요</option>
				<option value="seoul">서울시</option>			
				<option value="gyeonggi">경기도</option>			
				<option value="inc">인천광역시</option>			
				<option value="kangwon">강원도</option>			
				<option value="chungcheongN">충청북도</option>			
				<option value="chungcheongS">충청남도</option>			
				<option value="gyungsangN">경상북도</option>			
				<option value="gyungsangS">경상남도</option>			
				<option value="jeollaN">전라북도</option>			
				<option value="jeollaS">전라남도</option>			
				<option value="jeju">제주도</option>			
				<option value="busan">부산광역시</option>			
				<option value="daegu">대구광역시</option>			
				<option value="gwangju">광주광역시</option>			
				<option value="daejeon">대전광역시</option>			
				<option value="ulsan">울산광역시</option>			
				<option value="sejong">세종특별자치시</option>			
			</select>
	 	</div>
	 	<div class="form-group col-lg-4">
	 		<label for="addressKindS">주소 소분류</label>
	 		<select class="form-control" id="addressKindS" name="addressKindS">
				<option></option> 		
	 		</select>
	 	</div>
	
	
	=================================================================================
		<h1>카카오 API</h1>
	
	  	<div class="form-group col-lg-4"><input id="member_post" class="form-control" type="text" placeholder="우편 번호" readonly onclick="findAddr()"></div>
	  	<div class="form-group col-lg-4"><input id="member_addr"class="form-control" type="text" placeholder="주소" readonly></div>
	 	<div class="form-group col-lg-4"><input type="text" class="form-control" placeholder="상세주소"></div>
 	</div>
 	=================================================================================
 	
 	<div>
 		<div class="row">
 			<div class="col-3">
 				<select name="06Lv1" id="06Lv1" onchange="setSelectBox(this)">
 					<option value="">전체</option>
 					<c:forEach items="${1depthList}" var=resultVO" varStatus="status">
 					 	<option value="${resultVO.mcbscode}">${resultVO.mchgname}</option>
 					</c:forEach>
 				</select>
 			</div>
 			<div class="col-3">
 				<select name="06Lv2" id="06LV2" onchange="setSlectBox(this)" ddisabled>
 					<option value="">전체</option>
 				</select>
 			</div>
 		</div>
 	</div>
</div> 