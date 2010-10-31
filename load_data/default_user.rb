# rails console < 'path/to/this/file.rb'

username = 'troy'
password = 'troy'

User.create( :name => 'Troy Will', 
             :username => username,
             :password => password,
             :email => 'troydwill@gmail.com',
             :zip_code => 91711
)

user = User.find_by_username(username)
