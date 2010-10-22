#!/bin/bash
source ./rrp-lib.sh
MODEL="color"

function generate_scaffold () {
    rails generate scaffold ${MODEL} \
	user_id:integer \
	name:string
}

function edit_model () {
    MODEL_RB="${TOP_DIR}/app/models/${MODEL}.rb"
    cat >> ${MODEL_RB} <<EOF
validates :user_id, :presence => true, :numericality => true
validates :name, :presence => true, :uniqueness => true
EOF

    $EDITOR ${MODEL_RB}
    echo "Don't forget to edit foreign key model, if applicable"
}

###### Main program #######

generate_scaffold
edit_model
read -p "Run rake db:migrate? " && rake db:migrate
