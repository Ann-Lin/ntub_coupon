Rails.application.routes.draw do
  root "products#index"
  resources :coupon_codes
  resources :products do
    member do
      get :apply_coupon
    end
  end
end
