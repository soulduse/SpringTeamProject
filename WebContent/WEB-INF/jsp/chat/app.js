var socketio=require("socket.io");
var express=require("express");
var http=require("http");
var ejs=require("ejs");
var fs=require("fs");

var app=express();
app.use(app.router);
app.use(express.static('images'));

var server=http.createServer(app);
server.listen(900, function(){
	console.log("server running");
});

//
var io=socketio.listen(server);


app.get('/m_chatting/:room',function(request, response){
	fs.readFile('views/m_chatting.html','utf-8', function(error,data){
		response.send(ejs.render(data,{
//			name:request.pa555pt555tram("c_id"),
			room:request.param("room"),
			name:request.param("name")
			
		}));
	});
});

app.get('/m_chatting/:room',function(request, response){
	fs.readFile('views/m_chatting.html','utf-8', function(error,data){
		response.send(ejs.render(data,{
//			name:request.pa555pt555tram("c_id"),
			room:request.param("room"),
			name:request.param("name")
			
		}));
	});
});
//
app.get('/chatting/:room',function(request, response){
	fs.readFile('views/chatting.html','utf-8', function(error,data){
		response.send(ejs.render(data,{
//			name:request.pa555pt555tram("c_id"),
			room:request.param("room"),
			name:request.param("name")
			
		}));
	});
});

//
function Sockets(){
	this.sockets={};
}

Sockets.prototype.set=function(id, data){
	this.sockets[id] = data;
};

Sockets.prototype.get=function(id, callback){
	if(this.sockets[id] !== undefined){
		callback(true, this.sockets[id]);
	}else{
		callback(false, this.sockets[id]);
	}
}


//
io.sockets.on('connection',function(socket){
	var sockets=new Sockets();
	
	socket.on('join', function(data){
		console.log(data.room);
		socket.join(data.room);
		sockets.set('room', data.room);
		console.log(data.name+"님이 1:1채팅을 수락하였습니다.");
	});
	
	socket.on('message', function(data){
		sockets.get('room',function(error, room){
			console.log(room);
			socket.broadcast.to(room).emit("message", data);
		});
	});
	
	
	// 입장할때
	socket.on('name', function(data){
		sockets.get('room',function(error,room){
			io.sockets.to(room).emit("input", data);
		});
	});



	//나감
	socket.on('message1', function(data){
		sockets.get('room',function(error, room){
			
			io.sockets.to(room).emit("message1", data);
			
		});
	});
	

	//알림
	socket.on('notification', function(data){
		sockets.get('email',function(error, email){
			
			socket.broadcast.to(email).emit("notification", data);
			
		});
	});
});










//var http=require('http');
//var fs=require('fs');
//var ejs=require('ejs');
//
//http.createServer(function(request, response){
//	fs.readFile('aa.html', 'utf-8',function(error,data){
//		response.writeHead(200,{'Content-Type':'text/html'});
//		response.end(ejs.render(data));
//	});
//}).listen(3000,function(){
//	console.log('Server Running');
//});