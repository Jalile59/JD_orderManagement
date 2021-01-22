# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'orders',   to: 'orders#index',     as: 'orders'
get 'addform/:projects',  to: 'orders#addform',   as: 'formView' 
post 'postform/:projects', to: 'orders#postForm',  as: 'putform'