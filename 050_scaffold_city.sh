source ./rrp-lib.sh
NAME='city'

function do_generate () {
    rails generate scaffold ${NAME} name:string lat:float long:float travel_time:integer google:string
    rake db:migrate
}

function edit_model () {
    MODEL="${TOP_DIR}/app/models/${NAME}.rb"
    cat >> ${MODEL} <<EOF
  validates_presence_of :name
  has_many :posts
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
