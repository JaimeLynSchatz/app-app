AppApp::Application.routes.draw do
  root 'home#index'
  
  # SESSIONS
  post '/sign-in',                 to: 'sessions#create',  as: :create_sign_in
  get  '/sign-in',                 to: 'sessions#new',     as: :sign_in
  get  '/sign-out',                to: "sessions#destroy", as: :sign_out
  
  # PEOPLE
  post  "/apply",       to: "people#create",        as: :create_sign_up
  get   "/apply",       to: "people#new",           as: :sign_up
  get   "/reviewer",    to: "people#new_reviewer",  as: :reviewer_sign_up
  post  "/reviewer",    to: "people#create_reviewer",  as: :create_reviewer
  patch "/update",      to: "people#update",        as: :person
  get   "/profile",     to: "people#edit",          as: :profile
  
  # SUBMISSIONS
  get   "/submission", to: "submissions#edit",  as: :submission
  get   "/complete",   to: "submissions#show",  as: :complete
  patch "/submission", to: "submissions#update"
  
  # ADMIN
  
  namespace :admin do
    
    get   "/assign/:person_id", to: "reviews#assign",  as: :assign_review
    get   "/:id/edit",          to: "reviews#edit",    as: :edit_review
    patch "/:id",               to: "reviews#update",  as: :update_review
    get   "/",                  to: "reviews#index",   as: :reviews
    patch "/people/:id/unlock", to: "people#unlock",   as: :unlock
    resources :people
    resources :submissions, only: :index
  end
  
  
  
end
