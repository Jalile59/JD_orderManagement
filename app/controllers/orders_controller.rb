class OrdersController < ApplicationController

  def index
    @projects = params[:project_id]

    if params[:page].nil?
      params[:page] = 1
    end
    @page = params[:page].to_i
    pagination = Paginationmanager.new()
    @orders = pagination.paginationOrders( params[:project_id], @page)
    @maxPage = pagination.pageMax(params[:project_id])

  end

  def indexAdmin
    @projects = params[:project_id]

    if params[:page].nil?
      params[:page] = 1
    end
    @page = params[:page].to_i
    pagination = Paginationmanager.new()
    @orders = pagination.paginationOrders( 'all', @page)
    @maxPage = pagination.pageMax(params[:project_id])

  end

  def edit
    @order = Order.find(params[:id])


  end

  def update
    @order = Order.find(params[:id])
    @order.update(device_params)

    #redirect_to orders_path, project_id: @order.project.to_s
    redirect_to controller: 'orders', action: 'index', project_id: @order.project.to_s

  end

  def new
    @order= Order.new

  end

  def create
    @order = Order.new(device_params)
    @order.dateCreated = Time.now

    #abort(@order.inspect)

    @order.save

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

  private
  def device_params

    params.require(:order).permit(:dateSending, :numberDHL, :user, :description, :statusOrders_id, :addresses_id, :project)
  end


end
