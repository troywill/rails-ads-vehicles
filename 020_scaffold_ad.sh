#!/bin/bash
set -o errexit
set -o nounset

# <troydwill@gmail.com> May 7, 2011
source ./rrp-lib.sh

MODEL='ad'

function generate_scaffold_ad () {
    rails generate scaffold ${MODEL} \
	model_id:integer \
	color_id:integer \
	city_id:integer \
	year:integer \
	mileage:integer \
	ad_url:string \
	ad_date:date \
	ad_price:integer \
	contact_name:string \
	contact_phone:string \
	contact_email:string \
	notes:text
}

# isforsale:boolean
# isdealer:boolean
# contact_log:text

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
generate_scaffold_ad
edit_model
do_migration
echo "Don't forget to edit foreign key model, if applicable"
