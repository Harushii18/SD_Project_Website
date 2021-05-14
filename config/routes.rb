Rails.application.routes.draw do
  get 'dashboard/index'
  get 'home/index'
<<<<<<< HEAD

  #PLEASE AUTHENTICATE!
  #TODO: AUTHENTICATION
  get "/hospitals",to: "hospitals#index"
 

  get "/blocks",to: "blocks#index"

  #========================================================
  
  devise_for :admins
=======
>>>>>>> 3ccbf4433dac3744647006c7816be49ce24a07d2

  devise_for :admins,
    controllers: {:registrations => "registrations"} #, :sessions => "sessions"} #That will tell devise to use your custom registrations controller

#Setting up a custom route to that action:-----------------------------------------------------------------------------
as :admin do
  get "/register", to: "registrations#new", as: "register"
  #Sget "/session", to: "sessions#new", as: "session"
end
#---------------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------------

#root 'dashboard#index'


#START - Setting routes using devise scope---------------------------------------------------------------------------
devise_scope :admin do
  authenticated :admin do
    root 'dashboard#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
#END - Setting routes using devise scope---------------------------------------------------------------------------

end
