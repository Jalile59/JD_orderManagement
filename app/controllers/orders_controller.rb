class OrdersController < ApplicationController

  def index
    @project = Project.find(params[:project_id])

    @listeOrder = OrderTrack.all()
    puts @listeOrder
  end

  def addform
    @trakingOrder = OrderTrack.new
    puts @trakingOrder
  end

  def postForm
    puts params
  end
end
