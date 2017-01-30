var express = require('express'),
config = require('./config/config');

var app = express();

var server = require('http').Server(app);
var io = require('socket.io')(server);

var PORT = 8080;

var LTE_HOST = "91.134.250.109";
var LTE_PORT = 33333;

var receivedMessages = new Array();

var lteHelper = require('./app/lte/lteHelper')(LTE_HOST, LTE_PORT);

require('./config/express')(app, io, config, lteHelper, receivedMessages);

server.listen(PORT, function () {
	console.log('Express server listening on port ' + PORT);
});