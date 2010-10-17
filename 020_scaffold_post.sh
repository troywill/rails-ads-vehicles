#!/bin/bash
# <troydwill@gmail.com> October 17, 2010
source ./rrp-lib.sh

MODEL='post'

function generate_scaffold () {
    rails generate scaffold ${MODEL} \
	year:integer \
	model_id:integer \
	mileage:integer \
	isforsale:boolean \
	city_id:integer \
	ad_url:string \
	ad_date:date \
	ad_price:integer \
	phone:string \
	contact_name:string \
	notes:text
}

function edit_model () {
    MODEL_RB="${TOP_DIR}/app/models/${MODEL}.rb"
    cat >> ${MODEL_RB} <<EOF
  validates_presence_of :year
  validates_numericality_of :year
  belongs_to :model
  belongs_to :city
EOF

    ${EDITOR} ${MODEL_RB}
    
    echo "Don't forget to edit foreign key model, if applicable"
    
}

function do_migration () {
    rake db:migrate
}

###### Main program #######
generate_scaffold
edit_model
do_migration
echo "Don't forget to edit foreign key model, if applicable"
