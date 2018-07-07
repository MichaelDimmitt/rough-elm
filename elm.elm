-- lookup : auto currying
import Html
import Html.Attributes
import Html.Events

-- type Small5List a = (a,a,a,a,a)

type alias Model
  = List Bool

-- algerbraic data type.
-- int being the index of the button.
type Msg 
  = Click Int

main : Program Never Model Msg
main =
  Html.beginnerProgram
    { model  = myModel
    , view   = myView
    , update = myUpdate
    }
  -- myButton 

myModel : Model

-- change the model to whatever you want and let the compiler guide you to future values.
-- when is the right time to break out the model and the view.
-- dont couple a view to a model.
-- typically we let the data drive the application.
myModel = 
  [False, False, True, False]

myView : Model -> Html.Html Msg
myView model = 
  Html.div [] (List.indexedMap myButtonView model)

-- Render the state of the application as HTML

-- Render state of application as Html
myButtonView : Int -> Bool -> Html.Html Msg
myButtonView i button = 
  -- definitions
  let blah = addOne 3 
  in
  Html.div
    []
    [
      Html.button 
        [Html.Events.onClick (Click i)] 
        [ Html.text "Click me"]
      , Html.text (let frog = addOne 3 in frog)
      , Html.text blah
      , Html.text
        ( if button  == True
          then "Goodbye"
          else "Hello")
    ]

myUpdate : Msg -> Model -> Model 
-- take the view and the old model and return a new model which is not the old model
myUpdate msg model = 
  case msg of 
    Click i -> 
    List.indexedMap (updateButton i) model

-- does type inference the entire time you dont have to declare the types but 
-- if you tried to change a type incorrectly it would throw an error.
updateButton : Int -> Int -> Bool -> Bool
updateButton i index button =
 if i == index then not button else button

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
