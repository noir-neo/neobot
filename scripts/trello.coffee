'use strict'

trello = require './concerns/trello'

module.exports = (robot) ->
  robot.respond /todo \"(.+)\"/i, (msg) ->
    title = "#{msg.match[1]}"
    trello.todo title, (err, data) ->
      if err
        msg.send "あ、あら？ おかしいですね。カードの追加に失敗しました。"
        return
      msg.send "#{title} を Trello の ToDo リストに追加しました。"
