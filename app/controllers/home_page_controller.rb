class HomePageController < ApplicationController
  def home
    @title = 'Обо мне'
  end

  def contact
    @title = 'Связаться со мной'
  end
end
