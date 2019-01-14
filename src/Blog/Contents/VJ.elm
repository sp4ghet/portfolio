module Blog.Contents.VJ exposing (..)

import Blog.Article.Types exposing (..)
import Date exposing (Date)


article : Article
article =
    Article
        "VJってやつをやりました"
        "vj"
        (Date.fromString "01/14/2018")
        "InfiniteRaveというVJイベントを開催しました。個人的にはVJ・クリエイティブコーディング界隈の大御所の方々にtwitterでフィードバック頂いたり、やきとり食べたりできたのでだいぶ幸せです。"
        [ Words mainText
        , Youtube "OTTJK_li17s"
        , Words secondText
        , Instagram "BpHmWG2DEzy"
        , Words thirdText
        , Youtube "Crtsiduvv-I"
        , Youtube "19VzLe0fMjo"
        , Words references
        ]


mainText : String
mainText =
    """

- イベント詳細
- 映像
- VJシステム
  - 設計
  - 素材ズ
- 参考資料
  - 使ったOSS
  - 参考にした作品たち
  - 参考にした記事

## VJイベントについて

9/15にInfiniteRaveというVJイベントをShibuya CAST.ビル内にある孫正義育英財団の施設、Infinityにて開催しました。告知を始めて最初の1週間は6人ぐらいしか予約なかったので一時期はかなり焦りましたがなんだかんだで55人の来場者に来ていただいてそれなりに賑わってました。個人的にはVJ・クリエイティブコーディング界隈の大御所の方々にtwitterでフィードバック頂いたり、やきとり食べたりできたのでだいぶ幸せです。

事の発端としては8月半ばのBRDGのADirector Channelを見に行って「やっぱイギリス行く前にVJやりてぇ」っていう僕のわがままから始まったので爆速実施の適当運営に付き合ってくれた出演者一同、財団の方々、スタッフの方々、機材を貸してくださった方々、その他協力していただいた方々には感謝しつくしてもしきれません。ありがとうございました。

出演者は(DJ//VJ):
- Yoshiaki Sakoshita//kaiware
- Gaku//sp4ghet
- Gaku//amagi takayosi
- $hun a.k.a Luigi//sleepJam
- prhyzmica//FMS_Cat

というかなり豪華なライナップでした。

「みんなレイマーチングしてんじゃねーか、ルックが同じになるのでは？」と心配してましたが案外みんな違う感じになっていてよかったです。詳しくは映像をみてください！
"""


secondText =
    """
## VJシステム

僕が尊敬している[橋本麦さん](https://baku89.com/articles)を見習って可能な限り今回のVJシステムの技術的解説や得られた知見を共有できればと思います。

TL;DR
- [https://github.com/sp4ghet/vj-infiniterave](https://github.com/sp4ghet/vj-infiniterave)
- UnityをメインにしたVJシステム
- Reduxっぽい設計
- Vedaの画面をNDIで送信
- 素材は適当に作っていく(パクっていく)

今回は使い慣れているUnityをメインに開発をすすめていきました。
Unity Technologies JapanのKeijiro Takahashi大先生が難しいことを色々やってくれているのでMIDI, NDI, オーディオ解析などは基本的に何も考えずに使えました。ありがたい。

### コントロール、イベント設計

システムそのものはredux/Elm Architectureっぽい感覚で設計しました。これもkeijiro/Flipperで使われているスタイルでしたが、よりelmっぽくするためにModelの役割としてGlobalStateというシングルトンを作って、ステートはなるべくそこで管理して、SceneControllerというUpdateの役割を担うMonoBehaviourで様々なイベント用の関数を用意していきました。各素材オブジェクトはViewっぽい扱いで、GlobalStateの値をUpdateなどで参照することでその変化に対応して動作を変化させます。

MIDIControllerなどのデバイス入力では単純に入力をSceneControllerのメソッドに変換する薄いラッパーとして考えました。MIDIの値はすべて0-1になっていたのでそこまで意識せず変換しなくてもよかったですが別のデバイスだったらそのへんもコントローラークラスに入れるべきかもです。今回使用したMIDIコントローラは去年amazonで探した一番安かったMIDIコントローラの[ARTURIA BEATSTEP ](https://www.amazon.co.jp/dp/B019RDQ4WI/)です。つまみがあまりよくなかったのでスライダーとかがついてるnanoKontrol辺りが良いかもです。

GlobalStateを用意する利点のひとつとしてはBPMなどを一つの場所で管理できることなどが挙げられますが、ひとつの素材にしか影響の及ばないStateなども管理しているのでこれ以上複雑になるとコンポーネントとかを用意してStateを細かく分割したりする必要があるかもです。

### 素材ズ

今回VJもしていただいたamagiさんが開発しているAtomでGLSLが書ける [veda](https://github.com/fand/veda) をキャプチャしてUnityに持ってきてライブコーディングっぽいことをしてみました。キャプチャソフトOBS Studioのプラグインで obs-ndi というものがあったのでそれをNDI SenderにしてUnity側でNDI入力をRenderTextureとして受け取って板ポリに当てる感じです。挙動がだいぶ不安定なので同じマシンのローカルでのキャプチャを使っていたのもありモニタが結果的に3枚(VJ out, atom, debug preview)必要になるなどかなりデメリットは大きかったですが最終的にその部分は30分間は動いてくれました。

絵の中心となっているのはレイマーチングで描画しているウネウネしたやつです。レイマーチングのオブジェクトは凹さんのObject Space Raymarchingを参考にしています。影が落ちたりReflectionなども効いてかっこいい感じです。 Distance Functionは iqさんの上げているものをいくつか適当につなげて動かしています。今ならuRaymarchingを使ったほうが良いのかも？
当初はMIDIコンを叩くと変形するようにしたのですが、忙しくなりすぎるので勝手に動くようにしました。一応最後に苦し紛れでWorldSpaceなものも作りました。これはエレベーターっぽい絵と、シェルピンスキートライアングルを使ったものになっています。
"""


