Indiapayroll::Application.routes.draw do
  
  
  match '/payslips/:id' => 'payslips#show', :as => 'show_payslips'
  match '/payslips' => 'payslips#index'

  root :to => "sessions#new"
  resources :employees
  resources :sessions
   resources :payment_histories
   get "employees/popupemployee"
  
  match '/signout', :to => 'Sessions#destroy'
  match '/empinfo' => 'employees#employeeinfo'
  match '/employee_view_popup' => 'employees#admin_view'
  match '/monthly_Salaries' =>'payment_histories#monthly_salaries'
  match '/monthly_payroll'  =>'payment_histories#load_payment'
  match "/emp_declarations/calculatehra" => "emp_declarations#calculatehra", :as => "calculatehra"
  put '/emp_declarations/:id' => "emp_declarations#update", :as=> "emp_declaration_details_update"
  match '/emp_declarations/:emp_id' => "emp_declarations#populate_declarations", :as=> "emp_declaration_details"
  resources :emp_declarations
  resources :tax_slabs
  resources :config_tables  

  match 'consolidated_pay' =>"consolidated_pay#index"
 match 'bulkedit_emp' => "bulkedit_emp#new"
 match '/bulkupdate_emp' => "bulkedit_emp#bulk_update"
 match '/monthly_payroll_confirm'  =>'payment_histories#save_payment'
 
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
