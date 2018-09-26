switch("path", "$projectDir/../")
import ospaths
# import strutils
let langModel = joinPath(thisDir(),"lid.176.ftz")

# switch("define","LANG_MODEL:#$" % [$langModel])
if not fileExists(langModel):
    exec "wget https://s3-us-west-1.amazonaws.com/fasttext-vectors/supervised_models/lid.176.ftz -O tests/lid.176.ftz"