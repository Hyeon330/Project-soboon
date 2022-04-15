<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/search_info.css" type="text/css"/>
<script src="/js/search_info.js"></script>
<div class="container searchinfofrm">
	<h1><b>로고넣어줘요</b></h1>
	<div>
		<div class="row">
			<hr />
			<div class="col-6 searchId">
				<div class="form-group">
					<div class="search-logo"><h4>아이디찾기</h4></div>
					<div>
						<input type="button" class="btn-searchinfo searchinfo_searchtel" value="휴대폰 번호로 아이디찾기" />
						<input type="text" class="searchinfo_1" id="searchinfo_tel" name="tel" placeholder="(-)를 제외한 휴대폰번호를 입력해주세요" />
					</div>
					<div>
						<input type="button" class="btn-searchinfo searchinfo_searchemail" value="이메일로 아이디찾기" />
						<input type="text" class="searchinfo_1" id="searchinfo_email" name="email" placeholder="이메일을 입력해주세요" />
					</div>
				</div><br/>
				<input type="button" class="btn searchId-btn" value="아이디찾기" />
			</div>

			<div class="col-6 searchPwd">
				<div class="form-group">
					<div class="search-logo"><h4>비밀번호찾기</h4></div>
					<div>
						<input type="text" class="searchinfo_2" id="searchinfo-id" name="userid" placeholder="아이디를 입력해주세요" />
						<input type="text" class="searchinfo_2" id="searchinfo-email2" name="email" placeholder="이메일을 입력해주세요" />
					</div>
				</div>
				<input type="button" class="btn searchPwd-btn" value="비밀번호찾기" />
			</div>
		</div>
	</div>
</div>