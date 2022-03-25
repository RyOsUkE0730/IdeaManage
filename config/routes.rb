Rails.application.routes.draw do
  root to: 'ideas#index'
  resources :ideas, only: [ :index, :new, :create, :show ]
end
