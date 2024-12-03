Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users

  resources :quotes

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :quotes, only: [:index, :show]
      resources :users, only: [:index, :show]
    end
  end


  # Defines the root path route ("/")
  root "quotes#index"
end
