import Calculator exposing (update, view)
import StartApp.Simple exposing (start)

main =
  start
    { model = "350000"
    , update = update
    , view = view
    }

