#!/bin/bash
source ./rrp-lib.sh
MODEL='user'
SCAFFOLD_COMMAND="rails generate scaffold"

function generate_scaffold () {
    ${SCAFFOLD_COMMAND} ${MODEL} \
	name:string \
	username:string \
	password:string \
	email:string \
	homepage:string \
	twitter:string \
	facebook:string \
	share_models:boolean \
	share_contact:boolean \
	zip_code:integer
}

function edit_model () {
    cat >> ${TOP_DIR}/app/models/${MODEL}.rb <<EOF
  validates :name, :presence => true
  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true
EOF
    $EDITOR ${TOP_DIR}/app/models/${MODEL}.rb
}

generate_scaffold
edit_model
read -p "Run rake db:migrate? " && rake db:migrate
