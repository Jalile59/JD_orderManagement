class SearchsController < ApplicationController

  def index
    #@device = Order.joins(:deviceBytracks).all
   # @device = DeviceBytrack.joins("inner join orders ON device_bytracks.order_id = orders.id")
     params[:q] = 'paris'
    @device = DeviceBytrack.joins(:order).where("orders.destination LIKE ?", "%" + params[:q] + "%")

    
  end

  def search
    @device = "test"
    abort(@device)

  end


end
