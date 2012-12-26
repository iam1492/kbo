KboServer::Application.routes.draw do

  get "users/show"

  get "user/show"

  devise_for :users
  match 'users/:id(.format)' => "users#show", :via => :get, :constraints => {:id => /\d+/}
  match 'users/session(.format)' => "sessions#create", :via => :post
  match 'users/session(.format)' => "sessions#destroy", :via => :delete

  match 'comments(.format)' => "comments#create", :via => :post
  match 'comments/:id(.format)' => "comments#show", :via => :get, :constraints => {:id => /\d+/}
  match 'get_comments(.format)' => "comments#get_comments", :via => :get
  match 'get_more_comments(.format)' => "comments#get_more_comments", :via => :get
  
  match 'users/:id/block(.format)' => "users#block_user", :via => :post
  match 'users/blocks(.format)' => "users#get_blocked_user_list", :via => :get
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
