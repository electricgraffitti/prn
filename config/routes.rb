ActionController::Routing::Routes.draw do |map|
  
  
  map.resources :payment_notifications
  map.resources :bookings
  map.resources :user_sessions
  map.resources :suites
  map.resources :services
  map.resources :dinings
  map.resources :suite_specs
  map.resources :amenities
  map.resources :activities
  map.resources :resorts
  map.resources :resort_locations
  map.resources :users
  
  # Landing Pages
  map.moon_palace "cancun-family-vacations", :controller => "landing_pages", :action => "moon_palace"
  map.sun_palace "cancun-spring-break", :controller => "landing_pages", :action => "sun_palace"

  map.admin_login "admin_login", :controller => "admin_sessions", :action => "new"
  map.admin_logout "admin_logout", :controller => "admin_sessions", :action => "destroy"
  
  map.payment_thank_you "thank-you", :controller => 'paypal_return', :action => 'index'
  map.policies_and_terms "policies-and-terms", :controller => "policies", :action => 'show'
  map.booking_thank_you "thank_you_for_booking", :controller => "bookings", :action => "show"
  map.user_login "login", :controller => "user_sessions", :action => "new"
  map.user_logout "logout", :controller => "user_sessions", :action => "destroy"
  
  
  map.resources :admin_sessions
  map.resources :admins
  map.resources :paradise
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.root :controller => "paradise", :action => "index"
end
