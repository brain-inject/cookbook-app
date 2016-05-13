Rails.application.routes.draw do
  get '/' => 'recipes#index'
  get '/recipes' => 'recipes#index'
  get '/recipes/:id' => 'recipes#show'
end
