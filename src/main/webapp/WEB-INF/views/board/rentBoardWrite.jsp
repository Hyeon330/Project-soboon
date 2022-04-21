<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/rentBoardWrite.css" type="text/css"/>
<script src="/js/board/rentBoardWrite.js"></script>
<script src="/js/board/boardaddrDialog.js"></script>
<div class="container">
	<br/>
	<form class="form-group" method="post" action="/board/rentBoardWriteOk?category=rent" id="rentForm" enctype="multipart/form-data">
		<table class="table table-striped" style="text-align:center">
			<thead>
				<tr>
					<th><h1>대여 게시판 글 작성하기</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div>
							<select id="boardlargeAddrSelect" name="large" default="${addrLarge}"></select>
							<select id="boardmediumAddrSelect" name="medium" default="${addrMedium}"></select>
							<select id="boardsmallAddrSelect" name="small" default="${addrSmall}"></select>
						</div>
					</td>
				</tr>
				<tr>
					<td id="tbBody">
						<input type="text" class="form-control col-7" id="rentBoardTitle" placeholder="글 제목을 입력하세요."  name="title"/>
						<span class="form-control col-2" id="pricetag">금&nbsp;&nbsp;액</span>
						<input type="number" class="form-control col-3" name="price" id="price" placeholder="금액을 입력하세요."/>
					</td>
				</tr>
				<tr>
					<td><textarea name="content" id="writeContent" placeholder="글 내용을 입력하세요."></textarea></td>
				</tr>
			</tbody>
		</table>
		<div id="fileList">
			<button type="button" class="btn" id="uploadBtn">첨부파일 선택</button>
			<div id="innerFiles">
     			<input type="file" name="fileImg" id="img1"/>
     			<input type="file" name="fileImg" id="img2"/>
     			<input type="file" name="fileImg" id="img3"/>
     			<input type="file" name="fileImg" id="img4"/>
  			</div>
  		</div>
  		<div class="col-12 text-center">
			<input type="submit" class="btn" id="writeBtn" value="등록"/>
			<input type="reset" id="resetBtn" class="btn" value="취소"/>
			<input type="button" class="btn" id="backList" value="리스트로 돌아가기"/>
		</div>
	</form>
</div>
<br/>