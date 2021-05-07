class OrdersController < ApplicationController

  before_action :checkIfUserAllow, except:[:fixtures]

  def index
    @project_id = params[:project_id]
    @project = Project.find(params[:project_id])


    if params[:page].nil?
      params[:page] = 1
    end
    @page = params[:page].to_i
    pagination = Paginationmanager.new()
    @orders = pagination.paginationOrders( params[:project_id], @page)
    @maxPage = pagination.pageMaxOrders(params[:project_id])
  end

  def indexAdmin

    if params[:page].nil?
      params[:page] = 1
    end
    @page = params[:page].to_i
    pagination = Paginationmanager.new()
    @orders = pagination.paginationOrders( 'all', @page)
    @maxPage = pagination.pageMaxOrders(params[:project_id])

  end

  def edit
    @project = Project.find(params[:project_id])
    @order = Order.find(params[:id])
    @devTrack = DeviceBytrack.where(order_id: @order.id).all

  end

  def show
    @project = Project.find(params[:project_id])
    @order = Order.find(params[:id])
    @devices = DeviceBytrack.where(order_id: @order.id)
  end

  def update
    @project = Project.find(params[:project_id])
    @order = Order.find(params[:id])
    @devTrack = DeviceBytrack.where(order_id: @order.id).all

    if params[:order]['file'].nil? == false
       upload()
    end

    arrayss = params[:codearticle]

    if params.include? (:codearticle)
      arrayss.each  do  |n|
        @moduleD = Device.where(codearticle: n).first
        puts 'moduleId='+@moduleD.id.to_s
        i=0

        @deviceByOrd = DeviceBytrack.new(
          device_id: @moduleD.id,
          order_id: @order.id,
          created: Time.now,
          quantity: params[:quantity][i],
          serial: params[:serial][i]
        )

        @deviceByOrd.save

        i = i+1
        end
      end

    @order.dateUptaded = Time.now
     if @order.update(device_params)
    #redirect_to orders_path, project_id: @order.project.to_s
      redirect_to controller: 'orders', action: 'index', project_id: @order.project.to_s
    else
      render "edit"

     end

  end

  def new
    @project = Project.find(params[:project_id])
    @order= Order.new
   

  end

  def create
    @project = Project.find(params[:project_id])

    #abort(Time.now.in_time_zone('Paris').to_s)

    if params[:order]['file'].nil? == false
    upload()
    end


    @order = Order.new(device_params)
    time= Time.now.localtime
     @order.dateCreated = time
    arrayss = params[:codearticle]
    # abort(Time.now.to_s)
    @order.save

    if params.include? (:codearticle)
      arrayss.each  do  |n| 
        @moduleD = Device.where(codearticle: n).first
        puts 'moduleId='+@moduleD.id.to_s
        i=0

        @deviceByOrd = DeviceBytrack.new(
          device_id: @moduleD.id,
          order_id: @order.id, 
          created: time,
          quantity: params[:quantity][i], 
          serial: params[:serial][i]
          )

        @deviceByOrd.save

        i = i+1
      end
    end

    

    if @order.save
      redirect_to controller: 'orders', action: 'index', project_id: @order.project.to_s
    else
      render 'new'
    end

  end

  def fixtures
    Tools.new().addFixtures
    render json:"fixture ok"
  end

  def destroy
    @order = Order.find(params[:id])
    @projectId = @order.project.to_s
    @order.destroy

    redirect_to controller: 'orders', action: 'index', project_id: @projectId
  end

  def defxmlrequeteSlectform
    data  = params[:id]

    @device = Device.find(data)
    #abort(field) 
    render json: @device

  end

  def download_pdf
    order = Order.find(params[:namefile])
    send_file(
      "#{Rails.root}/public/uploads/"+order.filename,
      filename: order.filename,
      type: "application/pdf"
    )
  end

  private
  def device_params

    params.require(:order).permit(:dateSending, :numberDHL, :user, :description, :statusOrders_id, :source, :destination, :project, :filename)
  end

  def upload
    uploaded_file = params[:order]['file']


    time = Time.new
    name = time.strftime("%s") + '_' + uploaded_file.original_filename.to_s
    params[:order]['filename'] = name

    File.open(Rails.root.join('public', 'uploads',  name), 'wb') do |file|
      file.write(uploaded_file.read)
    end

    return name
  end

  def createIssusOrderLimit()
    ntracker = Tracker.create(name:'order', )
    @issue = Issue.create(subject: 'test', tracker_id: 1, )
  end

  def checkIfUserAllow()
    @user = User.current

    groupCommandeSav = Group.where(lastname: "commandeSAV").first

    #abort(groupCommandeSav.users.all.login.to_s)
    #
    result = userInGroup(groupCommandeSav.users, @user)
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>"+result.to_s
    if(groupCommandeSav.users.length() > 0)
      if(result != true)
        deny_access
      end
    else
      deny_access
    end
  end
  
  def userInGroup(listeData, usercurrent)

    for user in listeData
      if user.login == usercurrent.login
        return true
      end

    end

    return false
    
  end


end
