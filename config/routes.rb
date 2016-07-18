Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'topics/index'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :create,:show]
      resources :cities, only: [:index]
    end
  end



  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
