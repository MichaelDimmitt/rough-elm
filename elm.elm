import Html
import Html.Attributes
import Html.Events

type alias Model
  = Bool

-- algerbraic data type.
type Msg 
  = Click

main : Program Never Model Msg
main =
  Html.beginnerProgram
    { model  = myModel
    , view   = myView
    , update = myUpdate
    }
  -- myButton 

myModel : Model
myModel = 
  True

-- Render the state of the application as HTML

-- Render state of application as Html
myView : Model -> Html.Html Msg
myView x = 
  -- definitions
  let blah = addOne 3 
  in
  Html.div
    []
    [
      Html.button
        [Html.Events.onClick Click]
        [ Html.text "Click me"]
      , Html.text (let frog = addOne 3 in frog)
      , Html.text blah
      , Html.text
        ( if x  == True
          then "Goodbye"
          else "Hello")
    ]

myUpdate : Msg -> Model -> Model 
-- take the view and the old model and return a new model which is not the old model
myUpdate x y = not y

-- double dash signifies a comment.
-- button no longer used.

-- main : Html.Html msg
myButton : Html.Html msg
myButton = Html.button [] myInnerArray

myInnerArray : List(Html.Html msg)
myInnerArray =
  [Html.text "Hello" ]

addOne : Int -> String
addOne x =
  toString (x + 1)
