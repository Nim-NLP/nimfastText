import nimfastText/fasttext
import ospaths
import os
import streams

var ft: FastText
const langModel = unixToNativePath("tests" / "lid.176.ftz")
# let s = newFileStream(langModel,fmRead)

ft.loadModel(langModel)