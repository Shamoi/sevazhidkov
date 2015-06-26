class AdminController < ApplicationController
  def apps
    redirect_not_admin
  end
end
