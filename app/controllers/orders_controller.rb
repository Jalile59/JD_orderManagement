class OrdersController < ApplicationController

  #before_action :find_project, :authorize, only: [:index]
  before_action :checkuserAllowProjectOrders
  skip_before_action :checkuserAllowProjectOrders, only: [:defxmlrequeteSlectform]



  def index
    @project = Project.find(params[:project_id])
    @listeOrder = OrderTrack.where(project: params[:project_id]).all


  end

  def indexAdmin

    @listeOrder = OrderTrack.all()
  end

  def addform
    @project = Project.find(params[:project_id])

    @projects = params[:project_id]
    @trakingOrder = OrderTrack.new
  end

  def addformView
    @projects = params[:project_id]
    @address = Addresse.all
  end

  def postForm

    arrayss = params[:codearticle]
    t = Time.now
    #abort(params.inspect)
    if  params.include? (:idorder)
  
      editOrder = OrderTrack.find(params[:idorder]);

      editOrder.update(
        dateCreated: t.in_time_zone('Europe/Paris'), 
        serialNum: params[:dhlnumber],
        description:params[:description],
        dateSending: params[:dateSending],
        addresses_id: params[:addressId],
        status: params[:status]
      )

      orderId = editOrder.id;
      
  
    else
      order = OrderTrack.new(
        dateCreated: t.in_time_zone('Europe/Paris'), 
        serialNum: params[:dhlnumber],
        description:params[:description],
        dateSending: params[:dateSending],
        user: User.find(session[:user_id]),
        addresses_id: params[:addressId],
        project: params[:project_id],
        status: params[:status]
      )
  
      order.save

      orderId = order.id;

      

    end
    if params.include? (:codearticle)
      arrayss.each  do  |n| 
        moduleD = Device.where(codearticle: n).first
        i=0
        #abort(moduleD)
        @deviceByOrd = DeviceBytrack.new(device_id: moduleD.id,orderTrack_id: orderId, created: Time.now, quantity: params[:quantity][i] )
        @deviceByOrd.save
        i = i+1
      end
    end
  
    redirect_back fallback_location: "/projects"

    
  end

  def defxmlrequeteSlectform
    data  = params[:id]

    @device = Device.find(data)
    #abort(field) 
    render json: @device

  end

  def fixtures
    @dv01 = Device.new(codearticle: 'KJHGB65', name: 'lecteur aimant', designation: 'A14', project: 'tsa');
    @dv02 = Device.new(codearticle: 'GHDZSQ', name: 'Gyro', designation: 'A13', project: 'tsa');

    @ad01 = Addresse.new(name: 'Linz', localisation: '25 rue de la paix');
    @ad02 = Addresse.new(name: 'Gonesse', localisation: '12 rue foch');

    @dv01.save
    @dv02.save

    @ad01.save
    @ad02.save

    render json:"fixture ok"
  end

  def editAddviewForm
    idorder = params[:id]
    @project = Project.find(params[:project_id])
    @ord = OrderTrack.find(idorder)

    @devTrack = DeviceBytrack.where(orderTrack_id: @ord.id).all

    #abort(@devTrack)

  end

  def delAjaxrequet
    iddeviceOrder = params[:id]
    deviceD = DeviceBytrack.find(iddeviceOrder).destroy

    render json: iddeviceOrder

  end

  def checkuserAllowProjectOrders
  
    userId = User.find(session[:user_id])
    #userId = User.find(5)
    #abort(params.to_s)

    if userId.admin 
      
    else
      @project = Project.find(params[:project_id])
      projectCurrent = Project.where(name:params[:project_id]).last
      userAllow = Member.where(user_id: userId.id, project_id: projectCurrent.id).first

      #abort(userAllow.id.to_s)
      isOrderIn = Tools.new("g").checkIfRoleIsAllowProject(MemberRole.find(userAllow.id).id)

      if(!userAllow == nil or !isOrderIn )
        render_404
      end

    end
    
  end

end
