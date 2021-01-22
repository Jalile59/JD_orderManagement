class Device < ActiveRecord::Base
    belongs_to :orderTrack, dependent: :destroy

    validates :description, presence: true
end
