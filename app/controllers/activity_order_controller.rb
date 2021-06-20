class ActivityOrderController < ApplicationController

  def index
  end


  def new
    @project_id = params[:project_id]
    @project = Project.find(params[:project_id])
    @order = Order.find(params[:id])
    @devices = DeviceBytrack.where(order_id: @order.id)
  end

  def update
  end

  def destroy
  end
end
