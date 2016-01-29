#!/usr/bin/env bash
# from https://github.com/rudametw/rudametw.github.io
'cp' -uvarf _site/* ../ && git add ../ && git commit -m "Update site" && git push
