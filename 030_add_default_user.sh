#!/bin/bash
source ./rrp-lib.sh
FILE="load_data/default_user.rb"
${EDITOR} load_data/default_user.rb
rails console < ${FILE}
