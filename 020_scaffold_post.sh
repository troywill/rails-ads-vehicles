source ./rrp-lib.sh
NAME='post'

function do_generate () {
    rails generate scaffold ${NAME} year:integer model_id:integer city_id:integer kbb_id:integer ad_url:string date:date ad_price:integer phone:string contact_name:string mileage:integer photo_url:string forsale:boolean notes:text
}

function edit_model () {
    MODEL="${TOP_DIR}/app/models/${NAME}.rb"
    cat >> ${MODEL} <<EOF
  validates_presence_of :year
  validates_numericality_of :year
  belongs_to :model
  belongs_to :city
  belongs_to :kbb
EOF

    ${EDITOR} ${MODEL}
    
    echo "Don't forget to edit foreign key model, if applicable"
    
}

function do_migration () {
    echo "Run db:migrate?"
    rake db:migrate
}

###### Main program #######
do_generate
edit_model
do_migration
echo "Don't forget to edit foreign key model, if applicable"
