MultilangsExperiment::Application.routes.draw do
  scope "(:locale)", :locale => /en|de/ do
    root :to => 'books#index'
    resources :books
    resources :users, only: :update
  end
end
