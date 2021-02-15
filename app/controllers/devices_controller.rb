class DevicesController < ApplicationController

  def index
    @device = Device.new()

    if params[:page].nil?
      params[:page] = 1
    end
    @page = params[:page].to_i
    pagination = Paginationmanager.new()
    @devices = pagination.paginationDevices(@page)
    @maxPage = pagination.pageMaxDevice()

    #abort(@maxPage.to_s)

  end

  def create
    #abort(device_params.to_s)
    device = Device.create(device_params)

    redirect_to devices_path
  end

  def show
    @device = Device.find(params[:id])

  end

  def def new
    @device = Device.new
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy

    redirect_to devices_path
  end

  private
  def device_params
    
    params.require(:device).permit(:codearticle, :name, :designation, :project.downcase)
   
  end
  
end
