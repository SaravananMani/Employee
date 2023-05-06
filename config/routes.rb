Rails.application.routes.draw do
  root to: 'employee#index'
  get 'employee/index'
  get 'employee/dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
