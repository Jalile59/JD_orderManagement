# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'orders/',                           to: 'orders#index',     as: 'orders'
get 'addform/:projects',                 to: 'orders#addform',   as: 'formView'
post 'postform/:projects',               to: 'orders#postForm',  as: 'putform'
get 'addformView/:projects',             to:'orders#addformView', as: 'putformView'
get 'orders/defxmlrequeteSlectform/:id', to: 'orders#defxmlrequeteSlectform', as: 'defxmlrequeteSlectforms'
get 'orders/fixtures',                   to:'orders#fixtures',    as: 'fixtures'
get 'orders/editAddviewForm/:id/:project',             to: 'orders#editAddviewForm', as:'editAddviewForm'
get 'orders/editAddviewForm/deleded/deviceOrders/:id', to: 'orders#delAjaxrequet', as:'deletedDeviceOrder'