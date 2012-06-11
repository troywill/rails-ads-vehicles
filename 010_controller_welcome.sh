#!/bin/bash
set -o errext
set -o nounset

source ./rrp-lib.sh
# rails generate controller welcome index login logout # If adding authentication
rails generate controller welcome index
${EDITOR} ${TOP_DIR}/config/routes.rb
mv -iv ${TOP_DIR}/public/index.html /tmp/
