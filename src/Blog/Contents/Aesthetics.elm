module Blog.Contents.Aesthetics exposing (..)

import Blog.Article.Types exposing (..)
import Date exposing (Date)


article : Article
article =
    Article
        "Fuga Article"
        "aesthetics"
        (Date.fromString "November 20 2018")
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae dignissim purus. Aenean eget enim quis orci rutrum cursus eget sed nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce id arcu neque. Vivamus sit amet posuere quam, nec tincidunt velit. Morbi pretium lectus eu diam scelerisque ultrices. Proin rutrum eu ligula sed pretium. Suspendisse varius pretium sapien ac ornare. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent ac suscipit nibh, vitae vehicula metus. Integer vitae nisl ullamcorper, dictum est sed, ultricies risus. Suspendisse tincidunt sapien sed ex mollis convallis. Morbi lacinia mi vel elit venenatis, vel dapibus dui efficitur. Morbi tortor mi, finibus in interdum ut, condimentum non mauris. Fusce eu gravida justo, feugiat rutrum nunc. Etiam commodo vitae felis quis fringilla."
        [ Words "hoge" ]
