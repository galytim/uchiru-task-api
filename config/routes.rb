Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  namespace :api do
    namespace :v1 do
      resources :students, only: [ :create ]
      delete "students/:user_id", to: "students#destroy"
      resources :schools, only: [] do
        resources :classes, controller: :school_classes, only: :index do
          resources :students, only: :index
        end
      end
    end
  end
end
