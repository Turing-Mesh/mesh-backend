Rails.application.routes.draw do
  root 'welcome#show'
  namespace :api do
    namespace :v1 do
      resources :students, only: [] do
        resources :student_projects, only: [:index, :update], as: 'projects'
      end

      resources :instructors, only: [] do
        post '/instructor_students/search', to: 'instructor_students#show'
        resources :instructor_students, only: :index, as: 'students'
          resources :instructor_students, only: [] do
            resources :project_templates, only: %i[index]
          end
        end
      end
  end
end
