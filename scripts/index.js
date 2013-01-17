var server = require("./server");
var router = require("./router");
var requestHandlers = require("./requestHandlers");

var handle = {
	  "/": requestHandlers.show
	, "/show": requestHandlers.show
	, "/volume": requestHandlers.volume
	, "/station": requestHandlers.station
};

server.start(router.route, handle);