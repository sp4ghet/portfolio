module Project.View exposing (root)

autoloopMp4 : String -> Html msg
autoloopMp4 url = video [videoStyle, autoplay True, loop True] [
    source [
      src url,
      type_ "video/mp4"
      ] [],
    text "No video support"
    ]

videoStyle : Attribute msg
videoStyle = style
  [
  ("height", "98%")
  ]
