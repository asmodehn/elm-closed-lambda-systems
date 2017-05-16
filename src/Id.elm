module Id exposing (..)

-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/time.html

import ClockModel exposing (Model, Msg)

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)


-- MODEL

type Id = Id0 | Id1 | IdNode Id Id

norm : Id -> Id
norm id =
  case id of
    IdNode Id0 Id0 -> Id0
    IdNode Id1 Id1 -> Id1
    Id -> id


split : Id -> Id
split id =
  case id of
    Id0 -> IdNode Id0 Id0
    Id1 -> IdNode (IdNode Id1 Id0) (IdNode Id0 Id1)
    IdNode Id0 i -> let IdNode i1 i2 = split i in IdNode (IdNode Id0 i1) (IdNode Id0 i2)
    IdNode i Id0 -> let IdNode i1 i2 = split i in IdNode (IdNode i1 Id0) (IdNode i2 Id0)
    IdNode i1 i2 -> IdNode (IdNode i1 Id0) (IdNode Id0 i2)


sum : Id -> Id -> Id
sum id1 id2 =
  case (id1, id2) of
    (Id0, Id) -> id2
    (Id, Id0) -> id1
    ((IdNode idl1 idr1), (IdNode idl2 idr2)) -> norm (IdNode sum(idl1 idl2) sum(idr1 idr2))





-- UPDATE


-- SUBSCRIPTIONS


-- VIEW
