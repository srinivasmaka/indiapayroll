Indiapayroll::Application.routes.draw do
  
  devise_for :user_logins

  root :to => "user_logins#show"

  resources :user_logins

  resources :employees do
    member do
      get 'popupemployee'
      get 'profile'
      get 'admin_view'
    end
  end

  resources :payslips 
  
  resources :payment_histories do
    collection do
      get 'monthly_salaries'
      get 'load_payment', :as => "monthly_payroll"
    end
    member do
      get 'save_payment', :as => "monthly_payroll_confirm"
    end
  end

  resources :emp_declarations do 
    member do 
      get 'populate_declarations'
      get 'calculatehra'
  
    end
  end
  
  resources :tax_slabs
  resources :config_tables 

  resources :bulkedit_emp do
    collection do
      post 'bulk_update', :as => "bulkupdate_emp"
    end
  end

  resources :consolidated_pay, only: [:index]

  
end
