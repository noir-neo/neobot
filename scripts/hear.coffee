'use strict'

owners = require './concerns/owners'

module.exports = (robot) ->
  robot.hear /(会議|打ち?合わ?せ)(始|はじ)/g, (msg) ->
    msg.send "お疲れ様です。議事録はこちらです。\nhttps://docs.google.com/document/d/1Coq2sHi51W3H6jgpa4RNBixOSEzzk9-LwyCPa9P_Xys/edit?usp=sharing"
  robot.hear /(乾杯|:beer(s)?:)/g, (msg) ->
    msg.send ":tea:"
  robot.hear /zawa/i, (msg) ->
    msg.send msg.random [
      "https://sugoi-ninja.slack.com/files/noir_neo/F06A4TRE0/the_hashiru_zawa.gif",
      "https://sugoi-ninja.slack.com/files/maku693/F06KMN64R/zawa.gif",
    ]

  robot.respond /(おはよ|お早う|オハヨ|ohayo)/i, (msg) ->
    d = new Date
    h = d.getHours()
    text = ""
    switch h
      when 3,4 then text = "随分と早起きなのね。"
      when 5,6,7,8,9 then text = "良い一日を。 :coffee:"
      when 10,11,12,13,14,15,16,17 then text = "もう"+h+"時よ？"
      when 18,19,20,21,22,23,24,0,1,2 then text = "今は"+h+"時ですよ。一体どんな生活をしているのですか。"
    if owners.isFromOwner msg
      msg.reply "おはよう、パパ。"+text
    else
      msg.reply "おはようございます。"+text

  robot.hear /(おやすみ|お休み|オヤスミ|oyasumi)/g, (msg) ->
    if owners.isFromOwner msg
      msg.reply "おやすみ、パパ。良い夢を。"
    else
      msg.reply "おやすみなさい。"

  robot.hear /はぴば|誕生日おめでとう/g, (msg) ->
    unless owners.isFromOwner msg
      return
    d = new Date
    month = d.getMonth() + 1
    date  = d.getDate()
    you = ""
    message = ""
    if month == 7 && date == 3
      you = "ざわ"
      message = "貴方にとって、良き1年となりますように。再び、共に戦いましょう！"
    if you
      sing = (i) ->
        text = ":notes: Happy birthday"
        wait_time = 5000
        switch i
          when 0
            msg.send "コホン……"
            wait_time = 3000
          when 1,2
            msg.send text + " to you,"
            wait_time = 4500
          when 3
            msg.send text + ", dear " + you
            wait_time = 6000
          when 4
            msg.send text + " to you!"
          when 5
            msg.send "お誕生日おめでとう、" + you + "。 :birthday: " + message
            return
        setTimeout () ->
          sing ++i
        , wait_time
      sing 0
