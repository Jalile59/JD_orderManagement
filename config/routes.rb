# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'orders/page/:project_id(/:page)',                  to: 'orders#index',                     as: 'ordersP'
get 'orders/upload/:namefile',                          to: 'orders#download_pdf',              as: 'downloadPdf'
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
get 'search/orders',                                    to: 'searchs#index',                    as: 'searchOrders'
post 'search/orders',                                   to: 'searchs#index',                    as: 'searchOrders_post'
get 'orders/api/checkOldOrder',                         to: 'api_order#checkifDayIsExpired',    as: 'apipostissues'
get 'parameter',                                        to: 'parameters#index',                 as: 'paramEdit'
post 'parameter/update',                                to: 'parameters#update',                as: 'paramUpdate'

resources :devices
resources :device_bytrack
resources :addresses
resources :orders, path: '/projects/:project_id/order'
resources :activity_order, path: '/projects/:project_id/order/:id/activity'