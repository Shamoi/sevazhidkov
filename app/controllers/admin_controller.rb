class AdminController < ApplicationController
  def services
    redirect_not_admin
  end
end
