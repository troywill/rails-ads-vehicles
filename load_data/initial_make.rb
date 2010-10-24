# rails console < 'path/to/this/file.rb'

username = 'troy'
# password = 'troy'

# User.create( :name => 'Troy Will', 
#              :username => username,
#              :password => password,
#              :email => 'troydwill@gmail.com',
#              :homepage => 'http://troywill.com',
#              :twitter => 'http://twitter.com/troydwill',
#              :facebook => 'http://facebook.com/troydwill',
#              :share_models => 'true',
#              :share_contact => 'true',
#              :zip_code => 91711
# )

user = User.find_by_username(username)
puts user.id
user_id = user.id
puts user.id
# Suzuki
Make.create( :user_id => user_id, :name => 'Suzuki' )

# Suzuki Burgman
Model.create(
              :user_id => user_id,
              :make_id => Make.find_by_name('Suzuki').id,
              :name => 'Burgman 650'
              )
