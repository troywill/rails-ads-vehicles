username = 'troy'
password = 'troy'
email = 'troydwill@gmail.com'
homepage = 'http://troywill.com'
twitter = 'http://twitter.com/troydwill'
facebook = 'http://facebook.com/troydwill'
share_models = 'true'
share_contact = 'true'
zip_code = 91711


User.create( :name => 'Troy Will', 
             :username => username,
             :password => password,
             :email => email,
             :homepage => homepage,
             :twitter => twitter,
             :facebook => facebook,
             :share_models => 'true'
             :share_contact => 'true'
             :zip_code => 91711
)

user = User.find_by_username(username)
user_id = user.id

# Suzuki
Make.create( :user_id => user_id, :name => 'Suzuki' )
Make.create( :user_id => user_id, :name => 'Honda' )
Make.create( :user_id => user_id, :name => 'Yamaha' )
Make.create( :user_id => user_id, :name => 'Chevrolet' )
Make.create( :user_id => user_id, :name => 'Chrysler' )

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

# See http://www.buyingadvice.com/auto-buying-tips/popular-car-colors/

Color.create([{ :name => 'Silver' }, { :name => 'White' }, { :name => 'Gray' }, { :name => 'Blue' }, { :name => 'Black' }, { :name => 'Red' }])

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
