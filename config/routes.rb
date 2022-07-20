Rails.application.routes.draw do
  
  get "/users", to:"users#index"
  get "/users/:id", to:"users#singleUser"

  get "/todos", to:"todos#index"
  post "/test", to:"todos#test"

  get "/todoAll", to:"todos#todoAll"
  post "/todoAdd", to:"todos#add"
  post "/todoUpdate", to:"todos#update"
  delete "/todoDelete", to:"todos#delete"
end
