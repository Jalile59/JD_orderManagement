class Order < ActiveRecord::Base
  
  belongs_to :StatusOrder, foreign_key: true
  has_many :deviceBytracks  
  has_one_attached :file

end
