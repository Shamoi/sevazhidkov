class ServicesController < ApplicationController
  before_action :redirect_not_admin

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_attributes)
    if @service.save
      flash[:success] = "Сервис создан"
      redirect_to service_path
    else
      flash[:danger] = "Произошла ошибка, проверьте правильность заполнения формы."
      redirect_to new_service_path
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    flash[:success] = "Сервис успешно удален"
    redirect_to services_path
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
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

  private
    def service_attributes
      params.require(:service).permit(:name, :description,
                                   :link, :admin_link  )
    end
end
