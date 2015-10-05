'use strict'

OWNERS = ["noir_neo", "Shell"]

module.exports = Owners =
  isFromOwner: (msg) ->
    msg.envelope?.user?.name in OWNERS
