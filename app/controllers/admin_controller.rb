class AdminController < ApplicationController
  def apps
    if !admin?
      flash[:error] = "Необходимо авторизоваться, чтобы использовать админку"
      redirect_to login_path
    end
  end
end
