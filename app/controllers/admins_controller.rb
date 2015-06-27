class AdminsController < ApplicationController
  before_action :redirect_not_admin

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_attributes)
    if @admin.save
      flash[:success] = "Администратор создан"
      redirect_to admins_path
    else
      flash[:danger] = "Произошла ошибка, проверьте правильность заполнения формы."
      redirect_to new_admin_path
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    flash[:success] = "Администратор успешно удален"
    redirect_to admins_path
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_attributes)
      flash[:success] = "Данные администратора обновлены"
      redirect_to admins_path
    else
      redirect_to edit_admin_path(@admin)
    end
  end

  private
    def admin_attributes
      params.require(:admin).permit(:name, :email, :password)
    end
end
