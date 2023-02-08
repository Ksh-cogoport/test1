Rails.application.routes.draw do

  # Defines the root path route ("/")
  # root "articles#index"
 
  #............ 
  root "pages#home"
  get "/articles", to: "articles#index"

  post "/articles", to: "articles#add"

  put "/articles/:id", to: "articles#update_article"

  delete "/articles/:id", to: "articles#delete_article"

  get "/articles/title/:part", to:"articles#find_by_partial_title"

  get "/articles/range/:date", to:"articles#date_range"
  # ........


  get "/users", to:"users#index"
  post "/users", to:"users#add"
  post "/users/check", to:"users#check"
  put "/users/update", to:"users#update_user"
  delete "/users/:id", to: "users#delete_user"
end
