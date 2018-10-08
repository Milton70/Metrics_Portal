Rails.application.routes.draw do
  root 'sessions#index' 

  resources :users, :roles, :sessions, :rest_services
end
