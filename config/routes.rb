Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resources :projects, :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sign_up'  => 'users#create'
  get 'sign_in' => 'users#new'
end
