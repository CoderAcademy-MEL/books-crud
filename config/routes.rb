Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/books", to: "books#index"
  post "/books", to: "books#create"
  get "/books/:id", to: "books#show", as: "book"
  put "/books/:id", to: "books#update"
  delete "/books/:id", to: "books#destroy"
end
