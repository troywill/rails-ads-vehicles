#!/bin/bash
set -o errexit
set -o nounset
set -o verbose

source ./rrp-lib.sh
# rails generate controller welcome index login logout # If adding authentication
rails generate controller welcome index
${EDITOR} ${TOP_DIR}/config/routes.rb
mv -iv ${TOP_DIR}/public/index.html /tmp/
