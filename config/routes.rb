Rails.application.routes.draw do
  get '/', to: 'home_page#index', as: 'home'
end
