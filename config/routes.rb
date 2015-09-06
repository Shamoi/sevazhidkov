Rails.application.routes.draw do
  root to: 'home#index', as: 'home'
  get '/contact', to: 'static_pages#contact'
  resources :portfolio
end
