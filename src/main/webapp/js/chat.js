$(() => {
	// 채팅 리스트 나타내고 없어지는 애니메이션
	$('#chatBtn').click(function() {
		if($('#chatPopup').css('height').substring(0,$('#chatPopup').css('height').length-2)>0){
			$('#chatBtn').html('<i class="bi bi-chat-square-text chat-icon"></i>');
			$('#chatPopup').animate({
				height: '0'
			}, 150);
		}else {
			$('#chatBtn').html('<i class="bi bi-x-lg chat-icon"></i>');
			$('#chatPopup').animate({
				height: window.innerHeight-120+'px'
			}, 150);
		}
	});
	
	// 화면크기에 따라 채팅 리스트 일정한 크기 유지
	const resizeChatLists = () => {
		var chatHeadHeight = Number($('.chat-head').css('height').substring(0,$('.chat-head').css('height').length-2));
		var chatSearchHeight = Number($('.chat-search').css('height').substring(0,$('.chat-search').css('height').length-2));
		$('#chatLists').css('height', (window.innerHeight-120-chatHeadHeight-chatSearchHeight-10)+'px');
	};
	resizeChatLists();
	$(window).resize(() => {
		var chatPopupHeight = $('#chatPopup').css('height').substring(0,$('#chatPopup').css('height').length-2);
		if(chatPopupHeight != 0){
			$('#chatPopup').css('height', window.innerHeight-120+'px');
			resizeChatLists();
		}
		
		
	});
	
	// 채팅 검색창 자연스러운 테두리 나타내기
	$('.chat-search-text').focus(function(){
		$('.chat-search-box').css('border','2px solid #666');
	});
	$('.chat-search-text').blur(function(){
		$('.chat-search-box').css('border','2px solid rgba(0,0,0,0)');
	});
	
	var myNickname = $('#myNickName').text();
	var todayTime = new Date();
	const chatListsReload = () => {
		$.ajax({
			url: '/chat/getLastMessage',
			type: 'get',
			async: false,
			success: function (result){
				console.log(result);
				result.forEach(d => {
					var chatDateArr = d.datetime.split(' ')[0].split('-');
					var chatTimeArr = d.datetime.split(' ')[1].split(':');
					var chatDate = new Date(chatDateArr[0], chatDateArr[1], chatDateArr[2]);
					var today = new Date(todayTime.getFullYear(), todayTime.getMonth()+1, todayTime.getDate());
					
					var chatList = '<li class="chat-list">';
					chatList += '<div>';
					chatList += '<div class="chat-info">';
					if(d.r_nickname === myNickname){
						chatList += '<p class="chat-name">'+d.s_nickname+'</p>';
					} else {
						chatList += '<p class="chat-name">'+d.r_nickname+'</p>';
					}
					
					// 메시지
					if(d.chat_read == 'n' && d.s_nickname != myNickname){
						chatList += '<p class="last-chat"><b class="not-read">'+d.s_nickname+": "+d.msg+'</b></p>';
					}else {
						chatList += '<p class="last-chat">'+d.s_nickname+": "+d.msg+'</p>';
					}
					chatList += '</div>';
					
					// 시간
					if(chatDate.getTime() === today.getTime()){
						chatList += '<p class="chat-date">'+Number(chatTimeArr[0])+'시 '+Number(chatTimeArr[1])+'분'+'</p>';
					}else {
						chatList += '<p class="chat-date">'+Number(chatDateArr[1])+'월 '+Number(chatDateArr[2])+'일'+'</p>';
					}
					
					chatList += '</div></li>';
					
					$('#chatLists').append(chatList);
				});
			}
		});
	};
	chatListsReload();
	
	// 메시지 창 열고 닫기
	$('.msg-close').click(() => {
		$('#msgPopup').css('display', 'none');
	});
	
	// 메시지 창에 메시지 넣기
	var prevTime = '';
	var prevPosition = '';
	var prevDate = '';
	const setMessage = (data) => {
		var msgDateArr = data.datetime.split(' ')[0].split('-');
		var msgDate = msgDateArr[0]+'년 '+msgDateArr[1]+'월 '+msgDateArr[2]+'일';
		if(prevDate != msgDate){
			$('.msg-lists').append('<li><div class="msg-date-line">'+msgDate+'</div></li>');
			prevDate = msgDate;
		}
		var msg = '<li class="msg-list">';
		
		var position = '';
		if(data.s_nickname == myNickname){
			position = 'right';
		} else {
			position = 'left';
		}
		
		msg += '<div class="msg-box '+position+'">';
		var msgDateTimeArr = data.datetime.split(' ')[1].split(':');
		var nowTime = msgDateTimeArr[0]+'시 '+msgDateTimeArr[1]+'분';
		if(prevTime != nowTime || prevPosition != position){
			msg += '<div class="msg-info">';
			if(position=='right'){
				msg += '<span class="msg-time">'+nowTime+'</span>';
				msg += '·<span class="msg-nickname">'+data.s_nickname+'</span>';
			}else {
				msg += '<span class="msg-nickname">'+data.s_nickname+'</span>';
				msg += '·<span class="msg-time">'+nowTime+'</span>';
			}
			msg += '</div>';
			prevTime = nowTime;
			prevPosition = position;
		}
		msg += '<div class="msg-text '+position+'">'+data.msg+'</div></div></li>';
		
		$('.msg-lists').append(msg);
	}
	
	$('.chat-list').on('click', function(){
		var oppNickname = $(this).find('.chat-name').text();
		$('#oppNickName').text(oppNickname);
		$('.msg-lists').empty();
		$.ajax({
			url: '/chat/getAllMessage',
			type: 'post',
			data: 'oppNickname='+oppNickname,
			async: false,
			success: function(result) {
				console.log(result);
				prevDate = '';
				result.forEach(data => {
					setMessage(data);
				});
			}
		});
		$('#msgPopup').css('display', 'block');
		$('.msg-lists').scrollTop($('.msg-lists')[0].scrollHeight);
		
		var socket = io.connect("http://localhost:9001");
		socket.emit('send-nickname', myNickname);
	});
	
	const sendMessage = (msg) => {
		var data = {
			
		}
		socket.emit('send-msg', msg);
		$('.msg-textarea').val('');
	}
	
	
	/* $('.msg-textarea').keydown((e)=>{
		if($('.msg-textarea').val() != '' && e.keyCode === 13 && !e.shiftKey){
			sendMessage();
		}
	}); */
	$('.msg-send-btn').click(() => {
		if($('.msg-textarea').val()!=''){
			sendMessage($('.msg-textarea').val());
		}
	});
	
	/*socket.on('receive-msg', (data) => {
		setMessage(data);
	});*/
	
});