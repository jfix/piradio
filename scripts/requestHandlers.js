var exec = require("child_process").exec;

function show(response) {
	console.log("Request handler 'show' was called.");

	exec("ls -lah", function(error, stdout, stderr) {
		response.writeHead(200, {"Content-Type": "text/plain"});
		response.write(stdout);
		response.end();
	});
}

function volume(response) {
	console.log("Request handler 'volume' was called.");
	response.writeHead(200, {"Content-Type": "text/plain"});
	response.write("volume called");
	response.end();
}

function station(response) {
	console.log("Request handler 'station' was called.");
	response.writeHead(200, {"Content-Type": "text/plain"});
	response.write("station called");
	response.end();
}

exports.show = show;
exports.volume = volume;
exports.station = station;