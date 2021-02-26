class DeviceBytrack < ActiveRecord::Base
    belongs_to :order
    belongs_to :device
end
