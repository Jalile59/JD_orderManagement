class OrdersController < ApplicationController

  #before_action :find_project, :authorize, only: [:index]
  before_action :checkuserAllowProjectOrders
  skip_before_action :checkuserAllowProjectOrders, only: [:defxmlrequeteSlectform, :defxmlrequeteSlectform]



  def index
    @project = Project.find(params[:project_id])
    #    @listeOrder = OrderTrack.where(project: params[:project_id]).all
    #abort(params[:page].to_s)
    
    if params[:page].nil?
         params[:page] = 1
    end
    @page = params[:page].to_i
    pagination = Paginationmanager.new()
    @listeOrder = pagination.paginationOrders( params[:project_id], @page)
    @maxPage = pagination.pageMax(params[:project_id])

    

  end

  def indexAdmin
    
    if params[:page].nil?
         params[:page] = 1
    end
    @page = params[:page].to_i
    pagination = Paginationmanager.new()
    @listeOrder = pagination.paginationOrders( 'all', @page)
    @maxPage = pagination.pageMax(params[:project_id])  end

  def addform
    @project = Project.find(params[:project_id])

    @projects = params[:project_id]
    @trakingOrder = OrderTrack.new
  end

  def addformView
    @error = {
      'file' => 0
    }
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
        user: User.find(session[:user_id]),
        statusOrders_id: params[:status]
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
        project: params[:projectId],
        statusOrders_id: params[:status]
      )

      # upload file
      if params[:fileOrd]
        filecheck = Checkfile.new(params[:fileOrd])

        if !filecheck.checkSizeFile() or !filecheck.isPDF()
          @error = {
              'file' => 1
            }
        end
        
        uploaded_io = params[:fileOrd]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w').write(uploaded_io.read.force_encoding(Encoding::UTF_8))
      end
      #abort(@error['file'].to_s)
      order.save

      orderId = order.id;

      
     # abort(params[:codearticle].to_s)

    end
    if params.include? (:codearticle)
      arrayss.each  do  |n| 
        moduleD = Device.where(codearticle: n).first
        i=0
        #abort(moduleD.to_s)
        @deviceByOrd = DeviceBytrack.new(device_id: moduleD.id,orderTrack_id: orderId, created: Time.now, quantity: params[:quantity][i], serial: params[:serial][i])
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

    @status01 = StatusOrder.new(name: 'En cours')
    @status02 = StatusOrder.new(name: 'cloturée')
    @status03 = StatusOrder.new(name: 'En attente')

    @ad01 = Addresse.new(name: 'Linz', localisation: '25 rue de la paix');
    @ad02 = Addresse.new(name: 'Gonesse', localisation: '12 rue foch');

    @dv01.save
    @dv02.save

    @ad01.save
    @ad02.save

    @status01.save
    @status02.save
    @status03.save

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
