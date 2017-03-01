Rails.application.routes.draw do
  root to: 'home#index'
  get  'auth/:provider/callback',    to: 'sessions#create'
  get  'sign_in_with_census',    to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get '/cohorts', to: 'cohorts#index'
  post '/cohorts/verify', to: 'cohorts#verify'

end
