Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :create, :show]
      resources :cities, only: [:index]
      resources :topics, only: [:index]
      resources :filters, only: [:index, :create, :update]
      resource :login, only: [:create], controller: :sessions
    end
  end



  devise_for :user, only: []
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
