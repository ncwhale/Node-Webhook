log = require './log'
gith = require 'gith'
exec = require('child_process').exec
server = gith.create 3333 #port number


server
    repo: 'phoenixlzx / nyaacat_page'
.on 'all', (payload) ->
    exec 'git pull',
        cwd: '~/nyaa'
    , (err, stdout, stderr) ->
        log stdout
        log stderr
        null
    
#module.export = {}
exports.run = ()->
    