Rails.application.routes.draw do
  root 'sessions#index' 

  resources :users, :roles, :sessions, :rest_services

  get '/rest_services/get_employee/:id', 	to: 'rest_services#get_an_employee', 	as: 'get_an_employee'

end
