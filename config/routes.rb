Naeti::Application.routes.draw do

  resources :waitinglists

  resources :coursedates

  resources :credit_card_types

  resources :expiration_years

  resources :expiration_months

  resources :states

  devise_for :users
  
  #namespace :user do
    #root :to => "users#index"
  #end
  
  resources :content_blocks

  resources :order_items

  resources :shopping_cart_items

  resources :user_roles

  resources :orders

  resources :shopping_carts

  resources :course_registrants

  resources :course_assets

  resources :course_categories

  resources :course_dates

  resources :on_site_trainings

  resources :checkouts
  
  #match '/checkout', :to=>"checkout#index"
  #match '/checkout/confirmed/:transaction_id', :to=>"checkout#confirmed"


  match '/admin', :to=>"admin#index"
  match '/reports', :to=>"admin#reports"
  
  match '/instructors', :to=>"instructors#index"
  match '/instructors/course/:course_id', :to=>"courses#admin_instructor_edit"
  match '/admin/course/:course_id', :to=>"courses#admin_instructor_edit"
  
  match '/instructors/courses', :to=>"courses#instructor_list"
  match '/instructors/search_courses', :to=>"instructors#instructor_search"
  
  match '/on-site-training', :to=>"site#on_site_training"

  resources :courses do
    collection do
      post :search
  #   get :list
    end
  end
  
 # match '/courses/:friendly_course_url', :to=>"courses#show"
 match '/courses/register/:friendly_course_url', :to=>"courses#register"
 # match '/courses/list/:course_category_id', :to=>"courses#list"
  
 match '/courses/:course_id/export_emails', :to=>"courses#export_emails"
 match '/courses/:course_id/export_xls', :to=>"courses#export_xls"
 match '/courses/:course_id/export_pdf', :to=>"courses#export_pdf", :defaults => { :format => 'pdf' }
 match '/courses/:course_id/coursereport-:course_id-:datestamp', :to=>"courses#export_pdf", :defaults=>{:format=>"pdf"}
  

  match '/users/:user_id/add_to_course', :to=>"users#add_to_course"
  
  resources :users do
    collection do
      post :search
      post :upload
      post :user_admin
    end
  end

  match '/:friendly_url', :to=>"site#static_page"
  

  namespace :admin do
    resources :registrants
    resources :assets
    resources :user_assets
    resources :course_assets
    resources :order_items do
      collection do
        post :search
        get :confirm
      end
    end  
    resources :courses do
      collection do
        post :search
        post :upload
        post :send_reminder
      end
    end  
  end
  
  
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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
  root :to => "site#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
