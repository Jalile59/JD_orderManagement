# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'orders/page/:project_id/:page',                    to: 'orders#index',                     as: 'ordersP'
get 'devices/page/:page',                               to: 'devices#index',                    as: 'devicesP'
get 'addresses/page/:page',                             to: 'addresses#index',                  as: 'addressesP'
get 'orders/admin',                                     to: 'orders#indexAdmin',                as: 'ordersAdmin'
get 'addform/:project_id',                              to: 'orders#addform',                   as: 'formView'
post 'postform',                                        to: 'orders#postForm',                  as: 'putform'
get 'addformViewAdmin/',                                to: 'orders#addformView',               as: 'putformViewAdmin'
get 'addformView/:project_id',                          to: 'orders#addformView',               as: 'putformView'
get 'ajax/defxmlrequeteSlectform/:id',                  to: 'orders#defxmlrequeteSlectform',    as: 'defxmlrequeteSlectforms'
get 'orders/fixtures',                                  to: 'orders#fixtures',                  as: 'fixtures'
get 'orders/editAddviewForm/:id/:project_id',           to: 'orders#editAddviewForm',           as:'editAddviewForm'
get 'orders/editAddviewForm/deleded/deviceOrders/:id',  to: 'orders#delAjaxrequet',             as:'deletedDeviceOrder'
resources :devices
resources :addresses
resources :orders