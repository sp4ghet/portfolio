module Works.View exposing (root)

import Works.Types exposing (..)
import Works.Styling exposing (textBottomStyle, textCenteringStyle)
import Works.Project.Types exposing (Project)
import Common.Styling exposing (..)
import Common.ViewComponents exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


root : Model -> Html Msg
root model =
    div
        [-- radialCosineGradient waveform "top left"
        ]
        [ Html.map Nav (navBar model.navModel)
        , contents (model.projects |> List.map (\m -> m.project))
        , copyrightFooter
        ]



-- Contents


contents : List Project -> Html Msg
contents projects =
    let
        work : Project -> Html Msg
        work project =
            div
                [ class "column"
                , class "is-three-quarters-mobile is-two-thirds-tablet is-half-desktop is-one-third-widescreen is-one-quarter-fullhd"
                , class "has-text-centered"
                , class "work"
                ]
                [ a
                    [ href ("#works/" ++ project.id) ]
                    [ figure
                        [ class "image is-square is-marginless"
                        , style [ ( "position", "relative" ) ]
                        ]
                        [ img [ src project.imgUrl ] []
                        , div
                            [ style [ ( "height", "10%" ) ]
                            , textBottomStyle
                            ]
                            [ p
                                [ textCenteringStyle
                                , class "is-size-6"
                                , class "column"
                                , class "is-vcentered"
                                ]
                                [ text project.title ]
                            ]
                        ]
                    ]
                ]
    in
        section
            [ class "section"
            , style [ ( "position", "relative" ) ]
            ]
            [ div [ class "columns is-multiline is-vcentered is-centered is-mobile is-6" ]
                (List.map work projects)
            ]
