# Package

version       = "0.1.0"
author        = "genotrance"
description   = "fastText wrapper for Nim"
license       = "MIT"

skipDirs = @["tests"]

# Dependencies

requires "nimgen >= 0.4.0"

import distros
import ospaths

var cmd = ""
if detectOs(Windows):
  cmd = "cmd /c "

task nimgen, "Install nimgen":
  exec cmd & "nimble install nimgen -y"

task setup, "Checkout and generate":
  #nimgenTask()
  exec cmd & "nimgen nimfastText.cfg"

before install:
  setupTask()

task test, "Run tests":
  withDir("tests"):
    exec "nim cpp -r testfast"
