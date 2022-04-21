<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/report.css" type="text/css"/>
<script src="/js/report.js"></script>
<div id="reportReason" no="${viewVo.no}">
	<form id="reportSubmit">
		<ul>
			<li>신고내용</li>
			<li><textarea cols="40" rows="2" placeholder="50자 내외로 입력하세요" id="reportContent" name="reportContent"></textarea></li>
		</ul>
	</form>
</div>