child_process = require 'child_process'

permitted_users = ["noir_neo"]

module.exports = (robot) ->

  robot.respond /update/i, (msg) ->
    if msg.envelope?.user?.name in permitted_users

      try
        msg.reply "git pull..."
        child_process.exec 'git pull origin master', (error, stdout, stderr) ->
          if error
            msg.reply "git pull failed: " + stderr
          else
            output = stdout+''
            if not /Already up\-to\-date/.test output
              msg.reply "わたしのソースコードが更新されました:\n" + output

              try
                msg.reply "npm update..."
                child_process.exec 'npm update', (error, stdout, stderr) ->
                  if error
                    msg.reply "npm update failed: " + stderr
                  else
                    output = stdout+''
                    if /node_modules/.test output
                      msg.reply "some dependencies updated:\n" + output
                    else
                      msg.reply "all dependencies are up-to-date"
                    msg.reply "再起動してきますね。"
                    process.exit()
              catch error
                msg.reply "npm update failed: " + error

            else
              msg.reply "わたしは最新の状態です。パパ、次のアップデートはまだかしら？"
      catch error
        msg.reply "git pull failed: " + error
    
    else
      msg.reply "エラー、アクセス権限がありません。"