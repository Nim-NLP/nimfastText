import nimfastText/fasttext
# import ospaths
import os
import streams
import strutils

var ft:FastText

const langModel:cstring = "tests" / "lid.176.ftz"

ft.loadModel( constructStdString(langModel) )

var 
    print_prob = false
    k:int32 = 1
    threshold:real = 0.0
    output:vect[pair[real, std_string]]
# var
#   ss = newStringStream("""The first line
# the second line
# the third line""")

# ft.predict(ss,k,print_prob,threshold)
# ft.predict(ss,output,k,threshold)
type
  stringstream* {.importc: "std::stringstream", header: "<sstream>".} = object
  # vect_iterator* {.importcpp: "std::vector::iterator", header: "<vector>".}[T] = object

proc constructStdIStringStream*(s: std_string): istringstream {.importcpp: "std::istringstream(@)", constructor, header: "<sstream>".}
# proc constructIstream*(s: std_string): istream {.importcpp: "std::istream(@)", constructor, header: "<sstream>".}
proc cpp_begin*[T](v: var vect[T];):pointer {.importcpp: "begin", header: "<vector>".}
proc cpp_end*[T](v: var vect[T];):pointer {.importcpp: "end", header: "<vector>".}


template `[]=`*[T](v: var vect[T], key: int, val: T) =
  {.emit: [v, "[", key, "] = ", val, ";"].}

proc `[]`*[T](v: var vect[T], key: int): T {.importcpp: "(#[#])", nodecl.}

proc constructStdStringFromPtr*(a,b: pointer): std_string {.importcpp: "std::string(@)", constructor, header: "<string>".}

# converter toString(x:std_string):cstring {.importcpp: "std::to_string(@)", header: "<string>".}
# converter toString(x:real):cstring {.importcpp: "std::to_string(@)", header: "<string>".}

proc c_str(s: std_string):string {.importcpp: "c_str", header: "<string>".}

# proc repr*[T](v: var vect[T];):cstring =
#   constructStdStringFromPtr(v.cpp_begin(),v.cpp_end()).c_str()

# proc repr*[T,P](v:var pair[T, P]): cstring =
#   constructStdString("($#,$#)" % [$v.first,$v.second])

# proc repr*(v: std_string ): cstring =
#   v.c_str()

proc str*(ss: stringstream, s: std_string) {.importcpp: "std::stringstream::str", header: "<sstream>".}


var ss = constructStdIStringStream(constructStdString("The first line"))
# echo ss
# var 
#   sss = constructIstream(constructStdString("The first line"))
# ft.predict(ss,k,print_prob,threshold)
ft.predict(ss,k,output,threshold)
echo output[0]