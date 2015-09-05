Rails.application.routes.draw do
  get 'static_pages/contact'

  root to: 'home#index', as: 'home'
end
