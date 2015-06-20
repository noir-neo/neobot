module.exports = (robot) ->
  robot.hear /.*(会議|打ち合わ|打合せ)(始|はじ).*/g, (msg) ->
    msg.send "お疲れ様です。議事録はこちらです。\nhttps://docs.google.com/document/d/1Coq2sHi51W3H6jgpa4RNBixOSEzzk9-LwyCPa9P_Xys/edit?usp=sharing"
  robot.hear /:beer(s)?:/g, (msg) ->
    msg.send ":tea:"
    