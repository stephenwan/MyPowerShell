var ping = require('net-ping');
var Promise = require('bluebird');

var session = ping.createSession({
    retries: 1,
    timeout: 500,
    packetSize: 16
});


var target1 = "192.168.10.100";
var target2 = "192.168.10.101";

var pingP = Promise.promisify(session.pingHost).bind(session);

var targets = [];

for (var i = 1; i < 255; i++) {
    targets.push("192.168.10." + i);
}


Promise.map(targets, function(target) {
    return pingP(target)
        .then(function(target) {
            console.log(target + ": Alive");
        })
        .catch(function(err) {
            console.log(target + ": " + err.toString());
        });
}, { concurrency: 300}).then(function(a, b){
    console.log('Done!');
});
