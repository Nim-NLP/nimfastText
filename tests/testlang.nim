import nimfastText/fasttext
# import ospaths
import os
import streams

var ft = constructFastText()

let langModel = unixToNativePath("tests" / "lid.176.ftz")

ft.loadModel(langModel)