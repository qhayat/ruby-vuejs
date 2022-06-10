Rails.application.routes.draw do

  root "recipes#index"

  scope 'api' do
    scope 'recipes' do
      get "/", to: "recipes#index"
      get "/:id", to: "recipes#show"
      post "/", to: "recipes#create", :defaults => {:format => :json}
      put "/:id", to: "recipes#update", :defaults => {:format => :json}
      delete "/:id", to: "recipes#destroy"
    end
    scope 'ingredients' do
      get "/", to: "ingredients#index"
      get "/:id", to: "ingredients#show"
      post "/", to: "ingredients#create", :defaults => {:format => :json}
      put "/:id", to: "ingredients#update", :defaults => {:format => :json}
      delete "/:id", to: "ingredients#destroy"
    end
  end

end
