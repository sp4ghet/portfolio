module About.State exposing (init, update)

import About.Types exposing (..)
import Common.State as Navbar


init : Model
init =
    Model
        description
        "https://twitter.com/sp4ghet"
        "https://facebook.com/rikuo.hasegawa"
        "https://github.com/sp4ghet"
        "https://bookmeter.com/users/811608"
        Navbar.initNav


update : Msg -> Model -> ( Model, Cmd msg )
update message model =
    case message of
        Nav navmsg ->
            let
                ( navModel, navCmd ) =
                    Navbar.updateNav navmsg model.navModel
            in
                ( { model | navModel = navModel }, navCmd )

        None ->
            ( model, Cmd.none )


description : String
description =
    """
----

Philomath Craftsman; Ideally a polymath but not quite there yet.

I like to do things with computers.

My theme is aesthetics and tools.

----

## Skills

- Graphics // xR  // Functional Programming // Aquaponics // Controlled Environment Agriculture // Web (Front|Back)end // Optimization // DevOps // SysML // Data Engineer

## Interests

- Aesthetics // Tools // Complex Systems // Compilers // Language (synthetic|natural) // Math // Visuals

----

## Education

- [09/2018 ~ Current] University College London
- [04/2013 ~ 03/2016] Tokyo Metropolitan Kokusai High School

----

## Career Summary

- [04/2018 ~ Current] Mercari Inc. // Machine Learning Team // Software Engineer
- [01/2018 ~ 09/2018] Japan Plant Factory Association // Researcher
- [08/2017 ~ 08/2017] Mercari Inc. // Machine Learning Team // Summer Internship
- [10/2016 ~ 10/2017] MIT Media Lab // Open Agriculture Initiative // Projects Assistant
- [04/2016 ~ Current] Mogura Inc. // Mogura VR // Writer & VR Developer ([Articles](https://www.moguravr.com/writer/writer-15309/))
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

## Publications

- Data Warehouse for Plant Phenotyping in Plant Factories // Japanese Society of Agricultural Biological and Environmental Engineers and Scientists // **Rikuo Hasegawa**
- GODEL [poster](/assets/img/projects/GODEL/spring-2017-poster.pdf) // MIT Media Lab Members' Week // **Rikuo Hasegawa**
- Aquaponics ([EN](/assets/pdf/2014.pdf)/[JP](/assets/pdf/2015.pdf)) // Kokusai High School Individual Research Project // **Rikuo Hasegawa**
- [Cancel detection of transactions based on chat messages](http://tech.mercari.com/entry/2017/09/21/170000) // Mercari Tech Blog // **Rikuo Hasegawa**
- 世界における人工光型植物工場の研究開発－課題と展望－ // アグリバイオ　2018年6月号 // 古在 豊樹, 魯 娜, **長谷川 陸央**, 雨谷 弓弥子, 布村　伊, 野崎 友美, Yu Zhang, 林　絵理

----

## Talks, Exhibits, and Interviews

- 09/2018 [conference talk] Data Warehouse for Plant Phenotyping in Plant Factories // JSABEES 2018
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
