Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :artists do
        member do
          get :records_per_year
        end
      end

      resources :records do
        collection  do
          get :most_common_word
          get :search
        end
      end
    end
  end
end
