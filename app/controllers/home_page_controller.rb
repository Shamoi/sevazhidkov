class HomePageController < ApplicationController
  def home
    @title = 'обо мне'
  end

  def contact
    @title = 'связаться со мной'
  end
end
