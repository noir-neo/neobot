Trello = require 'node-trello'

module.exports = (robot) ->
  robot.respond /todo \"(.+)\"/i, (msg) ->
        title = "#{msg.match[1]}"
        trello = new Trello(process.env.HUBOT_TRELLO_KEY, process.env.HUBOT_TRELLO_TOKEN)
        trello.post "/1/cards", {name: title, idList: process.env.HUBOT_TRELLO_LIST_TODO}, (err, data) ->
          if err
            msg.send "あ、あら？ おかしいですね。カードの追加に失敗しました。"
            return
          msg.send "「#{title}」を Trello の ToDo リストに追加しました。"
