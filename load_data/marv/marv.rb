name = 'Marv'
username = 'marv'
password = 'marv'
email = 'marvmgmusa@yahoo.com'
homepage = 'http://troywill.com'
twitter = 'http://twitter.com/troydwill'
facebook = 'http://facebook.com/troydwill'
share_models = 'true'
share_contact = 'true'
zip_code = 91711

User.create( :name => name, 
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
Make.create( :user_id => user_id, :name => 'Chrysler' )
Make.create( :user_id => user_id, :name => 'Chevrolet' )

# Create some vehicle models Suzuki Burgman
Model.create( :user_id => user_id, :make_id => Make.find_by_name('Chrysler').id, :name => 'Sebring Convertible' )
Model.create( :user_id => user_id, :make_id => Make.find_by_name('Chevrolet').id, :name => 'Corvette' )

# Create some vehicle searches

Search.create( :user_id => user.id,
               :name => "Sebring Convertible, Craig's List Los Angeles",
               :url => 'http://losangeles.craigslist.org/search/sss?query=sebring+conv|convertible&srchType=T&minAsk=&maxAsk='
               )
Search.create( :user_id => user.id,
               :name => "Corvette convertible, Craig's List Los Angeles",
               :url => 'http://losangeles.craigslist.org/search/sss?query=corvette+convertible&srchType=T&minAsk=&maxAsk='
               )
Search.create( :user_id => user.id,
               :name => "Corvette, Autotrader.com, Any Distance, 1981-2011, Price: Low to High",
               :url => 'http://www.autotrader.com/fyc/searchresults.jsp?doors=&systime=&position=top&model=CORV&search_lang=en&style_flag=1&start_year=1981&keywordsrep=&search_type=used&scarid=287897689&highlightFirstMakeModel=&lastStartYear=1981&distance=0&min_price=&rdm=1287426320475&drive=&marketZipError=false&advanced=&fuel=&keywords_display=&end_year=2011&showZipError=y&make2=&certified=&engine=&page_location=findacar::ispsearchform&body_code=0&transmission=&default_sort=newsortbyprice_DESC&max_mileage=&address=91711&color=&max_price=&awsp=false&make=CHEV&seller_type=b&num_records=100&keywordsfyc=&sort_type=priceASC'
               )
