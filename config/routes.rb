Rails.application.routes.draw do

  get 'consoles/index'

  get 'consoles/new'

  get 'cplayers/index'

  get 'cplayers/new'

  get 'titles/index'

  get 'titles/new'

  # get 'genres/index'

  # get 'genres/new'
  # get 'genres/edit'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  devise_scope :user do
    root to: "devise/sessions#new"
  end
   resources :friendships
  match '/index', to: 'static_pages#index', via: 'get', as: :index
  match '/profile', to: 'static_pages#profile', via: [:get, :post], as: :profile
  match '/terms-of-service', to: 'static_pages#terms_of_service', via: 'get', as: :terms_of_service
  match '/demo', to: 'static_pages#demo', via: 'get', as: :demo
  
resources :messages
resources :genres do
  # collection do
  # end
end
resources :channels do
collection do 
  post :create_new_post
  end
end

resources :user_details do 
  collection do
    post :update_user
  end
end


  #match '/index', to: 'static_pages#index', via: [:get, :post] , as: :index
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
