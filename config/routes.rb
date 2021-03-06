Rails.application.routes.draw do
  resources :bookings
  post '/rate' => 'rater#create', :as => 'rate'

  resources :offers do
    resources :messages
  end
  
  resources :charges, only: [:index, :new, :create]
  # resource :booking
  resources :tours do

  end
  resources :profiles
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#page"

end
