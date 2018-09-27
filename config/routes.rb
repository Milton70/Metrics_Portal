Rails.application.routes.draw do
  root 'sessions#index' 

  resources :users, :roles, :sessions
end
