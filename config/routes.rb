# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'orders',   to: 'orders#index',     as: 'orders'
get 'addform',  to: 'orders#addform',   as: 'formView' 
post 'postform', to: 'orders#postForm',  as: 'putform'