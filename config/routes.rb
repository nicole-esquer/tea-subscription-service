Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/:customer_id/subscriptions', to: 'subscriptions#create'
      patch '/:customer_id/subscriptions', to: 'subscriptions#update'
    end
  end
end
