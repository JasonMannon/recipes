Recipes::Application.routes.draw do
  match('recipes', {:via => :get, :to => 'recipes#index'})
  match('/', {:via => :get, :to => 'recipes#index'})
  match('recipes/new', {:via => :get, :to => 'recipes#new'})
  match('recipes/:id', {:via => :get, :to => 'recipes#show'})
end
