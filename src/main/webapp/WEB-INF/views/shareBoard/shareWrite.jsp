<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/shareWrite.css" type="text/css"/>
<script src="//cdn.ckeditor.com/4.17.2/full/ckeditor.js"></script>
<script src="/js/shareWrite.js"></script>
<script>
	$(function(){
		
		let fileCount = 0; // 첨뷰파일 선택 개수
		if($("#thumbnailImg").val()!==''){ // 파일을 선택했을 때
			fileCount++;
		}
	});

</script>
<div class="container">
		<br/>
		<form class="form-group" method="post" action="/shareBoard/shareWriteOk" id="shareForm" enctype="multipart/form-data">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th><h1 style="text-align:center;">글 작성 폼</h1></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목을 입력하세요" id="writeTitle" name="writeTitle" /></td>
					</tr>
					<tr>
						<td><textarea name="writeContent" id="writeContent" placeholder="글 내용을 입력하세요"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div id="fileList">
				<button type="button" class="btn" id="uploadBtn">첨부파일 선택</button>
					<div id="innerFiles">
		     			<input type="file" name="thumbnailImg" id="thumbnailImg"/>
		     			<input type="file" name="img1" id="img1"/>
		     			<input type="file" name="img2" id="img2"/>
		     			<input type="file" name="img3" id="img3"/>
   					</div>
   			</div>
   			<div class="col-12 text-center">
				<input type="submit" class="btn" id="writeBtn" value="등록"/>
				<input type="reset" id="resetBtn" class="btn" value="취소"/>
			</div>
		</form>
</div>
<br/>