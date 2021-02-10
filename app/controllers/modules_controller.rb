class ModulesController < ApplicationController

  def index
    @module = Device.all
  end
end
