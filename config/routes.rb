Rails.application.routes.draw do
  root "products#index"
  resources :coupon_codes
  resources :products
end
