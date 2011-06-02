Registrame02::Application.routes.draw do
  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  match '/companytable', :controller => 'pages', :action => 'companytable'
  match '/pages/companytable', :controller => 'pages', :action => 'companytable'
  match '/peopletable', :controller => 'pages', :action => 'peopletable'
  match '/pages/peopletable', :controller => 'pages', :action => 'peopletable'
  match '/reporting', :controller => 'pages', :action => 'reporting'
  match '/companies/:id/people', :controller => 'data/companies', :action => 'people', :as => 'company_people'

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :companies
  resources :states
  resources :countries
  resources :name_badges
  resources :people

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
  namespace :admin do
    root :to => "base#index"
    resources :users
    resources :sectors
    resources :interests
    resources :promotions
    resources :registrations
    resources :events
  end
  namespace :data do
    root :to => "base#index"
    resources :people
    resources :companies do
      #resources :people
    end
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"
  root :to => "pages#home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end