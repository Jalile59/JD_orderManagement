# JD_orderManagement
plugin Redmine

# Requrirement

# API (create Issues if tracker is too old):

gem httparty:

 -> command: gem install httparty
 -> Edit Gemfile (of redmine), add new line => " gem 'httparty', '~> 0.18.0' "
 -> send command: bundle install
 


############# env ################## 
 Gem dotev:
 -> command: gem install dotenv
 -> gem 'dotenv-rails', groups: [:development, :test]
 -> Edit Gemfile (of redmine), add new line => " gem 'dotenv-rails', groups: [:development, :test] "
 -> send command: bundle install

-> create file << .env >>, add ligne << host=ex192.168.1.26>>>
####################################
 
 
 - Active API_REST in Redmine parametre:
	-> enable the API-style authentication, you have to check Enable REST API in Administration -> Settings -> API 
	
####################################

migration:

-> command: RAILS_ENV=production rake redmine:plugins:migrate
-> command: RAILS_ENV=development rake redmine:plugins:migrate	

#####################################

add data csv:

mysql command:

LOAD DATA LOCAL INFILE '/home/redmine/plugins/modules.csv'
INTO TABLE devices
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '/n'
IGNORE 1 ROWS;
