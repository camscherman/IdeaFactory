Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ideas, only: [:new, :create, :edit, :update, :destroy, :show, :index]
  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]

  root('ideas#index')
end
