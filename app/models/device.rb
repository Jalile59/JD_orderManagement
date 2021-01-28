class Device < ActiveRecord::Base
    belongs_to :orderTrack, dependent: :destroy
    has_many :deviceBytracks
   # validates :description, presence: true
end
