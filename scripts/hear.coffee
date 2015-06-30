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

  robot.hear /(おはよ|お早う|オハヨ|ohayo)/i, (msg) ->
    d = new Date
    h = d.getHours()
    text = ""
    switch h
      when 3,4 then text = "随分と早起きなのね。"
      when 5,6,7,8,9 then text = "良い一日を。 :coffee:"
      when 10,11,12,13,14,15,16,17 then text = "もう"+h+"時よ？"
      when 18,19,20,21,22,23,24,0,1,2 then text = "今は"+h+"時ですよ。一体どんな生活をしているのですか。"
    if msg.envelope?.user?.name == papa_name
      msg.reply "おはよう、パパ。"+text
    else
      msg.send "おはようございます。"+text

  robot.hear /(おやすみ|お休み|オヤスミ|oyasumi)/g, (msg) ->
    if msg.envelope?.user?.name == papa_name
      msg.reply "おやすみ、パパ。良い夢を。"
    else
      msg.send "おやすみなさい。"
