#!/bin/bash
source ./rrp-lib.sh
MODEL='model'

function do_generate () {
    rails generate scaffold ${MODEL} \
	make_id:integer \
	name:string \
	url:string \
	wikipedia:string
}

function edit_model () {
    MODEL_RB="${TOP_DIR}/app/models/${MODEL}.rb"
    cat >> ${MODEL_RB} <<EOF
  validates_presence_of :name
  belongs_to :make
EOF

    $EDITOR ${MODEL_RB}

    echo "Don't forget to edit foreign key model, if applicable" && sleep 1
    
}

function do_migration () {
    echo "Run db:migrate?"
    rake db:migrate
}

###### Main program #######

do_generate
edit_model
do_migration
