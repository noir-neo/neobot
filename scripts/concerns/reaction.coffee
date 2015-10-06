'use strict'

module.exports = Reaction =
  add: (msg, emoji) ->
    params = "token=#{ process.env.HUBOT_SLACK_TOKEN }&name=#{ emoji }&channel=#{ msg.message.rawMessage.channel }&timestamp=#{ msg.message.id }"
    url = "https://slack.com/api/reactions.add?#{ params }"
    msg.http(url).get() (err, res, body) ->
      robot.logger.info "#{ body }"
