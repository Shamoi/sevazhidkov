Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index', as: 'home'
  get '/contact', to: 'static_pages#contact'
  resources :portfolio, as: 'projects'
end
