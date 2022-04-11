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
    socket.on('send-nickname', (nickname) => {
        userList.push({
            nickName: nickname,
            socketId: socket.idsa
        });
    });

    socket.on('send-msg', (msg) => {
        console.log(msg);
    });
});

server.listen(9001, () => {
    console.log('Server Start => http://localhost:9001/');
});