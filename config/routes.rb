# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'orders',                           to: 'orders#index',     as: 'orders'
get 'orders/admin',                      to: 'orders#indexAdmin',     as: 'ordersAdmin'
get 'addform/:project_id',                 to: 'orders#addform',   as: 'formView'
post 'postform/:project_id',               to: 'orders#postForm',  as: 'putform'
get 'addformView/:project_id',             to:'orders#addformView', as: 'putformView'
get 'orders/defxmlrequeteSlectform/:id', to: 'orders#defxmlrequeteSlectform', as: 'defxmlrequeteSlectforms'
get 'orders/fixtures',                   to:'orders#fixtures',    as: 'fixtures'
get 'orders/editAddviewForm/:id/:project_id',             to: 'orders#editAddviewForm', as:'editAddviewForm'
get 'orders/editAddviewForm/deleded/deviceOrders/:id', to: 'orders#delAjaxrequet', as:'deletedDeviceOrder'