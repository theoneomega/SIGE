Sied::Application.routes.draw do


  # resources :helpdesk_screenshots


  get "helpdesk_actions/create"

  get "helpdesk_actions/destroy"

  resources :helpdesks do
    resources :helpdesk_screenshots
    resources :helpdesk_actions
  end


  resources :historical_archives, :only => [:index, :show]

  resources :error_reports

  get "statistics/index", :as => :statistics

  resources :pdf_investigations

  resources :anb_investigations

  resources :investigations


  resources :offices_attachments


  resources :justice_net_files


  resources :justice_nets


  resources :iph_crimes


  get "users_information/index"
  get "searchs/colaboraciones"

  match 'users_information/index' => 'users_information#index', :as => :user_info

  match 'offices/refuse/:id' => 'offices#refuse', :as => :refuse
  match 'offices/assign/:id' => 'offices#assign', :as => :assign
  get 'offices/approve/:id' => 'offices#approve', :as => :approve
  match 'justice_nets/assign_net/:id' => "justice_nets#assign_net", as: :assign_net
  match 'justice_nets/finish/:id' => 'justice_nets#finish', :as => :finish_justice_net

  match 'colaborations/assign/:id' => 'colaborations#assign', :as => :assign_colaboration
  match 'colaborations/refuse/:id' => 'colaborations#refuse', :as => :refuse_colaboration
  match 'colaborations/approve/:id' => 'colaborations#approve', :as => :approve_colaboration
  match 'colaborations/sendit/:id' => 'colaborations#sendit', :as => :sendit_colaboration
  match 'colaborations/send_colaboration/:id' => 'colaborations#send_colaboration', :as => :send_colaboration

  match "justice_nets/approve_net/:id" => "justice_nets#approve", :as => :approve_net

  resources :iph_images


  resources :units


  resources :office_files


  resources :iph_objects


  resources :iphs


  resources :iph_drugs


  resources :iph_weapons


  resources :iph_vehicles


  resources :iph_people


  resources :colaboration_files


  resources :colaboration_areas


  resources :searches, :path => "search"


  get "search/index"

  get "colaboration_collection/index"

  get "colaboration_collection/show"

  resources :offices do
    collection do
      get :not_assigned
      get :working
      get :standby
      get :waiting
      get :replied
    end
  end


  resources :phones


  resources :colaborations


  resources :backup_files


  resources :events_collections
  resources :events do
    collection do
      get :person
    end
  end


  #  get "testfullevents/index"




  #  get "fullevents/index"

  #  map.connect ':controller/:action.:format'
  #  match "/:controller(/:action)(.:format)"
  resources :roles


  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end

  resources :users



  resources :localities


  resources :priorities


  resources :vehicles


  resources :criminal_groups


  resources :weapon_types


  resources :weapons


  resources :statuses


  resources :people




  get "catalogs/index"

  resources :analysts


  get "welcome/index"

  resources :areas


  resources :drugs


  resources :person_statuses


  resources :weapons_types


  resources :crimes


  resources :event_statuses


  resources :places


  resources :townships


  resources :addresses


  resources :vehicles


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
  root :to => 'welcome#index'

  match "/colaboration_collection/index" => "colaboration_collectionr#index", :as => :colaboration_collection

  match "/welcome/index" => "welcome#index", :as => :welcome
  # See how all your routes lay out with "rake routes"
  match "/users_information/index" => "users_information#index", :as => :users_info

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
