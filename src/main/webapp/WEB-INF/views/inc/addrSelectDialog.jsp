<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(function() {
		$('#addrSelectDialogOpen').click(function(){
			$('#addrSelectDialog').dialog('open');
		});
		
		$.ajax({
			url: '/addr/getLargeAddr',
			type: 'get',
			async: false,
			success: function(result) {
				result.forEach(largeData => {
					$('#largeAddrSelect').append('<option value="'+largeData+'">'+largeData+'</option>');
				});
			}
		});
		
		const setMedium = (large) => {
			document.getElementById('mediumAddrSelect').options.length = 0;
			document.getElementById('smallAddrSelect').options.length = 0;
			if($('#largeAddrSelect').val()!=''){
				$.ajax({
					url: '/addr/getMediumAddr',
					data: 'large='+large,
					type: 'get',
					async: false,
					success: function(result) {
						result.forEach(d => {
							$('#mediumAddrSelect').append('<option value="'+d+'">'+d+'</option>');
						})
					}
				});
			}
		}
		
		const setSmall = (large, medium) => {
			document.getElementById('smallAddrSelect').options.length = 0;
			if($('#mediumAddrSelect').val()!=''){
				$.ajax({
					url: '/addr/getSmallAddr',
					data: 'large='+large+'&medium='+medium,
					type: 'get',
					async: false,
					success: function(result) {
						result.forEach(smallData => {
							$('#smallAddrSelect').append('<option value="'+smallData+'">'+smallData+'</option>');
						});
					}
				});
			}
		}
		
		$('#largeAddrSelect').on('change', function() {
			setMedium($('#largeAddrSelect').val());
			setSmall($('#largeAddrSelect').val(), $('#mediumAddrSelect').val());
		});
		$('#mediumAddrSelect').on('change', function() {
			setSmall($('#largeAddrSelect').val(), $('#mediumAddrSelect').val());
		});
		
		const myAddrReset = () => {
			$('#largeAddrSelect').val('${addrLarge}').prop('selected');
			setMedium('${addrLarge}');
			$('#mediumAddrSelect').val('${addrMedium}').prop('selected');
			setSmall('${addrLarge}', '${addrMedium}');
			$('#smallAddrSelect').val('${addrSmall}').prop('selected');
		}
		
		$('#addrSelectDialog').dialog({
			title: "지역선택",
			autoOpen: false,
			modal: true,
			buttons: {
				등록: function() {
					let data = $('#addrSelectBox').serialize();
					$.ajax({
						url: '/member/updateMyAddr',
						data: data,
						type: 'post'
					});
					$("#addrSelectDialog").dialog('close');
				},
				초기화 : myAddrReset,
				취소: function() {
					$("#addrSelectDialog").dialog('close');
					myAddrReset();
				}
			}
		});
		
		myAddrReset();
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
	${addrLarge}
	<form id="addrSelectBox">
		<select id="largeAddrSelect" name="large"></select>
		<select id="mediumAddrSelect" name="medium"></select>
		<select id="smallAddrSelect" name="small"></select>
	</form>
</div>