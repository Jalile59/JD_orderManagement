class Device < ActiveRecord::Base
    belongs_to :order, dependent: :destroy
    has_many :deviceBytracks
   # validates :description, presence: true
end
