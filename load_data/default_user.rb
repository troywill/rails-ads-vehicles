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
