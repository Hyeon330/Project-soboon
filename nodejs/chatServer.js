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
    socket.on('send-msg', async (data) => {
        if(data.chat_read=='end'){
            var insertMsgSql = 'insert into chat(sender, receiver, msg, chat_read) values (?, ?, ?, ?)';
            conn.execute(insertMsgSql, [data.sender, data.receiver, data.msg, data.chat_read], () => {});

            var endCheckSql = 'select chat_read from chat ';
            endCheckSql += 'where (sender=? and receiver=?) ';
            endCheckSql += 'or (receiver=? and sender=?) ';
            endCheckSql += 'order by chatno desc limit 2';
            await conn.execute(endCheckSql, [data.sender, data.receiver, data.sender, data.receiver], async (err, result) => {
                let cnt = 0;
                result.forEach(d => {
                    if(d.chat_read=='end') cnt++;
                });
                if(cnt >= 2){
                    // 삭제되는 메시지 chat_remove테이블로 옮겨 담기
                    var selectRemoveChatsSql = 'select * from chat ';
                    selectRemoveChatsSql += 'where (sender=? and receiver=?) ';
                    selectRemoveChatsSql += 'or (receiver=? and sender=?) ';
                    conn.execute(selectRemoveChatsSql, [data.sender, data.receiver, data.sender, data.receiver], (e2, r2) => {
                        var insertRemoveChatsSql = 'insert into chat_remove (chatno, sender, receiver, msg, chat_datetime, chat_read) ';
                        insertRemoveChatsSql += 'values (?,?,?,?,?,?)';
                        r2.forEach(d => {
                            conn.execute(insertRemoveChatsSql, [d.chatno, d.sender, d.receiver, d.msg, d.chat_datetime, d.chat_read], () => {})
                        });
                    });

                    // 메시지 삭제
                    var deleteChatsSql = 'delete from chat ';
                    deleteChatsSql += 'where (sender=? and receiver=?) ';
                    deleteChatsSql += 'or (receiver=? and sender=?) ';
                    await conn.execute(deleteChatsSql, [data.sender, data.receiver, data.sender, data.receiver], () => {});
                }
            });
        }else {
            var insertMsgSql = 'insert into chat(sender, receiver, msg) values (?, ?, ?)';
            conn.execute(insertMsgSql, [data.sender, data.receiver, data.msg], () => {});
        }
        
        // var selectMsgSql = 'select * from chat ';
        // selectMsgSql += 'where chatno=( ';
        // selectMsgSql += 'select max(chatno) from chat ';
        // selectMsgSql += 'where (sender=? and receiver=?))';
        var selectMsgSql = 'select * from chat ';
        selectMsgSql += 'where sender=? and receiver=? ';
        selectMsgSql += 'order by chatno desc limit 1';
        await conn.execute(selectMsgSql, [data.sender, data.receiver], (err, result) => {
            if(result.chat_read != 'end'){
                var chatDateTimeArr = String(result[0].chat_datetime).split(' ');
                result[0].chat_datetime = chatDateTimeArr[3]+'-0'+(result[0].chat_datetime.getMonth()+1)+'-'+result[0].chat_datetime.getDate()+' '+chatDateTimeArr[4];
                io.emit('receive-msg', result[0]);
            }
        });
    });
});

server.listen(9001, () => {
    console.log('Server Start => http://localhost:9001/');
});