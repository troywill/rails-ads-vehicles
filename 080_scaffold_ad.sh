#!/bin/bash
# <troydwill@gmail.com> October 17, 2010
source ./rrp-lib.sh

MODEL='ad'

function generate_scaffold () {
    # foreign keys 
    rails generate scaffold ${MODEL} \
	user_id:integer \
	model_id:integer \
	color_id:integer \
	city_id:integer \
	year:integer \
	mileage:integer \
	forsale:boolean \
	dealer:boolean \
	url:string \
	ad_date:date \
	ad_price:integer \
	contact_name:string \
	contact_phone:string \
	notes:text
}

function edit_model () {
    MODEL_RB="${TOP_DIR}/app/models/${MODEL}.rb"
    cat >> ${MODEL_RB} <<EOF
  validates :year, :presence => true, :numericality => true
  validates :user_id, :presence => true, :numericality => true
  validates :model_id, :presence => true, :numericality => true
  belongs_to :user
  belongs_to :model
  belongs_to :city
  belongs_to :color
EOF

    ${EDITOR} ${MODEL_RB}
}

###### Main program #######
generate_scaffold
edit_model
# read -p "Run rake db:migrate? " && rake db:migrate
echo "Don't forget to edit foreign key model, if applicable"
