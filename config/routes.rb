Rails.application.routes.draw do
  get '/' => 'recipes#home'
  get '/single_recipe' => 'recipes#single'
end
