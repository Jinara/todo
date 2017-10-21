Rails.application.routes.draw do
  root "holi_todos#index"
  resources :holi_todos
end
