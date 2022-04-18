var app = require('express')();
var server = require('http').createServer(app);
var io = require('socket.io').listen(server);
var mysql = require('mysql2');

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
        console.log(data.chat_read);
        if(data.chat_read=='end'){
            var insertMsgSql = 'insert into chat(sender, receiver, msg, chat_read) values (?, ?, ?, ?)';
            conn.execute(insertMsgSql, [data.sender, data.receiver, data.msg, data.chat_read], () => {});
        }else {
            var insertMsgSql = 'insert into chat(sender, receiver, msg) values (?, ?, ?)';
            conn.execute(insertMsgSql, [data.sender, data.receiver, data.msg], () => {});
        }
        
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