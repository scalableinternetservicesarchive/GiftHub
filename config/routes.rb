Rails.application.routes.draw do
  get 'photos/new'

  get 'photos/index'

  get 'photos/show'

  get 'photos/edit'

  get 'photos/create'

  get 'photos/update'

  get 'photos/destroy'

  get 'forms/index'

  get 'forms/create'

  devise_for :users

  # authenticate :user do
  #   resources :exchanges, only: [:new, :edit, :update, :destroy]
  # end
  #
  # authenticated :user do
  #   resources :forms
  # end

  authenticated :user, -> user { user.admin? } do
    match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]
  end

  resources :exchanges
  resources :forms
  resources :pages
  resources :photos
  
  root 'pages#index'

  get 'galleries' => 'galleries#index'

  get 'exchanges' => 'exchanges#index'

  if Rails.env.production?
    get '404', :to => 'application#page_not_found'
  end

  get 'dashboard' => 'pages#dashboard'



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
