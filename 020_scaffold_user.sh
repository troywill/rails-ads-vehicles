#!/bin/bash
source ./rrp-lib.sh
MODEL='user'

function generate_scaffold () {
    rails generate scaffold ${MODEL} \
	role_id:integer \
	name:string \
	username:string \
	password:string \
	email:string \
	zip_code:integer
}

function edit_model () {
    cat >> ${TOP_DIR}/app/models/${MODEL}.rb <<EOF
  validates :name, :presence => true
  validates :role_id, :presence => true
  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true
EOF
    $EDITOR ${TOP_DIR}/app/models/${MODEL}.rb
}

generate_scaffold
edit_model
# read -p "Run rake db:migrate? " && rake db:migrate

