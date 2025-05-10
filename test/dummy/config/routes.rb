Rails.application.routes.draw do
  mount People::Engine => "/"

  resource :session, only: [ :create ]

  root "people/people#index"
end
