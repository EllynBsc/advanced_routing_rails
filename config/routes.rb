Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    #GET /restaurants/top
    collection do #filter the restaurants instances, filter a collection
      get :top
      # get :worst
    end

    #GET /restaurants/:id/chef
    member do #customized route on a specific instance of restaurants
      get :chef
    end

    #NESTED ROUTES FOR REVIEWS
    resources :reviews, only: [:new, :create]
     # GET /restaurants/:restaurant_id/reviews/new
     # POST /restaurants/:restaurant_id/reviews
  end

  resources :reviews, only: [ :destroy ]

end
