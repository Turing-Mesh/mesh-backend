require 'rails_helper'

RSpec.describe 'Student comments request', type: :request do
  describe 'a single students project' do
    before :each do
      seed_test_db
    end
    describe 'happy path' do
      it "updates the student comments when no prior comments exist and given valid data" do
        @project_2.update(student_comments: nil)
        expect(@project_2.student_comments).to be_nil

        params = {student_comments: ["Me-Mow ate my homework. I swear!", "I am adding another note"]}
        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
        patch "/api/v1/students/#{@student.id}/student_projects/#{@project_2.id}", headers: headers, params: params.to_json

        json = JSON.parse(response.body, symbolize_names:true)

        @project_2.reload
        expect(@project_2.student_comments.split("/2C/")).to eq(params[:student_comments])
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
      end

      it "updates the student comments with new comment if value already exists" do
        expect(@project_2.student_comments).to_not be_nil
        previous_comment = @project_2.student_comments

        params = {student_comments: ["Me-Mow ate my homework. I swear!"]}
        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
        patch "/api/v1/students/#{@student.id}/student_projects/#{@project_2.id}", headers: headers, params: params.to_json

        json = JSON.parse(response.body, symbolize_names:true)

        @project_2.reload
        expect(@project_2.student_comments).to_not eq(previous_comment)
        expect([@project_2.student_comments]).to eq(params[:student_comments])
        expect(response).to be_successful
      end

      it "updates the student comments with multiple comments and accepts new line" do
        expect(@project_2.student_comments).to_not be_nil
        previous_comment = @project_2.student_comments

        params = {student_comments: ["Me-Mow ate my homework. I swear!"]}
        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
        patch "/api/v1/students/#{@student.id}/student_projects/#{@project_2.id}", headers: headers, params: params.to_json

        json = JSON.parse(response.body, symbolize_names:true)

        @project_2.reload
        expect(@project_2.student_comments).to_not eq(previous_comment)
        expect([@project_2.student_comments]).to eq(params[:student_comments])
        expect(response).to be_successful
      end

      it "updates the student comments and removes existing comment if value request is nil" do
        expect(@project_2.student_comments).to_not be_nil
        previous_comment = @project_2.student_comments

        params = {student_comments: nil}
        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
        patch "/api/v1/students/#{@student.id}/student_projects/#{@project_2.id}", headers: headers, params: params.to_json

        json = JSON.parse(response.body, symbolize_names:true)

        @project_2.reload
        expect(@project_2.student_comments).to_not eq(previous_comment)
        expect(@project_2.student_comments).to be_nil
        expect(response).to be_successful
      end
    end

    describe 'edge case' do
      it "returns an error when the student id is invalid" do
        id = 201
        params = {student_comments: ["Me-Mow ate my homework. I swear!"]}
        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}

        patch "/api/v1/students/#{id}/student_projects/#{@project_2.id}", headers: headers, params: params.to_json

        expect(response).to_not be_successful
        json = JSON.parse(response.body, symbolize_names:true)

        expect(response.status).to eq(404)
        expect(json[:error]).to be_a(String)
        expect(json[:error]).to eq("Couldn't find StudentProject")
      end

      it "returns an error when the student id is not an integer" do
        id = "puppies"
        params = {student_comments: ["Me-Mow ate my homework. I swear!"]}
        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}

        patch "/api/v1/students/#{id}/student_projects/#{@project_2.id}", headers: headers, params: params.to_json

        expect(response).to_not be_successful
        json = JSON.parse(response.body, symbolize_names:true)

        expect(response.status).to eq(400)
        expect(json[:error]).to be_a(String)
        expect(json[:error]).to eq("String not accepted as id")
      end

      it "returns an error when the project id is invalid" do
        id = 201
        params = {student_comments: ["Me-Mow ate my homework. I swear!"]}
        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}

        patch "/api/v1/students/#{@student.id}/student_projects/#{id}", headers: headers, params: params.to_json

        expect(response).to_not be_successful
        json = JSON.parse(response.body, symbolize_names:true)

        expect(response.status).to eq(404)
        expect(json[:error]).to be_a(String)
        expect(json[:error]).to eq("Couldn't find StudentProject")
      end

      it "returns an error when the project id is not an integer" do
        id = "puppies"
        params = {student_comments: ["Me-Mow ate my homework. I swear!"]}
        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}

        patch "/api/v1/students/#{@student.id}/student_projects/#{id}", headers: headers, params: params.to_json

        expect(response).to_not be_successful
        json = JSON.parse(response.body, symbolize_names:true)

        expect(response.status).to eq(400)
        expect(json[:error]).to be_a(String)
        expect(json[:error]).to eq("String not accepted as id")
      end

      it "returns an error when the project id does not belong to the student id" do
        student_2 = create(:user, role: 0)
        expect(student_2.student_projects.empty?).to eq(true)
        expect(@project_2.student_id).to_not eq(student_2.id)

        params = {student_comments: ["Me-Mow ate my homework. I swear!"]}
        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}

        patch "/api/v1/students/#{student_2.id}/student_projects/#{@project_2.id}", headers: headers, params: params.to_json

        expect(response).to_not be_successful
        json = JSON.parse(response.body, symbolize_names:true)

        expect(response.status).to eq(404)
        expect(json[:error]).to be_a(String)
        expect(json[:error]).to eq("Couldn't find StudentProject")
      end

      it "returns an error when the student_comments attribute is missing" do
        params = {nope: ["Me-Mow ate my homework. I swear!"]}
        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}

        patch "/api/v1/students/#{@student.id}/student_projects/#{@project_2.id}", headers: headers, params: params.to_json

        json = JSON.parse(response.body, symbolize_names:true)

        expect(response.status).to eq(400)
        expect(json[:error]).to be_a(String)
        expect(json[:error]).to eq("Required parameter missing")
      end
    end
  end
end
