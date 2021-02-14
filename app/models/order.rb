class Order < ActiveRecord::Base
  belongs_to :addresse, foreign_key: true
  belongs_to :StatusOrder, foreign_key: true
  has_many :deviceBytracks


end
