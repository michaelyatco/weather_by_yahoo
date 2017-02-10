Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "forecasts#index"
  get "/forecasts", to: "forecasts#index"
end
