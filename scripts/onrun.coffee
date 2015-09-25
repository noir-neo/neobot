'use strict'

module.exports = (robot) ->
  cid = setInterval ->
      return if typeof robot?.send isnt 'function'
      robot.send {room: "noir_neo"}, "――起動シークエンス確認、オールグリーン。"
      clearInterval cid
    , 1000
