#!/bin/bash
source ./rrp-lib.sh

MODEL='city'

function generate_scaffold () {
    rails generate scaffold ${MODEL} \
	name:string \
	lat:float \
	long:float \
	travel_time:integer \
	google_link:string \
	google_embed:string
}

function edit_model () {
    MODEL_RB="${TOP_DIR}/app/models/${MODEL}.rb"
    cat >> ${MODEL_RB} <<EOF
  validates :user_id, :presence => true, :numericality => true
  validates :name, :presence => true
  has_many :posts
EOF

    $EDITOR ${MODEL_RB}
    echo "Don't forget to edit foreign key model, if applicable"
    
}

###### Main program #######
generate_scaffold
edit_model
read -p "Run db:migrate? " && rake db:migrate
