'use strict'

module.exports = (robot) ->
  robot.respond /(tabi|たび)/i, (msg) ->
    robot.http("https://api.vineapp.com/timelines/users/1038468495395958784")
      .get() (err, res, body) ->
        records = JSON.parse(body)['data']['records']
        tabis = []
        for record in records
          if record.entities[0]?.id == 1138830969860853760
            tabis.push(record.shareUrl)
        msg.send msg.random tabis
