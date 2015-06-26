class SessionsController < ApplicationController
  def new
  end

  def create
    user = Admin.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Lulz
    else
      flash[:error] = "Неправильный логин/пароль"
      redirect_to login_path
    end
  end

  def destroy
  end
end
