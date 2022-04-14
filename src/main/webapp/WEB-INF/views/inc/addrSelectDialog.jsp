<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(function() {
		$('#addrSelectDialogOpen').click(function(){
			$('#addrSelectDialog').dialog('open');
		});
		
		$('#addrSelectDialog').dialog({
			autoOpen: true,
			modal: true,
			buttons: {
				등록: function() {
					alert('등록');
				},
				취소: function() {
					alert('취소');
				}
			}
		});
	});
</script>
<style>
</style>
<div id="addrSelectDialog" title="지역 선택">
	<select id="largeAddrSelect">
		<option value="">선택 없음</option>
	</select>
	<select id="mediumAddrSelect">
		<option value="">선택 없음</option>
	</select>
	<select id="smallAddrSelect">
		<option value="">선택 없음</option>
	</select>
</div>