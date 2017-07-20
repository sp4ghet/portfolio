module Common.Styling exposing (
  radialCosineGradient
  ,firstEnStyle
  ,lastEnStyle
  ,firstJpStyle
  ,lastJpStyle
  )

import Html.Attributes exposing (style)
import Html exposing (Attribute)

firstEnStyle : Attribute msg
firstEnStyle = style
  [
  ("grid-column-start", "1"),
  ("grid-column-end", "5"),
  ("grid-row-start", "1"),
  ("grid-row-end", "1"),
  ("border-bottom", "1px dashed #FFF")
  ]

lastEnStyle : Attribute msg
lastEnStyle = style
  [
  ("grid-column-start", "1"),
  ("grid-column-end", "7"),
  ("grid-row-start", "2"),
  ("grid-row-end", "3")
  ]

lastJpStyle : Attribute msg
lastJpStyle = style
  [
  ("grid-column-start", "5"),
  ("grid-column-end", "11"),
  ("grid-row-start", "1"),
  ("grid-row-end", "1"),
  ("border-bottom", "1px dashed #FFF")
  ]

firstJpStyle : Attribute msg
firstJpStyle = style
  [
  ("grid-column-start", "7"),
  ("grid-column-end", "11"),
  ("grid-row-start", "2"),
  ("grid-row-end", "3")
  ]

-- Cosine Gradient stuff

radialCosineGradient : List (List Float) -> String -> Attribute msg
radialCosineGradient waveforms position = style [
  ("background", "radial-gradient(circle at " ++ position ++ "," ++ (cosineGradient waveforms) ++ ")")
  ]

cosineGradient : List (List Float) -> String
cosineGradient x =
  case x of
    [[rInt, gInt, bInt], [rAmp, gAmp, bAmp], [rFreq, gFreq, bFreq], [rPhase, gPhase, bPhase]] ->
      let
        r = cosine rInt rAmp rFreq rPhase
        g = cosine gInt gAmp gFreq gPhase
        b = cosine bInt bAmp bFreq bPhase
        segment : Float -> Float -> String
        segment n m =
          if n < m then
            "rgb(" ++ toString (r (n/m)) ++ "," ++ toString (g (n/m)) ++ "," ++ toString (b (n/m)) ++ ")," ++ (segment (n+1) m)
          else if n == m then
            "rgb(" ++ toString (r 1.0) ++ "," ++ toString (g 1.0) ++ "," ++ toString (b 1.0) ++ ")"
          else
            ""

      in
        segment 0 10
    _ ->
      ""

cosine : Float -> Float -> Float -> Float -> Float -> Int
cosine int amp freq phase x =
  let
    rate = (int - 0.5) + (amp) * ((cos (freq*x*6.2831853 + phase*6.2831853)) + 1.0)
  in
    round (rate * 255)
