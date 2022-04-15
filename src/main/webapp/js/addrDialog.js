$(function() {
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
	
	const setMedium = () => {
		document.getElementById('mediumAddrSelect').options.length = 0;
		document.getElementById('smallAddrSelect').options.length = 0;
		if($('#largeAddrSelect').val()!=''){
			$.ajax({
				url: '/addr/getMediumAddr',
				data: 'large='+$('#largeAddrSelect').val(),
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
	
	const setSmall = () => {
		document.getElementById('smallAddrSelect').options.length = 0;
		if($('#mediumAddrSelect').val()!=''){
			$.ajax({
				url: '/addr/getSmallAddr',
				data: 'large='+$('#largeAddrSelect').val()+'&medium='+$('#mediumAddrSelect').val(),
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
		setMedium();
		setSmall();
	});
	$('#mediumAddrSelect').on('change', function() {
		setSmall();
	});
	
	const myAddrReset = () => {
		$('#largeAddrSelect').val($('#largeAddrSelect').attr('default')).prop('selected');
		setMedium();
		$('#mediumAddrSelect').val($('#mediumAddrSelect').attr('default')).prop('selected');
		setSmall();
		$('#smallAddrSelect').val($('#smallAddrSelect').attr('default')).prop('selected');s
	}
	
	$('#addrSelectDialogOpen').click(function(){
		$('#addrSelectDialog').dialog('open');
	});
	
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
				$('#largeAddrSelect').attr('default', $('#largeAddrSelect').val());
				$('#mediumAddrSelect').attr('default', $('#mediumAddrSelect').val());
				$('#smallAddrSelect').attr('default', $('#smallAddrSelect').val());
				myAddrReset();
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