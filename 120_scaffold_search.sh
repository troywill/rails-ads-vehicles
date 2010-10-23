#!/bin/bash
source ./rrp-lib.sh
MODEL="search"

function generate_scaffold () {
    rails generate scaffold ${MODEL} \
	user_id:string \
	name:string \
	url:string \
	last_search:date
}

function edit_model () {
    MODEL_RB="${TOP_DIR}/app/models/${MODEL}.rb"
    cat >> ${MODEL_RB} <<EOF
  validates :user_id, :presence => true, :numericality => true
  validates :name, :presence => true
  validates_uniqueness_of :name, :scope => :user_id # different users can have same search name
EOF

    $EDITOR ${MODEL_RB}

    echo "Don't forget to edit foreign key model, if applicable"
    
}

function do_migration () {
    rake db:migrate
}

###### Main program #######

generate_scaffold
edit_model
do_migration
