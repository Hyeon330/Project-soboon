<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.reportList li{
	float: left;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #ddd;
	width:20%;
}
.reportList li:nth-child(3n), .reportList li:nth-child(3n+1) {
	width: 25%;
	white-space: nowrap; /*줄안바꿈*/
	overflow: hidden; /*넘친 내용 숨기기*/
	text-overflow: ellipsis;/*넘친 내용 있으면 ... 표시*/
}
.reportList li:nth-child(3n+2) {
	width: 5%;
}
</style>
<div>
	<ul class="reportList">
		<br/>
		<li><input type="checkbox" id="checkAll"></li>
		<li>아이디</li>
		<li>신고내용</li>
		<li>신고회수</li>
	</ul>
</div>
</html>