class Addresse < ActiveRecord::Base
    belongs_to :orderTrack, dependent: :destroy

end
