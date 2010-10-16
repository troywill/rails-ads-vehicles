source ./rrp-lib.sh
NAME='user'

function up () {
    ${SCRIPT_DIR}/generate scaffold ${NAME} name:string username:string password:string email:string
    rake db:migrate
}

function down () {
    echo
}

function edit_model () {
    cat >> ${TOP_DIR}/app/models/${NAME}.rb <<EOF

validates_presence_of :name
validates_presence_of :username
validates_uniqueness_of :username
validates_presence_of :password
EOF
    $EDITOR ${TOP_DIR}/app/models/${NAME}.rb
}

up
edit_model
