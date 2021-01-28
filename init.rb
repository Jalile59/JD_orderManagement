Redmine::Plugin.register :jd_order_management do
  name 'JD Traking Order Management plugin'
  author 'DJELLOULI JALILE'
  description 'this plugin is used for tracking of order '
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  permission :OrderTrack, { orders: [:index] }, public: true
  menu :project_menu , :OrderTrack, { controller: 'orders', action: 'index' }, caption: 'Suivi piéces/SAV', after: :activity, param: :project_id

end
