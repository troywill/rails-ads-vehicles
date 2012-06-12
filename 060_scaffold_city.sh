#!/bin/bash
source ./rrp-lib.sh

MODEL='city'

# travel_time:integer \
# google_link:string \
# google_embed:string

function generate_scaffold () {
    rails generate scaffold ${MODEL} \
	name:string \
	lat:float \
	long:float
}

function edit_model () {
    MODEL_RB="${TOP_DIR}/app/models/${MODEL}.rb"
    cat >> ${MODEL_RB} <<EOF
  validates_presence_of :name
  has_many :posts
EOF

    $EDITOR ${MODEL_RB}
    echo "Don't forget to edit foreign key model, if applicable"
    
}

function do_migration () {
    echo "Run db:migrate?"
    rake db:migrate
}

###### Main program #######

generate_scaffold
edit_model
do_migration
