Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :api do
    
    resources :boxes do
      resources :comments
    end
    post "/boxes/most_liked_box/" => "/spree/api/boxes#most_liked_box"
  end


end
