source ./rrp-lib.sh
NAME='EDIT_ME'

function do_generate () {
    rails generate scaffold ${NAME} name:string username:string password:string email:string
    rake db:migrate
}

function edit_model () {
    MODEL="${TOP_DIR}/app/models/${NAME}.rb"
    cat >> ${MODEL} <<EOF

# validates_presence_of :name
# validates_presence_of :username
# validates_uniqueness_of :username
# validates_presence_of :password
EOF

    $EDITOR ${MODEL}

    echo "Don't forget to edit foreign key model, if applicable" && sleep 1
    
}

function do_migration () {
    echo "Run db:migrate?"
    rake db:migrate
}

###### Main program #######

do_generate
edit_model
do_migration
