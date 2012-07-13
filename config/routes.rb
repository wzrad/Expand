Expand::Application.routes.draw do
  
  root :to => 'home#index'

  devise_for :users, :controllers => { :sessions => 'sessions' }
  
  resources :games, :except => :index
  match 'portal' => 'games#index', :as => :portal, :via => :get
  
  match 'test' => 'test_game#start', :as => :test, :via => :get 
  match 'testContinue' => 'test_game#play', :as => :testContinue, :via => :get

  resources :players, :only => :update
  
  # endpoints
  devise_scope :user do
     get 'users_online', :to => 'sessions#users_online', :as => :users_online
  end
  
  match 'proposed_games' => 'games#proposed_games', :as => :proposed_games, :via => :get
  match 'ready_game' => 'games#ready_game', :as => :ready_game, :via => :get
  match 'started_game' => 'games#started_game', :as => :started_game, :via => :get
  
  match 'poll_game_state' => 'games#poll_game_state', :as => :poll_game_state, :via => :get
      
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
