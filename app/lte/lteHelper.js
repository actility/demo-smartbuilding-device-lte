var dgram = require('dgram');

var port = null;
var host = null;

module.exports = LTEHelper;

function LTEHelper(lteHost, ltePort) {
	
    if (!(this instanceof LTEHelper)) {
        return new LTEHelper(lteHost, ltePort);
    }
	
    port = ltePort;
    host = lteHost;
}

LTEHelper.prototype.write = function(msg) {

	var message = new Buffer(msg);
	var client = dgram.createSocket('udp4');
	client.send(message, 0, message.length, port, host, function(err, bytes) {
	    if (err) throw err;
	    console.log('UDP message sent to ' + port +':'+ host);
	    client.close();
	});
};