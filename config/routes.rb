Adtlist::Application.routes.draw do
  #resources :stats
  get "/stats/destroy_all"  =>"stats#destroy_all"
  get "/stats" =>"stats#index"
 
  
  resources :partners


  resources :types


  match '/about'=> 'about#index'

  resources :news_lists
  


  resources :reviews


  resources :accountabilityagents

#resources :types

  resources :agentprofiles
  match '/agentprofiles/findbypost/:post_id' => 'agentprofiles#findbypost', :post_id => :post_id
  


  resources :images
  match 'images/findbypost/:post_id' => 'images#findbypost', :post_id => :post_id

  resources :regions
  match '/get_regions'=> 'regions#get_regions'

  resources :categories

  post "posts/index"
  resources :posts

  get "main/index"

  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  
  root :to => 'main#index'

  #match '/adt/:altname'=> 'main#show'
  match '/news'=> 'main#news'
  match '/news/:id'=> 'main#news_show', :id => :id


  match '/search'=> 'main#search'
  #match '/search/:category'=>'main#search', :category=>:category

  match '/search/:category/:region'=> 'main#search', :region => :region, :category=>:category
  
  #match '/:category/:region/:altname'=> 'main#show', :region => :region, :altname => :altname
    #match '/:region'=> 'main#region', :region => :region
  match '/:region/:altname'=> 'main#show', :region => :region, :altname => :altname

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
