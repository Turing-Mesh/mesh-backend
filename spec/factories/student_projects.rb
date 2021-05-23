FactoryBot.define do
  factory :student_project do
    instructor_comments { Faker::Movies::HitchhikersGuideToTheGalaxy.quote }
    student_comments { Faker::TvShows::RickAndMorty.quote }
    student_id {nil}
    project_template_id {nil}
  end
end
