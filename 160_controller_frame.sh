#!/bin/bash
# <troydwill@gmail.com> October 21, 2010
source ./rrp-lib.sh
rails generate controller frames index
ROUTES_FILE="${TOP_DIR}/config/routes.rb"
echo 'get "frames/index"' >> ${ROUTES_FILE}
${EDITOR} ${ROUTES_FILE}
