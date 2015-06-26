class SessionsController < ApplicationController
  def new
  end

  def create
    user = Admin.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Вы успешно вошли в админ-панель"
      redirect_to admin_path
    else
      flash[:error] = "Неправильный логин/пароль"
      redirect_to login_path
    end
  end

  def destroy
  end
end
