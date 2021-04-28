# JD_orderManagement
plugin Redmine

# Requrirement

# API (create Issues if tracker is too old):

gem httparty:

 -> command: gem install httparty
 -> Edit Gemfile (of redmine), add new line => " gem 'httparty', '~> 0.18.0' "
 -> send command: bundle install
 
 
 - Active API_REST in Redmine parametre:
	-> enable the API-style authentication, you have to check Enable REST API in Administration -> Settings -> API 
	
	