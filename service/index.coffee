log = require './log'
gith = require 'gith'
exec = require('child_process').exec

exports.run = (config)->
  server = gith.create (config.port ? 3333) #port number
  for repo in (config.repo ? [])
    if repo.name?
      for cond,act of (repo.hook ? {})
        server
          repo: repo.name
        .on cond, (payload) ->
          log [repo.name, cond, 'fired']
          if act.exec?
            exec act.exec,
              cwd: act.path ? '.'
            , (err, stdout, stderr) ->
              log.error err if err?
              log stdout
              log stderr
              null
          null
  
