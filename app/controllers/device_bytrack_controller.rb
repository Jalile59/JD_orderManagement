class DeviceBytrackController < ApplicationController

  def destroy
    @deviceBytrack = DeviceBytrack.find(params[:id])
    puts @deviceBytrack.to_s
    @deviceBytrack.destroy

    redirect_to(:back)
  end
end
