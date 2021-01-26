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
    abort(@projects[:codearticle][0])
    t = Time.now
    
    order = OrderTrack.new(
      dateCreated: t.in_time_zone('Europe/Paris'), 
      serialNum: params[:dhl],
      description:params[:description],
      dateSending: params[:dateSending],
      user: User.find(session[:user_id]),
      addresses_id: params[:addressId],
      project: params[:projects],
      status: params[:status]
    )

    order.save

    redirect_back fallback_location: "/projects"

    
  end

  def defxmlrequeteSlectform
    data  = params[:id]

    @device = Device.find(data)
    #abort(field) 
    render json: @device

  end

end
