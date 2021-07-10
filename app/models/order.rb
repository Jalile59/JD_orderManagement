class Order < ActiveRecord::Base
  
  belongs_to :StatusOrder, foreign_key: true
  has_many :deviceBytracks
  has_many :activityOrders

  validates :description, presence: { message: "Description is missing." }
  validates :statusOrders_id, presence: { message: "Please select status." }
  validates :dateSending, presence: { message: "Date sending is missing." }


end
