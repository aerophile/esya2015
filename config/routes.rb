Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #server redirects
  get '/pcj' => redirect("https://docs.google.com/a/iiitd.ac.in/forms/d/1fCqlJgchtazO-ZPOM1TniR_k4OfSOTvABJ584xrQJo4/viewform")
  get '/blog' => redirect("/blog/")
  get '/comedynight' => redirect("/comedynight/")
  get '/archive/2014' => redirect("/archive/2014/")
  get '/hackiiitd' => redirect("/hackiiitd/")

  scope 'm' do
    resources :organizers, only: [:index]
    resources :static_pages, only: [:index,:show]
    resources :sponsors, only: [:index]
    resources :events, only: [:index,:show]
    get '/register/:id(/:team_code)' => "registrations#create"
    get '/register/:id(/team/:team_name)' => "registrations#create"
    get '/check_registration/:id' => "registrations#check"
    get '/profile' => 'participants#profile'
    post '/profile/update' => "participants#update"
    get "/" => 'landings#mhome'
    get '/login'  => "sessions#create_api"
    post '/register_gcm' => "sessions#create_gcm"
    get '/schedule' => "landings#schedule"
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get '/register/:short_code' => "registrations#new_event",as: :register_event
  post '/register/:id' => "registrations#form_create",as: :form_create
  get '/register' => "registrations#new"

  get '/coming_soon' => 'landings#coming_soon'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin/:provider(/:type)' => 'sessions#new', :as => :signin
  delete '/signout' => 'sessions#destroy', :as => :logout
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'


  get '/(:type/:value)' => 'landings#home', as: :ide
  # You can have the root of your site routed with "root"
  root 'landings#home'
end
