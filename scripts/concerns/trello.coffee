'use strict'

_trello = ->
  node_trello = require 'node-trello'
  new node_trello(process.env.HUBOT_TRELLO_KEY, process.env.HUBOT_TRELLO_TOKEN)

module.exports = Trello =
  todo: (title, callback) ->
    _trello().post "/1/cards", {name: title, idList: process.env.HUBOT_TRELLO_LIST_TODO}, (err, data) ->
      callback err, data
  card: (shortlink, callback) ->
    _trello().get "/1/cards/#{ shortlink }", (err, data) ->
      callback err, data
