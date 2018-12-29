module Blog.Contents.September exposing (article)

import Blog.Article.Types exposing (..)
import Date exposing (Date)


article : Article
article =
    Article
        "September 2017"
        "september2017"
        (Date.fromString "10/03/2017")
        summary
        [ Words mainText
        , Instagram "BZl49Etly5q"
        , Words rest
        ]


summary : String
summary =
    "８月は日本に戻ってmercariという会社で１ヶ月間機械学習エンジニアとしてインターンしていまして、そのときのインターン同期である [しょぺたん](http://shopetan.hatenablog.com/) さんがやってる日記ならぬ月記をパクろうと思います。 ちなみにインターン中の成果を公式ブログに掲載してくださったので転載しておきます：[http://tech.mercari.com/entry/2017/09/21/170000](http://tech.mercari.com/entry/2017/09/21/170000)"


mainText : String
mainText =
    """
８月は日本に戻ってmercariという会社で１ヶ月間機械学習エンジニアとしてインターンしていまして、そのときのインターン同期である [しょぺたん](http://shopetan.hatenablog.com/)さんがやってる日記ならぬ月記をパクろうと思います。 ちなみにインターン中の成果を公式ブログに掲載してくださったので転載しておきます： <http://tech.mercari.com/entry/2017/09/21/170000>

## 出来事

* * *

### シンガポール

シンガポール行ってきました。楽しかった。主にかわいい後輩に会いに行ったものだけど、Gardens by the Bayという熱帯山岳地帯を模した施設園芸の建築技術とかを見ることができて解説してある本も買えて勉強になりました。あと、基本的に後輩に冷たくされてるので読書が捗ってTDDの本とか植物の本とかが読めて割りと有意義な１週間を過ごせました。

### ラボに戻る

メディアラボに帰ってきました。

### Ig Nobel Prize

イグノーベル賞の授賞式に行ってきました。

> [Ig Nobel Prize](https://www.instagram.com/p/BZCkX_JFrR9/)
>
> A post shared by Rikuo Hasegawa (@spaghet_rikuo) on Sep 14, 2017 at 4:37pm PDT

登壇の時間超過すると８歳時が出てきて"Please stop, I'm bored. Please stop, I'm bored. Please stop, I'm bored"と連呼したり、なんか紙飛行機投げたり、Uncertaintyと誰かが言ったらWOOOOO!!!!って言ったり、よくわからない感じでしたが「まず笑わせ、そしてふと考えさせられる研究」という評価軸は非常に面白いし本質を突いているんだろうなと思いました。 高校生が理想的なコーヒーの運搬方法について８５ページぐらいの論文を書いて受賞したりもしていたのですごいなぁと思ったり、新鮮だった。

### たくさん読み物をした

本でいうと2000ページぐらい、論文も何十本か読んだので個人的には読み物を多くした月です。 内容的にはソフトウェアエンジニアリング系の本と、植物系の本と、植物工場系のものたちです。

### Goに触れた

なんかあの青いアレで有名なGoをとりあえずTour of Goして公式ブログを舐め回して試しにARM向けにクロスコンパイルしたりしてみました。

### うどんを食べる
"""


rest : String
rest =
    """

  めっちゃ通ってる『[夢を語れ](http://www.yumewokatare.com/ja/)』という二郎系のラーメン屋がうどん屋さんの『夢があるから』を開店したので食べました。3,4回行ってます。 うまし。サービスでうどん二杯目くれたりしたので嬉しい。 ちなみにこのインスタグラムは食べ終わった皿の画像を上げるだけのアカウントです。

  ## ９月の反省

  * * *

    * コードをもっと書くべきだった
    * 週末は平均で28時間ぐらい寝ていたのでなんか間違えてる気がする
    * ストレスが溜まりすぎていた
      * 毎朝7時起きをしていたりするからかもしれない

  ## １０月やりたいこと

  * * *

    * コードを毎日書く草活
      * 今月はインプットした分来月はアウトプットしたい
      * http://memo.yuuk.io/entry/2017/05/07/225123
      * https://johnresig.com/blog/write-code-every-day/
    * ストレスを溜め込まない
    * 生活に習慣を取り入れる（コーディング、運動）
    """
