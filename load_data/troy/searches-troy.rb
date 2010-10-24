username = 'troy'
user = User.find_by_username(username)

# Create some vehicle searches
Search.create( :user_id => user.id,
               :name => "Burgman, Craig's List Orange County",
               :url => 'http://orangecounty.craigslist.org/search/sss?query=Burgman&srchType=T&minAsk=&maxAsk='
               )

Search.create( :user_id => user.id,
               :name => "Burgman, Craig's List Inland Empire",
               :url => 'http://inlandempire.craigslist.org/search/?areaID=104&subAreaID=&query=Burgman&catAbb=sss',
               )

Search.create( :user_id => user.id,
               :name => "Burgman, Craig's List Los Angeles",
               :url => 'http://losangeles.craigslist.org/search/mcy?query=Burgman&srchType=A&minAsk=&maxAsk='
               )

Search.create( :user_id => user.id,
               :name => "Burgman, Craig's List Ventura",
               :url => "http://ventura.craigslist.org/search/mcy?query=burgman&srchType=A&minAsk=&maxAsk="
               )

Search.create( :user_id => user.id,
               :name => "Toyota Tacoma, Craig's List Inland Empire",
               :url => 'http://inlandempire.craigslist.org/search/sss?query=toyota+tacoma&srchType=T&minAsk=4000&maxAsk=8000'
               )
