class ParametersController < ApplicationController

  def index
    @iduser = Parameter.where(name:'userAssigned').first
    @userassigned = User.find(@iduser.value)
    @keyAPI_redmine = Parameter.where(name:'keyAPI_redmine').first
    @dayRecall = Parameter.where(name:'dayRecall').first
    @keyAPI_dhl = Parameter.where(name:'keyAPI_dhl').first
  end

  def create
  end

  def update
    @userassigned = Parameter.where(name:'userAssigned').first
    @keyAPI_redmine = Parameter.where(name:'keyAPI_redmine').first
    @dayRecall = Parameter.where(name:'dayRecall').first
    @keyAPI_dhl = Parameter.where(name:'keyAPI_dhl').first

    user = params[:userassigned]

    @userassigned.update(value: user[:id], updateDate: Time.now)
    @keyAPI_redmine.update(value: params[:keyAPI_redmine], updateDate: Time.now)
    @dayRecall.update(value: params[:dayRecall], updateDate: Time.now)
    @keyAPI_dhl.update(value: params[:keyAPI_dhl], updateDate: Time.now)

    redirect_to controller: 'parameters', action: 'index'
  end

  def edit
    @userassigned = Parameter.where(name:'userAssigned').first
    @keyAPI_redmine = Parameter.where(name:'keyAPI_redmine').first
    @dayRecall = Parameter.where(name:'dayRecall').first
    @keyAPI_dhl = Parameter.where(name:'keyAPI_dhl').first

  end

  def destroy
  end
end
