Rails.application.routes.draw do
  root 'welcome#show'
  namespace :api do
    namespace :v1 do
      resources :students, only: [] do
        resources :student_projects, only: :index, as: 'projects'
      end

      resources :instructors, only: [] do
        resources :instructor_students, only: :index , as: 'students'
        post '/instructor_students/search', to: 'instructor_students#show'
      end
    end
  end
end
