'use strict'

ADMIN = ["noir_neo", "Shell"]

module.exports = Admin =
  isFromAdmin: (msg) ->
    msg.envelope?.user?.name in ADMIN
