Rails.application.routes.draw do
  get "show" , action: :show , controller: :books
  post "add_book" , action: :create , controller: :books
        # post 'add_user', action: :addUser, controller: :users
  #put "change" , action: :update , controller: :books
  
  delete "delete" , action: :delete , controller: :books
end
