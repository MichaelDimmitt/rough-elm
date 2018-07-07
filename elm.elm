import Html

main : Html.Html msg
main =
  myButton 


myButton : Html.Html msg
myButton = Html.button [] myInnerArray

myInnerArray : List(Html.Html msg)
myInnerArray =
  [Html.text "Hello" ]

