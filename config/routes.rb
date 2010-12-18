Boxoffice::Application.routes.draw do

  get "cafe/index"
  match 'cafe/index', :to => 'cafe#index'
  match 'cafe', :to => 'cafe#index'

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :payment_notifications

  resources :users

  resources :line_items

  resources :carts
  match 'clear', :to => 'carts#destroy'

  resources :events

  get "thanks/index"
  match 'thanks/index',  :to => 'thanks#index', :as => 'thanks'
  match 'thanks',  :to => 'thanks#index', :as => 'thanks'

  get "listing/index"
  match 'listing',  :to => 'listing#index'
  match 'listing/index',  :to => 'listing#index'

  match 'shows', :to => 'listing#index'

  match "/home"      => redirect("http://artsandmusicfactory.com")
  match "/artists"      => redirect("http://artsandmusicfactory.com/artists.html")
  match "/galleries"      => redirect("http://artsandmusicfactory.com/galleries.html")
  match "/musicians"      => redirect("http://artsandmusicfactory.com/musicians.html")
  match "/studio"      => redirect("http://artsandmusicfactory.com/pushkin-studio.html")
  match "/galleries"      => redirect("http://artsandmusicfactory.com/galleries.html")
  match "/store"      => redirect("http://music.artsandmusicfactory.com/")
  match "/blog"      => redirect("http://artsandmusicfactory.com/blog/")
  match "/info"      => redirect("http://artsandmusicfactory.com/info.html")



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
  # root :to => "welcome#index"
  # root :to => 'listing#index', :as => 'listing'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
