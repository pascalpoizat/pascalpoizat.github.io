#!/usr/bin/env bash
# from https://github.com/rudametw/rudametw.github.io
bundle exec jekyll build --config _config.yml
'cp' -aRf _site/* ../ && git add ../ && git commit -m "Update site" && git push
