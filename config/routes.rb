Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :api do
    
    resources :boxes do
      resources :comments
    end
    post "/boxes/most_liked_box/" => "/spree/api/boxes#most_liked_box"
    post "/boxes/:id/" => "/spree/api/boxes#box_on_date"
    post "/daily_box/" => "/spree/api/boxes#daily_box"
    post "/weekly_box/" => "/spree/api/boxes#weekly_box"

  end


end
