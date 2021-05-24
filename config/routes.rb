Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :students, only: [] do
        resources :student_projects, only: [:index, :update], as: 'projects'
      end

      resources :instructors, only: [] do
        post '/students/search', to: 'instructor_students#search', as: 'students_search'
        resources :students, only: :index, controller: :instructor_students do
          resources :project_templates, only: :index
        end
      end
    end
  end
end
