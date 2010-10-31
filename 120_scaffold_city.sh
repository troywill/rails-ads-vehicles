#!/bin/bash
source ./rrp-lib.sh

MODEL='city'

function generate_scaffold () {
    rails generate scaffold ${MODEL} \
	name:string \
	zip_code:integer \
	lat:float \
	long:float \
	distance:integer \
	google_link:string \
	google_embed:string
}

function edit_model () {
    MODEL_RB="${TOP_DIR}/app/models/${MODEL}.rb"
    cat >> ${MODEL_RB} <<EOF
  validates :name, :presence => true, :uniqueness => true
  has_many :ads
EOF

    $EDITOR ${MODEL_RB}
    echo "Don't forget to edit foreign key model, if applicable"
    
}

###### Main program #######
generate_scaffold
edit_model
read -p "Run db:migrate? " && rake db:migrate
