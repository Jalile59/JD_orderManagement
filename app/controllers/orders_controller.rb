class OrdersController < ApplicationController

  def index
    @project = Project.find(params[:project_id])

    @listeOrder = OrderTrack.all()
    puts @listeOrder
  end

  def addform
    @projects = params[:projects]
    @trakingOrder = OrderTrack.new
  end

  def addformView
    @projects = params[:projects]
    @trakingOrder = OrderTrack.new
  end

  def postForm

    @projects = params[:projects]

    t = Time.now
    
    order = OrderTrack.new(
      dateCreated: t.in_time_zone('Europe/Paris'), 
      serialNum: params[:projects], 
      description:params[:description],
      dateSending: params[:dateSending],
      user: User.find(session[:user_id])
    )

    order.save

    redirect_back fallback_location: "/projects"

    
  end
end
