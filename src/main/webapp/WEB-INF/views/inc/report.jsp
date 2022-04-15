<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<textarea cols="45" rows="5"></textarea>
	</form>
</div>