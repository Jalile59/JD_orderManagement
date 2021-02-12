class AddressesController < ApplicationController

  def index
    @addresse = Addresse.new
  end

  def destroy
    @addresse = Addresse.find(params[:id])
    @addresse.destroy

    redirect_to addresses_path
  end

  def create
    addresse = Addresse.create(device_params)

    redirect_to addresses_path
  end


  private
  def device_params
    params.require(:addresse).permit(:name, :localisation)
  end
end
