module.exports = function(io, lteHelperPar, receivedMessagesPar) {

    io.sockets.on('connection', function (socket) {

        //console.log('socket connection established');
        var bigbuffer = '';
        var mybuffer = '';
        var i = 0;
        var debut = 0;

        // TODO
    });

};

function hex2StringA(hexValue) {
    var hex = hexValue.toString();
    var str = '';
    for (var i = 0; i < hex.length; i += 2)
        str += String.fromCharCode(parseInt(hex.substr(i, 2), 16));
    return str;
}