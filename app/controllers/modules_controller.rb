class ModulesController < ApplicationController

  def index
    @device = Device.new()
  end

  # !!! must be fix csf issus !!!
  def devices

    abort(params.to_s)
  end

  def create
    device = Device.create(device_params)

    redirect_to modules_path
  end

  private
  def device_params
    paramms.require(:device).permit(:codearticle, :name, :designation)
  end

  def def new
    @device = Device.new
  end
  
end
