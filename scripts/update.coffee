child_process = require 'child_process'

permitted_users = ["noir_neo"]

module.exports = (robot) ->

  robot.respond /update/i, (msg) ->
    console.log msg.envelope?.user?.name 
    if user = msg.envelope?.user?.name in permitted_users

      try
        msg.send "git pull..."
        child_process.exec 'git pull origin master', (error, stdout, stderr) ->
          if error
            msg.send "git pull failed: " + stderr
          else
            output = stdout+''
            if not /Already up\-to\-date/.test output
              msg.send "わたしのソースコードが変更されました:\n" + output

              try
                msg.send "npm update..."
                child_process.exec 'npm update', (error, stdout, stderr) ->
                  if error
                    msg.send "npm update failed: " + stderr
                  else
                    output = stdout+''
                    if /node_modules/.test output
                      msg.send "some dependencies updated:\n" + output
                    else
                      msg.send "all dependencies are up-to-date"
                    msg.send "再起動します。"
                    process.exit()
              catch error
                msg.send "npm update failed: " + error

            else
              msg.send "わたしのソースコードは最新です。"
      catch error
        msg.send "git pull failed: " + error
    
    else
      msg.reply "アクセス権限がありません。"
