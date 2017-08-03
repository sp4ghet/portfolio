module About.State exposing (init, update)

import About.Types exposing (..)

init : Model
init = Model """
# Rikuo Hasegawa // 長谷川陸央 // ﾊｾｶﾞﾜ ﾘｸｵ

----

Hi. I'm still trying to find my place in the world, but I'm currently an engineer.

Often being told I think like a craftsman; my lifelong dream is to create something great that I can feel happy with, and die happily.

----

## Interests and Skills

- AR // 3DCG // Generative Systems // Complex Emergent Systems // Functional Programming // Reactive Programming // Aquaponics // Control Environment Agriculture

----

## Education and Residencies

- [04/2013 ~ 03/2016] Tokyo Metropolitan Kokusai High School

----

## Career Summary

- [10/2016 ~ current] MIT Media Lab // Open Agriculture Initiative // Projects Assistant
- [04/2016 ~ current] Mogura Inc. // Mogura VR // Writer & VR Developer
- [08/2015 ~ 04/2016] Colopl Inc. // VR Development Team // VR Developer
- [02/2015 ~ 06/2015] Team IcARus // Software Developer (Mainly VR)
- [02/2014 ~ 04/2014] Candle Inc. // Moode // Software Developer

----

## Awards and Grants

- 07/2017 Member // Masayoshi Son Foundation
- 04/2016 Best Prize // Yomiuri Giants Hackathon
- 08/2015 Yahoo Japan Fund Prize // Innovator's Summer Hackathon
- 08/2015 Softbank Prize // Innovator's Summer Hackathon
- 06/2015 Member // Tech Lab Paak (Under Recruit Ltd.)
- 04/2015 Best Prize // BizJapan VRHMD Hackathon

----

## Talks, Exhibits, and Interviews

- 01/2016 [talk] _U18 僕らの未来 ～伊藤穰一と中高生の白熱トークライブ～_ // NHK (TV)
- 01/2016 [interview] _現役学生プログラマーが力を入れる、循環型のエコシステム"アクアポニックス"_ // sensors.jp
  - http://www.sensors.jp/post/demoday_7.html
- 12/2015 [talk] _ボクとレタスの話_ // DemoDay.Tokyo#0
- 05/2015 [interview] _【西川善司】視線追跡機能付きVR HMDからAI搭載ミニ四駆まで。独創的な技術を持つベンチャー企業が集まる「Slush Asia」を見てきた_ // 4gamer.net
  - http://www.4gamer.net/games/999/G999902/20150521013/
- 04/2015 [exhibit] _Drone Space Defense, Team IcARus_ // SLUSH Asia
- 10/2014 [interview] _CODE1000メンター田中洋喜×谷脇大輔が語る「プログラミングが上達するコツ」_ // CodeIQ
  - https://codeiq.jp/magazine/2014/10/17138/
"""

update : Msg -> Model -> (Model, Cmd msg)
update message model =
  (model, Cmd.none)
