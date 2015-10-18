'use strict'

sinbols = [":ok_woman:", ":innocent:", ":sob:", ":relaxed:", ":uzuki_dark:", ":ninja:", ":tono:", ":octocat:", ":uzuki_vv:", ":makukuma:", ":nsmkkm:"]

module.exports = Slot =
  coin: () ->
    result = ""
    for i in [0..2]
      result += sinbols[Math.floor(Math.random() * sinbols.length)] + " "
    return result;
