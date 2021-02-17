class Order < ActiveRecord::Base
  belongs_to :statusOrder, foreign_key: true
  has_many :deviceBytracks


end
