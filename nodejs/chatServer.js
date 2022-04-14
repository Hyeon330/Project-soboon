var app = require('express')();
var server = require('http').createServer(app);
var io = require('socket.io').listen(server);
var mysql = require('mysql2');

// app.get('/', function(req,res) {
//     res.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});
//     res.end('<h1>안녕하세요</h1>');
// });

var conn = mysql.createConnection({
    host : "1.246.60.149",
    port : 5000,
    user : 'a3b3',
    password: '1234',
    database : 'soboon'
});
conn.connect();

var userList = [];
io.sockets.on('connection', (socket) => {
    socket.on('send-msg', (data) => {
        var insertMsgSql = 'insert into chat(sender, receiver, msg) values (?, ?, ?)';
        conn.execute(insertMsgSql, [data.sender, data.receiver, data.msg], () => {});
        
        var selectMsgSql = 'select * from chat ';
        selectMsgSql += 'where chatno=( ';
        selectMsgSql += 'select max(chatno) from chat ';
        selectMsgSql += 'where (sender=? and receiver=?))';
        conn.execute(selectMsgSql, [data.sender, data.receiver], (err, result) => {
            var chatDateTimeArr = String(result[0].chat_datetime).split(' ');
            result[0].chat_datetime = chatDateTimeArr[3]+'-0'+(result[0].chat_datetime.getMonth()+1)+'-'+result[0].chat_datetime.getDate()+' '+chatDateTimeArr[4];
            io.emit('receive-msg', result[0]);
        });
    });

});

server.listen(9001, () => {
    console.log('Server Start => http://localhost:9001/');
});

// chat_datetime: "2022-04-12 12:38:08"
// chat_read: "n"
// chatno: 11
// msg: "ㄹㄴㅁ어ㅏㅣㅇㄻ너ㅏㅣㅁㄹㅇ너ㅏ"
// receiver: "개나리"
// sender: "현수"