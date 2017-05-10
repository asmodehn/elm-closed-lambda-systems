import Html exposing (Html)
import ClockModel exposing (init, update, subscriptions)
import ClockView exposing (view)

main =
  Html.program
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }

