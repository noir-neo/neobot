'use strict'

child_process = require 'child_process'
owners = require './concerns/owners'

module.exports = (robot) ->

  update = (msg) ->
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
              msg.reply "npm install..."
              child_process.exec 'npm install', (error, stdout, stderr) ->
                if error
                  msg.reply "npm install failed: " + stderr
                else
                  msg.reply "再起動してきますね。"
                  process.exit()
            catch error
              msg.reply "npm update failed: " + error

          else
            msg.reply "わたしは最新の状態です。パパ、次のアップデートはまだかしら？"
    catch error
      msg.reply "git pull failed: " + error

  robot.respond /update/i, (msg) ->
    if owners.isFromOwner msg
      update(msg)
    else
      msg.reply "エラー、アクセス権限がありません。"
