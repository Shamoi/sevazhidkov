class ServicesController < ApplicationController
  before_action :redirect_not_admin

  def index
    @services = Service.all
  end

  def new
  end

  def create
  end

  def destroy
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    service_attributes = params[:service].permit(:name, :description,
                                                 :link, :admin_link  )
    if @service.update_attributes(service_attributes)
      flash[:success] = "Сервис обновлен"
      redirect_to @service
    else
      redirect_to 'edit'
    end
  end

  def show
    @service = Service.find(params[:id])
  end
end
