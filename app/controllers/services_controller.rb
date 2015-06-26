class ServicesController < ApplicationController
  before_action :redirect_not_admin
  
  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end
end
