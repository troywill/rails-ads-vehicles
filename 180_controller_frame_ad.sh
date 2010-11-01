#!/bin/bash
# <troydwill@gmail.com> October 21, 2010
source ./rrp-lib.sh
rails generate controller frame_ad index show edit
ROUTES_FILE="${TOP_DIR}/config/routes.rb"
${EDITOR} ${ROUTES_FILE}
