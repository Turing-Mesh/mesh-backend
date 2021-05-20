require 'rails_helper'

RSpec.describe 'Student comments request', type: :request do
  describe 'a single students project' do
    before :each do
      seed_test_db
    end
    describe 'happy path' do
      it "updates the student comments when no prior comments exist and given valid data" do
        mod = 2
        @project_2.update(student_comments: nil)
        expect(@project_2.student_comments).to be_nil

        params = {student_comments: "Me-Mow ate my homework. I swear!"}
        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
        patch "/api/v1/students/#{@student.id}/student_projects/#{@project_2.id}", headers: headers, params: params.to_json

        json = JSON.parse(response.body, symbolize_names:true)

        @project_2.reload
        expect(@project_2.student_comments).to eq(params[:student_comments])
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
        mod = 2
        expect(@project_2.student_comments).to_not be_nil
        previous_comment = @project_2.student_comments

        params = {student_comments: "Me-Mow ate my homework. I swear!"}
        headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
        patch "/api/v1/students/#{@student.id}/student_projects/#{@project_2.id}", headers: headers, params: params.to_json

        json = JSON.parse(response.body, symbolize_names:true)

        @project_2.reload
        expect(@project_2.student_comments).to_not eq(previous_comment)
        expect(@project_2.student_comments).to eq(params[:student_comments])
        expect(response).to be_successful
      end

      it "updates the student comments and removes existing comment if value request is an empty string" do
        mod = 2
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
  end
end
