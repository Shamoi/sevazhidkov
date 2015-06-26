class ServicesController < ApplicationController
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
