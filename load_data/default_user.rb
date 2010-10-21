# rails console < 'path/to/this/file.rb'

username = 'troy'
password = 'troy'

User.create( :name => 'Troy Will', 
             :username => username,
             :password => password,
             :email => 'troydwill@gmail.com',
             :homepage => 'http://troywill.com',
             :twitter => 'http://twitter.com/troydwill',
             :facebook => 'http://facebook.com/troydwill',
             :share_models => 'true',
             :share_contact => 'true',
             :zip_code => 91711
)

user = User.find_by_username(username)
user_id = user.id

# Suzuki
Make.create( :user_id => user_id, :name => 'Suzuki' )

# Suzuki Burgman
Model.create( :user_id => user_id, :make_id => Make.find_by_name('Suzuki').id, :name => 'Burgman 650' )

# Intial Search

#   create_table "searches", :force => true do |t|
#     t.string   "user_id"
#     t.string   "name"
#     t.string   "url"
#     t.date     "last_search"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

Search.create( :user_id => user.id,
               :name => "Burgman 650, Craig's List Orange County",
               :url => 'http://orangecounty.craigslist.org/search/sss?query=Burgman&srchType=T&minAsk=&maxAsk='
               )

# ActiveRecord::Schema.define(:version => 20101021213345) do

#   create_table "ads", :force => true do |t|
#     t.integer  "user_id"
#     t.integer  "year"
#     t.integer  "model_id"
#     t.integer  "mileage"
#     t.boolean  "isforsale"
#     t.boolean  "isdealer"
#     t.integer  "color_id"
#     t.integer  "city_id"
#     t.string   "ad_url"
#     t.date     "ad_date"
#     t.integer  "ad_price"
#     t.string   "contact_name"
#     t.string   "contact_phone"
#     t.string   "contact_email"
#     t.text     "contact_log"
#     t.text     "notes"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

#   create_table "cities", :force => true do |t|
#     t.string   "name"
#     t.float    "lat"
#     t.float    "long"
#     t.integer  "travel_time"
#     t.string   "google_link"
#     t.string   "google_embed"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

#   create_table "colors", :force => true do |t|
#     t.string   "name"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

#   create_table "links", :force => true do |t|
#     t.integer  "user_id"
#     t.string   "name"
#     t.string   "description"
#     t.string   "url"
#     t.string   "wikipedia"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

#   create_table "makes", :force => true do |t|
#     t.integer  "user_id"
#     t.string   "name"
#     t.string   "url"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

#   create_table "models", :force => true do |t|
#     t.integer  "user_id"
#     t.integer  "make_id"
#     t.string   "name"
#     t.string   "image_url"
#     t.string   "wikipedia"
#     t.string   "url"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

#   create_table "searches", :force => true do |t|
#     t.string   "user_id"
#     t.string   "name"
#     t.string   "url"
#     t.date     "last_search"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

#   create_table "settings", :force => true do |t|
#     t.string   "name"
#     t.string   "email"
#     t.string   "phone"
#     t.string   "address"
#     t.float    "lat"
#     t.float    "long"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

#   create_table "users", :force => true do |t|
#     t.string   "name"
#     t.string   "username"
#     t.string   "password"
#     t.string   "email"
#     t.string   "homepage"
#     t.string   "twitter"
#     t.string   "facebook"
#     t.boolean  "share_models"
#     t.boolean  "share_contact"
#     t.integer  "zip_code"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

# end
