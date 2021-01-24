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
    @address = Addresse.all
  end

  def postForm

    @projects = params
    yml = params[:addressId].to_s.to_yaml
    #abort( yml[])
    t = Time.now
    
    order = OrderTrack.new(
      dateCreated: t.in_time_zone('Europe/Paris'), 
      serialNum: params[:projects],
      description:params[:description],
      dateSending: params[:dateSending],
      user: User.find(session[:user_id]),
      addresse_id: params[:addressId],
      status: params[:status]
    )

    order.save

    redirect_back fallback_location: "/projects"

    
  end
end
