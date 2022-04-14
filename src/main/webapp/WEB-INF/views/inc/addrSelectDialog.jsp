<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(function() {
		$('#addrSelectDialogOpen').click(function(){
			$('#addrSelectDialog').dialog('open');
		});
		$('#addrSelectDialog').dialog({
			title: "지역선택",
			autoOpen: true,
			modal: true,
			buttons: {
				등록: function() {
					alert('등록');
				},
				취소: function() {
					$("#addrSelectDialog").dialog('close');
				}
			}
		});
		$.ajax({
			url: '/addr/getLargeAddr',
			type: 'get',
			success: function(result) {
				$('#largeAddrSelect').html('<option value="">선택안함</option>');
				result.forEach(largeData => {
					$('#largeAddrSelect').append('<option value="'+largeData+'">'+largeData+'</option>');
				})
			}
		});
		$('#largeAddrSelect').on('change', function() {
			document.getElementById('mediumAddrSelect').options.length = 1;
			document.getElementById('smallAddrSelect').options.length = 1;
			if($('#largeAddrSelect').val()!=''){
				$.ajax({
					url: '/addr/getMediumAddr',
					data: 'large='+$(this).val(),
					type: 'get',
					success: function(result) {
						console.log(result);
						result.forEach(d => {
							$('#mediumAddrSelect').append('<option value="'+d+'">'+d+'</option>');
						})
					}
				});
			}
		});
		$('#mediumAddrSelect').on('change', function() {
			document.getElementById('smallAddrSelect').options.length = 1;
			if($('#mediumAddrSelect').val()!=''){
				$.ajax({
					url: '/addr/getSmallAddr',
					data: 'large='+$('#largeAddrSelect').val()+'&medium='+$(this).val(),
					type: 'get',
					success: function(result) {
						result.forEach(smallData => {
							$('#smallAddrSelect').append('<option value="'+smallData+'">'+smallData+'</option>');
						})
					}
				});
			}
		});
	});
</script>
<style>
	.ui-dialog{
		width: 450px !important;
	}
	.ui-dialog-titlebar-close {
		display: none;
	}
	#addrSelectBox{
		width: inherit;
		text-align: center;
	}
</style>
<div id="addrSelectDialog">
	<div id="addrSelectBox">
		<select id="largeAddrSelect" name="large">
			<option value="">선택 없음</option>
		</select>
		<select id="mediumAddrSelect" name="medium">
			<option value="">선택 없음</option>
		</select>
		<select id="smallAddrSelect">
			<option value="">선택 없음</option>
		</select>
	</div>
</div>