module Common.Helpers exposing (..)

find : (a -> Bool) -> List a -> Maybe a
find pred list =
  case list of
    x::xs ->
      if pred x then Just x else (find pred xs)
    [] ->
      Nothing
      
remove : a -> List a -> List a
remove x xs =
    case xs of
        [] ->
            []

        y :: ys ->
            if x == y then
                ys
            else
                y :: remove x ys
