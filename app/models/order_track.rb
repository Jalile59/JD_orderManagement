class OrderTrack < ActiveRecord::Base
  belongs_to :addresse, foreign_key: true
end
