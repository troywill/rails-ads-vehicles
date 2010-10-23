username = 'marv'
user = User.find_by_username(username)

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

Search.create( :user_id => user.id,
               :name => "Chevrolet SSR, Craig's List Los Angeles",
               :url => 'http://losangeles.craigslist.org/search/cta?query=ssr&srchType=T&minAsk=&maxAsk='
               )

Search.create( :user_id => user.id,
               :name => "Chevrolet SSR, Craig's List Inland Empire",
               :url => 'http://inlandempire.craigslist.org/search/cta?query=ssr&srchType=T&minAsk=&maxAsk='
               )

Search.create( :user_id => user.id,
               :name => "Corvette Convertible, Craig's List Inland Empire (Title only)",
               :url => 'http://inlandempire.craigslist.org/search/cta?query=corvette+convertible&srchType=T&minAsk=&maxAsk='
               )
