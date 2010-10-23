username = 'marv'
user = User.find_by_username(username)

# Available makes: 
# Chrysler
# Chevrolet

# Create some vehicle models Suzuki Burgman
Model.create( :user_id => user.id, :make_id => Make.find_by_name('Chrysler').id, :name => 'Sebring Convertible' )
Model.create( :user_id => user.id, :make_id => Make.find_by_name('Chevrolet').id, :name => 'Corvette' )
Model.create( :user_id => user.id, :make_id => Make.find_by_name('Chevrolet').id, :name => 'SSR' )
