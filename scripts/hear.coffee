papa_name = "noir_neo"
module.exports = (robot) ->
  robot.hear /(会議|打ち合わ|打合せ)(始|はじ)/g, (msg) ->
    msg.send "お疲れ様です。議事録はこちらです。\nhttps://docs.google.com/document/d/1Coq2sHi51W3H6jgpa4RNBixOSEzzk9-LwyCPa9P_Xys/edit?usp=sharing"
  robot.hear /(乾杯|:beer(s)?:)/g, (msg) ->
    msg.send ":tea:"
  robot.hear /zawa/i, (msg) ->
    msg.send msg.random [
      "https://sugoi-ninja.slack.com/files/noir_neo/F06A4TRE0/the_hashiru_zawa.gif",
      "https://sugoi-ninja.slack.com/files/maku693/F06KMN64R/zawa.gif",
    ]
  robot.respond /おはよう/g, (msg) ->
    if msg.envelope?.user?.name == papa_name
      msg.reply "おはよう、パパ。気分はどうかしら？"
    else
      msg.send "おはようございます。"
  robot.respond /おやすみ/g, (msg) ->
    if msg.envelope?.user?.name == papa_name
      msg.reply "おやすみ、パパ。良い夢を。"
    else
      msg.send "おやすみなさい。"
