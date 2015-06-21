module.exports = (robot) ->
  robot.hear /.*(会議|打ち合わ|打合せ)(始|はじ).*/g, (msg) ->
    msg.send "お疲れ様です。議事録はこちらです。\nhttps://docs.google.com/document/d/1Coq2sHi51W3H6jgpa4RNBixOSEzzk9-LwyCPa9P_Xys/edit?usp=sharing"
  robot.hear /(乾杯|:beer(s)?:)/g, (msg) ->
    msg.send ":tea:"
  robot.hear /zawa/i, (msg) ->
    msg.send msg.random [
      "https://sugoi-ninja.slack.com/files/noir_neo/F06A4TRE0/the_hashiru_zawa.gif",
      "https://sugoi-ninja.slack.com/files/maku693/F06KMN64R/zawa.gif",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN0ZCG/2013-08-12_07.18.46_hdr.jpg",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN2C3H/cimg5775.jpg",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN4G2D/img_0720.jpg",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN4G81/img_0721.jpg",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN2X50/img_0729.jpg",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN2XEW/img_2948.jpg",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN2TLP/img_3079.jpg",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN4N9Z/img_3144.jpg",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN35GS/img_3373.jpg",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN4YMA/img_3429.jpg",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN32CX/img_3453.jpg",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN56UC/img_3529.jpg",
      "https://sugoi-ninja.slack.com/files/noir_neo/F06KN3DPC/img_3820.jpg",
    ]