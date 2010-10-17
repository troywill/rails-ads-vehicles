#!/bin/bash
source ./rrp-lib.sh
MODEL='make'

function generate_scaffold () {
    rails generate scaffold ${MODEL} name:string url:string
}

function edit_model () {
    MODEL_RB="${TOP_DIR}/app/models/${MODEL}.rb"
    cat >> ${MODEL_RB} <<EOF
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :models
EOF

    $EDITOR ${MODEL_RB}
}

function do_migration () {
    rake db:migrate
}

###### Main program #######

generate_scaffold
edit_model
do_migration
