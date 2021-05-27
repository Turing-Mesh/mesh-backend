require 'rails_helper'

RSpec.describe 'Instructor feedback request', type: :request do
  describe 'for a student project and related feedback' do
    before :each do
      seed_test_db
    end
    describe 'happy path' do
      it "it creates the student project and feedback records when given valid data" do
        project_4 = StudentProject.where(project_template_id: @project_template_4.id).where(student_id: @student.id)
        expect(project_4.empty?).to be_truthy

        params = {
                    "project_template_id": @project_template_4.id,
                    "instructor_comments": "Some real good stuff.",
                    "project_feedback": [
                      {
                        "rubric_template_category_id": @project_template_4.rubric_template_categories.first.id,
                        "score": 4.0,
                        "comment": "Your awesomeness is shining through! It's so bright I need some shades."
                      },
                      {
                        "rubric_template_category_id": @project_template_4.rubric_template_categories.second.id,
                        "score": 3.0,
                        "comment": "Keep up the good work!"
                      },
                      {
                        "rubric_template_category_id": @project_template_4.rubric_template_categories.third.id,
                        "score": 2.5,
                        "comment": "Some stuff and some things"
                      },
                      {
                        "rubric_template_category_id": @project_template_4.rubric_template_categories.fourth.id,
                        "score": 3.0,
                        "comment": nil
                      },
                      {
                        "rubric_template_category_id": @project_template_4.rubric_template_categories.last.id,
                        "score": 3.0,
                        "comment": "Some more stuff"
                      }
                    ]
                  }

    json_body = File.read(Rails.root.join('spec/fixtures/email_fixture.json'))
    stub_request(:put, "https://powerful-garden-65640.herokuapp.com/api/v1/email").
    with(
      body: "{\"to\":\"#{@student.email}\",\"subject\":\"Project Feedback\",\"content\":\"Your feedback for #{@project_template_4.name} has been submitted!\"}",
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'Content-Type'=>'application/json',
     'User-Agent'=>'Faraday v1.4.1'
      }).
    to_return(status: 200, body: json_body, headers: {})

        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
        post "/api/v1/instructors/#{@instructor.id}/students/#{@student.id}/student_projects", headers: headers, params: params.to_json

        json = JSON.parse(response.body, symbolize_names:true)

        expect(project_4.first).to be_a(StudentProject)
        expect(response).to be_successful
        expect(json).to be_a(Hash)
        expect(json[:data]).to be_a(Hash)
        check_hash_structure(json[:data], :id, String)
        check_hash_structure(json[:data], :type, String)
        expect(json[:data][:type]).to eq("projects")
        expect(json[:data][:attributes]).to be_a(Hash)
        check_hash_structure(json[:data][:attributes], :mod, String)
        check_hash_structure(json[:data][:attributes], :student_projects, Array)
        check_hash_structure(json[:data][:attributes][:student_projects].first, :project_feedback, Array)
        expect(json[:data][:attributes][:student_projects].first[:project_feedback].count).to eq(5)

        feedback_id = json[:data][:attributes][:student_projects].first[:project_feedback].first[:id]
        expect(ProjectFeedback.find(feedback_id).rubric_template_category_id).to eq(params[:project_feedback].first[:rubric_template_category_id])
      end
    end
  end
end
