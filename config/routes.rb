Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/departments/index', to: 'departments#index'

  get '/employees/:employee_id', to: 'employees#show'
  
  post 'employee_tickets/new', to: 'employee_tickets#new'
end
