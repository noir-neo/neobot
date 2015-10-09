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
  robot.hear /https:\/\/trello\.com\/c\/(\w+).*/i, (msg) ->
    shortlink = msg.match[1]
    trello.card shortlink, (err, data) ->
      if err
        msg.send "あ、あら？ おかしいですね。カードの取得に失敗しました。"
        return
      moment = require('moment-timezone')
      due = moment.tz(data.due, 'Asia/Tokyo')
        .format('ddd, MMM D [at] LT (z)')
      msg.send "#{ data.name } is due #{ due }\n#{ data.url }"
