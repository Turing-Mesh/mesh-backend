require 'rails_helper'

describe 'Instructor Students request' do
  before :each do
    @instructor = create(:user, role: 1)
    @student_1 = create(:user, role: 0)
    student_2 = create(:user, role: 0)

    instructor_student_1 = create(:instructor_student, instructor_id: @instructor.id, student_id: @student_1.id)
    instructor_student_2 = create(:instructor_student, instructor_id: @instructor.id, student_id: student_2.id)
    @student_1_profile = create(:user_profile, first_name: "Henry" ,user_id: @student_1.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
    @student_2_profile = create(:user_profile, first_name: "Henry" , last_name: "Fuller",  user_id: student_2.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
    instructor_profile = create(:user_profile, user_id: @instructor.id, current_mod: "2")
  end

  let!(:body) { {
    search_term:  { 
      first_name: "#{@student_1_profile.first_name}"
     }
     
    }}

    
  describe 'happy path' do
    it "returns one or more students matching the first name request" do
      post api_v1_instructor_instructor_students_search_path(@instructor.id), headers: headers, params: body, as: :json
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data].class).to eq Array
      expect(json[:data].first.keys).to eq [:id, :type, :attributes]
      expect(json[:data].first[:attributes].keys).to eq  [:user_id, :first_name, :last_name, :current_cohort]
      expect(json[:data].first[:attributes][:first_name]).to eq @student_1_profile.first_name
    end

    let!(:partial_body) { {
      search_term:  { 
        first_name: "Hen"
       }
       
      }}

      it "returns one or more students matching the partial first name request" do
        post api_v1_instructor_instructor_students_search_path(@instructor.id), headers: headers, params: partial_body, as: :json
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:data].class).to eq Array
        expect(json[:data].first.keys).to eq [:id, :type, :attributes]
        expect(json[:data].first[:attributes].keys).to eq  [:user_id, :first_name, :last_name, :current_cohort]
        expect(json[:data].first[:attributes][:first_name]).to eq @student_1_profile.first_name
      end

      let!(:partial_last_body) { {
        search_term:  { 
          last_name: "Full"
         }
         
        }}
  
        it "returns one or more students matching the partial last name request" do
          post api_v1_instructor_instructor_students_search_path(@instructor.id), headers: headers, params: partial_last_body, as: :json
          json = JSON.parse(response.body, symbolize_names: true)
          expect(json[:data].class).to eq Array
          expect(json[:data].first.keys).to eq [:id, :type, :attributes]
          expect(json[:data].first[:attributes].keys).to eq  [:user_id, :first_name, :last_name, :current_cohort]
          expect(json[:data].first[:attributes][:last_name]).to eq @student_1_profile.last_name
        end

    let!(:last_name_body) {{
      search_term:  { 
        last_name: "#{@student_1_profile.last_name}"
       }
      }}

    it "returns one or more students matching the last name request" do
      post api_v1_instructor_instructor_students_search_path(@instructor.id), headers: headers, params: last_name_body, as: :json
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data].class).to eq Array
      expect(json[:data].first.keys).to eq [:id, :type, :attributes]
      expect(json[:data].first[:attributes].keys).to eq  [:user_id, :first_name, :last_name, :current_cohort]
      expect(json[:data].first[:attributes][:last_name]).to eq @student_1_profile.last_name
    end
    let!(:full_name_body) { {
      search_term: { 
        first_name: "#{@student_1_profile.first_name}",
        last_name: "#{@student_1_profile.last_name}"
       }
      }}

    it "returns one or more students matching the full name request" do
      post api_v1_instructor_instructor_students_search_path(@instructor.id), headers: headers, params: full_name_body, as: :json
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data].class).to eq Array
      expect(json[:data].first.keys).to eq [:id, :type, :attributes]
      expect(json[:data].first[:attributes].keys).to eq  [:user_id, :first_name, :last_name, :current_cohort]
      expect(json[:data].first[:attributes][:first_name]).to eq @student_1_profile.first_name
      expect(json[:data].first[:attributes][:last_name]).to eq @student_1_profile.last_name
    end
  end

  describe "sad path" do
    it "" do
      
    end
  end
end
