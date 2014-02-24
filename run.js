require('coffee-script');
var server = require('./service');
var config = require('./config.json');
server.run(config);
