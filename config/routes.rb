Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :sessions => "user_sessions" }

  resource :user_session
  resources :users
  devise_scope :user do
    get '/login' => "user_sessions#new",      :as => :login
    get '/logout' => "user_sessions#destroy", :as => :logout
  end
  resources :dining_tables do
    collection do 
      get "left_panel"
    end
    resources :orders do
	    member do
		    get "new"
	    end
    end
  end
  resources :orders do
    member do
	   get "finish"
	   get "print"
	   get "valid"
	   get "cart"
	   get "ticket"
	   get "cheque"
	   get "cash"
	   get "multiPay"
	   get "multiPayOk"
	   get "dining_tables"
	   get "login"
    end 
    resources :order_items do
      member do
        get "add_item"
	get "add_new_item"
	get "remove_item"
      end
    end 
  end
  root to:  'dining_tables#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
end
