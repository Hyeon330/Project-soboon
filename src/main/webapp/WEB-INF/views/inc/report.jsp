<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/report.css" type="text/css"/>
<script>
$(function() {
	$('#proWarn').click(function(){
		$('#reportReason').dialog('open');
	});
	$('#reportReason').dialog({
		title: "신고사유",
		autoOpen: false,
		modal: true,
		buttons: {
			등록: function() {
				alert('등록');
				$("#reportSubmit").submit();
			},
			취소: function() {
				$("#reportReason").dialog('close');
			}
		}
	});
});
</script>
<div id="reportReason">
	<form id="reportSubmit">
		<ul>
			<li>신고제목</li>
			<li><input type="text" name="reportTitle" id="reportTitle"></li>
			<li>신고내용</li>
			<li><textarea cols="30" rows="5" id="reportContent" name="reportContent"></textarea></li>
		</ul>
	</form>
</div>