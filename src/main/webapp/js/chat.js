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
	
	$.ajax({
		url: '/chat/getLastMessage',
		type: 'get',
		async: false,
		success: function (result){
			result.forEach(d => {
				var chatDateArr = d.datetime.split(' ')[0].split('-');
				var chatTimeArr = d.datetime.split(' ')[1].split(':');
				var chatDate = new Date(chatDateArr[0], chatDateArr[1], chatDateArr[2]);
				var todayTime = new Date();
				var today = new Date(todayTime.getFullYear(), todayTime.getMonth()+1, todayTime.getDate());
				
				var chatList = '<li class="chat-list">';
				chatList += '<div>';
				chatList += '<div class="chat-info">';
				if(d.r_nickname === $('#myNickName').text()){
					chatList += '<p class="chat-name">'+d.s_nickname+'</p>';
				} else {
					chatList += '<p class="chat-name">'+d.r_nickname+'</p>';
				}
				
				// 메시지
				if(d.chat_read == 'n' && d.s_nickname != $('#myNickName').text()){
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
	
	// 메시지 창 열고 닫기
	$('.msg-close').click(() => {
		$('#msgPopup').css('display', 'none');
	});
	$('.chat-list').click(() => {
		$('#msgPopup').css('display', 'block');
	});
	
	var socket = io.connect("http://localhost:9001");
	socket.emit('send-nickname', $('#myNickName').text());
	
	const sendMessage = (msg) => {
		if($('.msg-textarea').val()!=''){
			console.log('send!!');
			socket.emit('send-msg', msg);
			$('.msg-textarea').val('');
		}
	}
	
	/* $('.msg-textarea').keydown((e)=>{
		if($('.msg-textarea').val() != '' && e.keyCode === 13 && !e.shiftKey){
			sendMessage();
		}
	}); */
	$('.msg-send-btn').click(() => {
		sendMessage($('.msg-textarea').val());
	});
	
	/*socket.on('receive-msg', (msg) => {
		var nickname = msg.split(':')[0];
		msg = msg.split(':')[1];
		if(nickname === $('#myNickName').text()){
			$('.msg-lists').append('<li class="msg-list right"><div>'+msg+'</div></li>');
		}else {
			$('.msg-lists').append('<li class="msg-list left"><div>'+msg+'</div></li>');
		}
	});*/
	
});