Rails.application.routes.draw do
  get 'entry/index'
  get 'entry/show'
  get 'application/index'
  get 'application/show'
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :admin do
    get '/admins/sign_out' => 'admins/sessions#destroy'
  end
  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end

  resources :events

  get "users",to: "users_home#index",as: "users_home"
  get "admins",to: "admins_home#index" ,as: "admins_home"

  #root to:"events#index"
  get "entrys", to: "entry#index"
  post "entrys/limited/:id",to: "entry#limited", as:"limited_entry_show"
  get "entrys/:id",to: "entry#show", as: "entry"
  root to: "entry#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
