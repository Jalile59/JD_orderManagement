class SearchsController < ApplicationController

  def index
    #@device = Order.joins(:deviceBytracks).all
   # @device = DeviceBytrack.joins("inner join orders ON device_bytracks.order_id = orders.id")
   
   if params.include?(:designation) or params.include?(:order)  or params.include?(:serial)
    #abort(params)

    @device = DeviceBytrack.joins(:order, :device).where("orders.destination LIKE ? AND orders.source LIKE ?  AND orders.project LIKE ? AND devices.name LIKE ?  AND serial LIKE ?" , 
      "%" + params[:order][:destination] + "%",
      "%" + params[:order][:source] + "%",
      "%" + params[:order][:project] + "%",
      "%" + params[:designation] + "%",
      "%" + params[:serial] + "%"
    )
   else 
    @device = DeviceBytrack.joins(:order)
   end
    
  end

  def search
    @device = "test"
    abort(@device)

  end


end

