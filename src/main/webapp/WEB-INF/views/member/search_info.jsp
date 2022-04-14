<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/search_info.css" type="text/css"/>
<script src="/js/search_info.js"></script>
<script>
	/* function search_check(num){
		if(num == '1'){
			$(".searchId").css("display","block");
			$(".searchPwd").css("display","none");
		} else{
			$(".searchId").css("display","none");
			$(".searchPwd").css("display","block");
		}
	} */
	$(document).ready(function(){
		// 모달창 불러오기
		$(".searchId-btn").click(function(){
			$(".background-modal").show();
		});
		// 모달창 닫기
		$(".btn-close").on('click',function(){
			$(".background-modal").hide();
		});
		// 모달창 윈도우 클릭 시 닫기
		$(window).on('click', function(){
			if(event.target == $(".background-modal").get(0)){
				$(".background-modal").hide();
			}
		});
		
		//휴대폰 번호로 아이디찾기 버튼 클릭시
		$(".searchinfo_searchtel").on('click',function(){
			$(".searchinfo_searchemail").css("display","none");
			$("#searchinfo-tel").css("display","block");
			$(".searchinfo_searchtel").css("display","none");
		});
		//이메일로 아이디찾기 버튼 클릭시
		$(".searchinfo_searchemail").on('click',function(){
			$(".searchinfo_searchtel").css("display","none");
			$("#searchinfo-email").css("display","block");
			$(".searchinfo_searchemail").css("display","none");
		});
	});
	
	var id = "";
	var searchinfo_idClick = function(){
		$.ajax({
			type:'post',
			url:'/member/search_info?searchinfo-name='+$("#searchinfo-name").val()
					+'&searchinfo-tel='+$("#searchinfo-tel").val(),
			success:function(res){
				if(res==0){
					$("#id_value").text("회원정보를 확인해주세요.");
				} else{
					$("#id_value").text(res);
					id = res;
				}
			}
		});
	}
</script>
<div class="container searchinfofrm">
	<h1><b>로고넣어줘요</b></h1>
	<div>
		<div class="row">
			<hr />
			<div class="col-6 searchId">
				<div class="form-group">
					<div class="search-logo"><h4>아이디찾기</h4></div>
					<div>
						<input type="text" id="searchinfo-name" name="searchinfo-name" placeholder="실명을 입력해주세요" />
					</div>
					<div>
						<input type="button" class="btn-searchinfo searchinfo_searchtel" value="휴대폰 번호로 아이디찾기" />
						<input type="text" class="searchinfo_1" id="searchinfo-tel" name="searchinfo-tel" placeholder="(-)를 제외한 휴대폰번호를 입력해주세요" />
					</div>
					<div>
						<input type="button" class="btn-searchinfo searchinfo_searchemail" value="이메일로 아이디찾기" />
						<input type="text" class="searchinfo_1" id="searchinfo-email" name="searchinfo-email" placeholder="이메일을 입력해주세요" />
					</div>
				</div><br/>
				<input type="button" class="btn searchId-btn" onclick="searchinfo_idClick()" value="아이디찾기" />
				<div>
					<!-- 찾는 아이디 모달 띄우기!!!  -->
					<div class="background-modal">
						<div class="modal-content">
							<h4 class="modal-title"><b>찾으시는 아이디는</b></h4>
							<h2 id="id_value"></h2><br/>
							<button type="button" class="btn btn-close" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

			<div class="col-6 searchPwd">
				<div class="form-group">
					<div class="search-logo"><h4>비밀번호찾기</h4></div>
					<div>
						<input type="text" class="searchinfo_2" id="searchinfo-id" name="searchinfo-id" placeholder="아이디를 입력해주세요" />
						<input type="text" class="searchinfo_2" id="searchinfo-email2" name="searchinfo-email2" placeholder="이메일을 입력해주세요" />
					</div>
				</div>
				<input type="button" class="btn searchPwd-btn" value="비밀번호찾기" />
			</div>
		</div>
	</div>
</div>