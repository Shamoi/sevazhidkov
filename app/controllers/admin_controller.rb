class AdminController < ApplicationController
  before_action :redirect_not_admin

  def index
    @services = Admin.all
  end

  def new
    @service = Admin.new
  end

  def create
    @admin = Admin.new(admin_attributes)
    if @admin.save
      flash[:success] = "Сервис создан"
      redirect_to admin_path
    else
      flash[:danger] = "Произошла ошибка, проверьте правильность заполнения формы."
      redirect_to new_admin_path
    end
  end

  def destroy
    @admin = Service.find(params[:id])
    @admin.destroy

    flash[:success] = "Сервис успешно удален"
    redirect_to admin_path
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_attributes)
      flash[:success] = "Сервис обновлен"
      redirect_to @admin
    else
      redirect_to 'edit'
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  private
    def admin_attributes
      params.require(:admin).permit(:name, :email, :password)
    end
end
