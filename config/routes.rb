Rails.application.routes.draw do
  resources :student_groups
  resources :groups
  get 'course_dashboard/index'
  resources :site_facilitator_allocations
  resources :site_facilitators
  resources :allocations
  get 'dashboard/index'

  resources :schedules do
    collection { post :delete_with_student_id} #route to controller function for deleting schedules of a specific student id
    collection { post :delete_with_schedule_id}
  end
  resources :students
  resources :course_specialties
  resources :courses

#<<<<<<< programmes
  resources :programme_courses
  resources :programmes
  resources :dashboard
  resources :specialties
  resources :hospitals
  resources :users do
      collection { post :import} # route for importing from csv
  end

  get 'menu/index'
  get 'home/index'
  get 'student_dashboard/index'
  #==================================

  get '/programmes', to: "programmes#index"
  get '/specialties', to: "blocks#index"
  get '/dashboard', to: 'dashboard#index'
  get 'add_specialty/index'
  get "/blocks",to: "blocks#index"

  devise_for :admins,
    controllers: {:registrations => "registrations"} #, :sessions => "sessions"} #That will tell devise to use your custom registrations controller

  #Setting up a custom route to that action:-----------------------------------------------------------------------------
  as :admin do
    get "/register", to: "registrations#new", as: "register"
    get "/admins/sign_out", to: "devise/sessions#destroy", as: "sign_out"
    #Sget "/session", to: "sessions#new", as: "session"
  end

  resources :csvs do
    collection do
      get :add_csv
    end
  end
  #---------------------------------------------------------------------------------------------------------

  #--------------------------------------------------------------------------------------------------------

  #root 'dashboard#index'


  #START - Setting routes using devise scope---------------------------------------------------------------------------
  devise_scope :admin do
    authenticated :admin do
      root 'menu#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  #END - Setting routes using devise scope---------------------------------------------------------------------------

end
