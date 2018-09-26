import nimfastText/fasttext
# import ospaths
import os
import streams


var ft:FastText

const langModel:cstring = unixToNativePath("tests" / "lid.176.ftz")

ft.loadModel( constructStdString(langModel) )