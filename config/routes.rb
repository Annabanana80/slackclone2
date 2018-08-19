Rails.application.routes.draw do
  devise_for :users
  
  resources :chatchannels do
  	resource :chatchannel_users
  	resources :messages
  end

  resources :direct_messages
  
  root to: "chatchannels#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
