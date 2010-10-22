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
             :share_models => 'true',
             :share_contact => 'true',
             :zip_code => 91711
)

user = User.find_by_username(username)
user_id = user.id

# Create some vehicle makes
Make.create( :user_id => user_id, :name => 'Suzuki' )
Make.create( :user_id => user_id, :name => 'Honda' )
Make.create( :user_id => user_id, :name => 'Yamaha' )
Make.create( :user_id => user_id, :name => 'Chevrolet' )
Make.create( :user_id => user_id, :name => 'Chrysler' )

# Create some vehicle models Suzuki Burgman
Model.create( :user_id => user_id, :make_id => Make.find_by_name('Suzuki').id, :name => 'Burgman 650' )

# Create some vehicle searches

Search.create( :user_id => user.id,
               :name => "Burgman 650, Craig's List Orange County",
               :url => 'http://orangecounty.craigslist.org/search/sss?query=Burgman&srchType=T&minAsk=&maxAsk='
               )

