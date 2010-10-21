#!/bin/bash
# <troydwill@gmail.com> October 17, 2010
source ./rrp-lib.sh

MODEL='ad'

function generate_scaffold () {
    # foreign keys 
    rails generate scaffold ${MODEL} \
	year:integer \
	model_id:integer \
	mileage:integer \
	isforsale:boolean \
	isdealer:boolean \
	color_id:integer \
	city_id:integer \
	ad_url:string \
	ad_date:date \
	ad_price:integer \
	contact_name:string \
	contact_phone:string \
	contact_email:string \
	contact_log:text \
	notes:text
}

function edit_model () {
    MODEL_RB="${TOP_DIR}/app/models/${MODEL}.rb"
    cat >> ${MODEL_RB} <<EOF
  validates_presence_of :year
  validates_numericality_of :year
  belongs_to :model
  belongs_to :city
  belongs_to :color
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
