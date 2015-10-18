'use strict'

slot = require './concerns/slot'

module.exports = (robot) ->
  robot.respond /slot/i, (msg) ->
    msg.send slot.coin()
