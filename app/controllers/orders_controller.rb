class OrdersController < ApplicationController

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
    @projects = params[:project_id]

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

  def update
     @order = Order.find(params[:id])

    # abort(@order)
    if @order.update(device_params)
    #redirect_to orders_path, project_id: @order.project.to_s
      redirect_to controller: 'orders', action: 'index', project_id: @order.project.to_s
    else
      redirect_to controller: 'orders', action: 'edit', project_id: @order.project.to_s
    end

  end

  def new
    @project = Project.find(params[:project_id])
    @order= Order.new
   

  end

  def create

    if params.include?(:file)
    upload()
    end

    @order = Order.new(device_params)
    @order.dateCreated = Time.now
    arrayss = params[:codearticle]
    @order.save

    if params.include? (:codearticle)
      arrayss.each  do  |n| 
        @moduleD = Device.where(codearticle: n).first
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

    

    if @order.save
      redirect_to controller: 'orders', action: 'index', project_id: @order.project.to_s
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
    #abort(name)

    File.open(Rails.root.join('public', 'uploads',  name), 'wb') do |file|
      file.write(uploaded_file.read)
    end
  end

  def createIssusOrderLimit()
    ntracker = Tracker.create(name:'order', )
    @issue = Issue.create(subject: 'test', tracker_id: 1, )
  end


end
