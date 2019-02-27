  Rails.application.routes.draw do  

  namespace :customer do
    get '/login',  to: 'sessions#new'
    post '/login',  to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
    resources :users, except: [:new, :create]
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]

  end
  
  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login',  to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'


    root to: 'dashboard#home'
    get '/addcustomer', to: 'users#new'
    post '/addcustomer', to: 'users#create'
    get '/customer/:id/edit', to: 'users#edit'
    patch '/customer/:id/edit', to: 'users#update'
    get '/showcustomer', to: 'users#show'
    get '/search_customer', to: 'users#search_form'
     
    resources :users, except: [:new, :create, :index, :edit, :update]
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]

  end

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'menus#show'
  get  '/about', to: 'static_pages#about', as: 'about'
  get  '/contact', to: 'static_pages#contact'
  get  '/menus', to: 'static_pages#menus'
  get  '/offers', to: 'static_pages#offers'
  get  '/bagged', to: 'static_pages#bagged'


  resource :cart, only: [:show]
  resources :order_items

  
  get '/menu', to: 'menus#menu' 

  get 'admin/addmenuitem',    to: 'menu_items#new'
  get 'admin/updatemenuitem', to: 'menu_items#search_form'
  get 'admin/searchmenuitem', to: 'menu_items#search_form'
  get 'admin/deletemenuitem', to: 'menu_items#search-form'
  get 'admin/item_profile',   to: 'menu_items#show'  
  resources :menu_items, except: [:index, :new]


  get '/get_menu', to: 'menus#index'
  get '/show', to: 'menus#show'
  get '/breakfast_menu', to: 'menus#breakfast_menu'
  get '/lunch_menu', to: 'menus#lunch_menu'
  get '/happy_hour_menu', to: 'menus#happy_hour_menu'
  get '/dinner_menu', to: 'menus#dinner_menu'
  get '/latenight_menu', to: 'menus#latenight_menu'
  get '/brunch_menu', to: 'menus#brunch_menu'

end
