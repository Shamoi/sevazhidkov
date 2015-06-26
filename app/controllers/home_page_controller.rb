class HomePageController < ApplicationController
  def home
    @services = Service.all()
  end

  def contact
  end
end