thirdText =
    """
オーディオリアクティブな素材が3つあります。4分音符＋低い音に反応して発生する正n角形メッシュのRadialMeshと、8部音符+中くらいの音に発生する絵文字のパーティクルと、オーディオビジュアライザっぽい動きをするWaveTunnelです。前者ふたつはkeijiro/LaspのLowPassPeakやBandPassPeakを使っており、最後のはGetSpectrumの波形をLog変換して渡しています。
オーディオリアクティブな素材は実際にVJしているときにあまり世話をしなくても勝手にいい感じになってくれるので便利でした。総じて言えることですがもっとオーディオリアクティブな素材を作ればよかったと反省してます。絵文字パーティクルは当日の朝とかに考えて実装したので事前にもっとやる気出してればもっとやれた・・・

Meshをよしなに作って、音に合わせて変形させるにあたってかなり手打ちで頂点や三角形の順番を指定しましたが、一度やってしまえば変形させるほうは比較的簡単にできるのでよかったです。また、微妙な点ですが、トンネルの進行が曲がるようにも工夫してみましたがちょっとわかりづらかったのでもうちょっと映えるように工夫が必要です。

今回色々試行錯誤した結果感じたのは実装の難易度は特に絵としての良さには相関が無いということでした。めっちゃめんどくさいポストエフェクトよりは普通にRecolorで全体の配色を変えたりしたほうが楽できれいだったりするのでそのへんの嗅覚は磨く余地がありそうです。Recolorは`Gradient`型の配色で画面の色味を調整するのですが、僕の知るAlgorithmicなカラーパレットはCosine Gradientしか無いのでとりあえずそれをC#で実装してMIDI入力で`Gradient`が変わるようにしました。
RandomGradientを生成するときに、色味の統一感を維持しつつランダム性も保つために地味にRandomRangeを調整したりしています。

全体的な反省としては素材の数が足りなくて途中から飽きてしまう絵になってしまったのと、DJの流れに合わせた展開などを意識する暇もなくアセアセと適当にボタンを押してる状態だったのが悔やまれます。 ライブコーディングの部分に関しても、よほど普段から書いていない限りもっと絵のパターンを用意したりしておかないと当日適当にコードを書いてまともな絵になることは無いですね。また、Unity側で画面中央に絵がある状態でVedaでも画面中央にある図形をコネコネしているとVeda側が何も見えないのでものすごく無駄な時間が過ぎていた場面があり、Previewモニタで逐一最終出力の雰囲気を確認しながらやっていくべきでした。

いくつかの習作や途中経過等を掲載しておきます:
"""


references =
    """
## 参考資料

### 使ったOSS

- https://github.com/keijiro/Lasp
- https://github.com/keijiro/Kino
- https://github.com/keijiro/KlakNDI
- https://github.com/keijiro/MidiKlak

### 参考にした作品たち

- https://github.com/keijiro/Flipper
- https://github.com/keijiro/Museum
- https://pixelspiritdeck.com/
- https://eizo100.jp/
- http://a.co/d/9AduqaU
- https://twitter.com/thespite/status/1033398219705917447
- https://twitter.com/_Nokir/status/1039610501418762240


### 参考にした記事

- http://tips.hecomi.com/entry/2016/09/26/014539
- https://indievisuallab.stores.jp/items/59edf11ac8f22c0152002588
- https://docs.unity3d.com/Manual/GeneratingMeshGeometryProcedurally.html
- https://docs.unity3d.com/ScriptReference/AudioSource.GetSpectrumData.html
- https://docs.google.com/presentation/d/12RrqyAkFanKmfL96ZHvhDCozE-_rKFPlU1YVwej4_bc/edit
- https://iquilezles.org/www/articles/distfunctions/distfunctions.htm
- https://www.ameet.jp/digital-imaging/2094/
- http://dev.thi.ng/gradients/

"""
