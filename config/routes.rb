Rails.application.routes.draw do
  root 'welcome#show'
  namespace :api do
    namespace :v1 do
      resources :students, only: [] do
        resources :student_projects, only: :index, as: 'projects'
      end
    end
  end
end
