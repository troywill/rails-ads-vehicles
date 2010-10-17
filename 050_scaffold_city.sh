#!/bin/bash
source ./rrp-lib.sh
MODEL='city'

function generate_scaffold () {
    rails generate scaffold ${MODEL} name:string lat:float long:float travel_time:integer google:string
    rake db:migrate
}

function edit_model () {
    MODEL_RB="${TOP_DIR}/app/models/${MODEL}.rb"
    cat >> ${MODEL_RB} <<EOF
  validates_presence_of :name
  has_many :posts
EOF

    $EDITOR ${MODEL_RB}

    echo "Don't forget to edit foreign key model, if applicable" && sleep 1
    
}

function do_migration () {
    echo "Run db:migrate?"
    rake db:migrate
}

###### Main program #######

generate_scaffold
edit_model
do_migration
