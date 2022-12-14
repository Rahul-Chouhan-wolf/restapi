Rails.application.routes.draw do
  
  get "show" , action: :show , controller: :books

  post "add_book" , action: :create , controller: :books

  put "change" , action: :update , controller: :books
  
  delete "delete" , action: :delete , controller: :books
  
  get "user/all" , action: :show_all , controller: :users
  get "user/index", action: :index , controller: :users

  resource :user
  
end
