<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
	#mypageContainer { height: 500px; margin-top: 10px;}
	#mypageContainer>div {
		float: left;
	}
	#button_overlapCheck ,#button_editSubmit {
		background:rgb(239, 136, 105) !important;
		border-style: none !important;
	}
	#editView>hr {		
		height: 5px; background: #ddd; border-style: none;
	}
	
	#editView>form>div>ul>li>div{
		margin-bottom: 13px;
	}
	#editView input {
		border-style: none;
		background-color: transparent;
		border-bottom: 2px solid #ddd;
		border-bottom-style:
	}
	#editFrm>li>div {
		float:left;
	}
	#editView>form>div {
		float: left;
	}
	#editView>form>div:last-of-type {
		display: flex;
		justify-content: center;
		align-items: center;
}

#button_editSubmit {
	margin-bottom: 13px;
}

#button_overlapCheck {
	font-size:small !important;
}
</style>

<div class="container" id="mypageContainer">
<!--   사이드 메뉴 (include) -->
	<%@ include file="/WEB-INF/views/inc/mypageSideBar.jsp" %>

<!--  view -->
	<div id="editView" style="width:65%; height:100%;" >
		<h1>개인정보수정</h1>
		<hr/>
		<form>
			<div style="width:100%; height: 80%;">
				<ul id="editFrm">
					<li>
						<div style="width:20%;">아이디</div>
						<div style="width:5%;"></div> 
						<div style="width:75%;"><input type="text" id="userid" name="userid"/></div>
					</li>
					<li>
						<div style="width:20%;">비밀번호</div>
						<div style="width:5%;"></div> 
						<div style="width:75%"><input type="password" id="userpwd" name="userpwd"/></div>
					</li>
					<li>
						<div style="width:20%;">비밀번호 확인</div>
						<div style="width:5%;"></div> 
						<div style="width:75%"><input type="password" id="userpwd2"/></div>
					</li>
					<li>
						<div style="width:20%">이름</div>
						<div style="width:5%;"></div>
						<div style="width:75%"><input type="text" id="username" name="username"/></div>
					</li>
					<li>
						<div style="width:20%">닉네임</div>
						<div style="width:5%"></div>
						<div style="width:30%"><input type="text" id="nickname" name="nickname"/></div>
						<div style="width:40%"><button class="btn btn-success"id="button_overlapCheck">중복확인</button></div>				
					</li>
					<li>
						<div style="width:20%">전화번호</div>
						<div style="width:5%;"></div>
						<div style="width:24%"><input type="text" id="tel1" name="tel1" style="width:80%"/>&nbsp;&nbsp;-</div>
						<div style="width:24%"><input type="text" id="tel2" name="tel2" style="width:80%"/>&nbsp;&nbsp;-</div>
						<div style="width:24%"><input type="text" id="tel3" name="tel3" style="width:80%"/></div>
					</li>
					<li>
						<div style="width:20%">이메일</div>
						<div style="width:5%;"></div>
						<div style="width:75%"><input type="email" id="email" name="email"/></div>
					</li>
					<li>
						<div style="width:20%">주소</div>
						<div style="width:5%;"></div>
						<div style="width:75%"><input type="text" id="address" name="address"/></div>
					</li> 
				</ul>
			</div>
			<div style="width:100%; height: 90px;"><input type="submit" class="btn btn-success" value="수정" id="button_editSubmit"/></div>
		</form>
	</div>
</div>