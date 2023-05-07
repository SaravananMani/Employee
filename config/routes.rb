Rails.application.routes.draw do
  root to: 'employee#index'
  get 'employee/index'
  match 'employee/dashboard', to: 'employee#dashboard', via: [:get, :post], as: 'employee_dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
