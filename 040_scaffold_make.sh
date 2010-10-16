source ./rrp-lib.sh
NAME='make'

function do_generate () {
    rails generate scaffold ${NAME} name:string url:string
    rake db:migrate
}

function edit_model () {
    MODEL="${TOP_DIR}/app/models/${NAME}.rb"
    cat >> ${MODEL} <<EOF
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :models
EOF

    $EDITOR ${MODEL}
}

function do_migration () {
    echo "Run db:migrate?"
    rake db:migrate
}

###### Main program #######

do_generate
edit_model
do_migration
