module Blog.Contents.Lookback2018 exposing (..)

import Blog.Article.Types exposing (..)
import Date exposing (Date)


article : Article
article =
    Article
        "2018年を振り返る"
        "lookback-2018"
        (Date.fromString "12/31/2018")
        "2018年も色々ありましたね"
        [ Words firstText
        , Youtube "OTTJK_li17s"
        , Words secondText
        , Instagram "Bdo4qSVF_xL"
        , Words thirdText
        ]


firstText : String
firstText =
    """
あけましておめでとうございます。

紅白を見ながら親族と話が通じないことをひしひしと感じながら書いていますが、備忘録的に今年あったことを振り返りたいと思います。

## 成果
-----

今年は正直大した成果は得られなかったのですが、一応何個かありました。

始めてVJをしました。8月末に 適当にび〜るを飲みながら喋っていたらVJしたいと思って急ピッチでInfiniteRaveというVJイベントを9/15に開催しました。
関係者各位には僕のわがままに付き合っていただき助かりました、最高に楽しかったです。
"""


secondText : String
secondText =
    """
生まれて始めて学術論文を書いて学会にて成果を発表しました。
アカデミックにはさほど評価されるような内容ではないのですが自分にとっては勉強になる体験でした。

山口情報芸術センター（YCAM）の新しい常設展示のStudio-Dの一部を監修しました。
リモートでの仕事の難しさを再度確認しました。リモート難しい・・・

## 勉強
-----

今年の4月ぐらいから株式会社メルカリでインターンを再開して、仕事でKubernetesを使うのでKubernetesやその周辺技術を勉強したりしました。
Kubernetesの設計はとてもわかりみが深くていいですね。

同じ仕事でReactを使ったSPA実装とかをやったのでReactを今年に入ってから触りました。

なんやかんやでWebGLスクールに行ったりWebGLな人々と接する中でWebGLやthree.jsの勉強してました。
GLSL楽しいですね、僕はすきです。

言語処理系の勉強がしたくて今年の上旬はLisp処理系の実装をしたり、今はLLVMの本を読んだりしています。
来年は型とかについて勉強したいです。

あと今は30日OS本を読みながらOSについての理解を深めつつありますが、来年は実際のOSのコードリーディングとかをして理解を深めていきたいと思います。

あとは大学で数学をもりもりやっていくつもりなので数学の勉強を少しずつやっています。オンライン学習、解析、幾何学、圏論（あんまよくわかってない）等浅くやってます。

## 私生活
-----

成人しました。
"""


thirdText : String
thirdText =
    """
成人式最高に面白かったです。

なんか4月頃に大学行きたいなと思って大学受験して、大学に受かったので9月からイギリスのUCLという大学で勉強しています。
厳密には学部生ではなくFoundation Courseというやつなのですが実質B1です。

ロンドンに住んでいるのですが、なんかいい感じです。寒くて暗くてとても良い。
後輩と同居することになったので来年からは喧嘩しないように頑張りたいです。

今年はたくさん音楽を聞いたので僕のPlaylistみてください:

[![](https://i.ytimg.com/vi/nM0xDI5R50E/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLC5LvKId34O5U9g0BlvR2T0FlJDKA)](https://www.youtube.com/playlist?list=PL3TuQVTkWLNqKak1-efG7QXsWS4Mx34CC)

"""
