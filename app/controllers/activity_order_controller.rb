class ActivityOrderController < ApplicationController

  def index
  end


  def new
    @project_id = params[:project_id]
    @project = Project.find(params[:project_id])
    @order = Order.find(params[:id])
    @devices = DeviceBytrack.where(order_id: @order.id)


  end

  def create
    @orderUpdated = params[:order]
    @orderOrigine = Order.find(params[:id])
    @change = "<ul>"
    #abort(@orderUpdated['statusOrders_id'])
    if @orderUpdated['statusOrders_id'] != @orderOrigine.statusOrders_id
      @statusChange = "<li>le status a été modifié de <<" + StatusOrder.find(@orderOrigine.statusOrders_id).name + ">> à <<" + StatusOrder.find(@orderUpdated['statusOrders_id'] ).name + ">>. <li>"
      @change += @statusChange
    end

    if @orderUpdated['source'] != @orderOrigine.source
      @sourceChange = "<li> l'adresse source a été modifié de " + @orderOrigine.source + " à " + @orderUpdated['source']  + ". <li>"
      @change += @sourceChange
    end

    if @orderUpdated['destination'] != @orderOrigine.destination
      @sourceChange = "<li> l'adresse destination a été modifié de " + @orderOrigine.destination + " à " + @orderUpdated['destination'] + ". <li>"
      @change += @sourceChange
    end

    @activityOrder = ActivityOrder.new(changeDescription: @change, dateCreated: Time.now)
    @activityOrder.save

    puts @activityOrder.inspect


  end

  def update
  end

  def destroy
  end
end
