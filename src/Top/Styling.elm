module Top.Styling exposing (radialCosineGradient)

import Html.Attributes exposing (style)
import Html exposing (Attribute)

radialCosineGradient : List (List Float) -> Attribute msg
radialCosineGradient x = style [
  ("background", "radial-gradient(circle at top left," ++ (cosineGradient x) ++ ")")
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
