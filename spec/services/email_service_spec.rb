require 'rails_helper'

RSpec.describe 'Email Service', type: :request do
  before :each do 
    seed_test_db
  end

  it "successfully sends confirmation email" do
    json_body = File.read(Rails.root.join('spec/fixtures/email_fixture.json'))
    stub_request(:put, "https://powerful-garden-65640.herokuapp.com/api/v1/email").
    with(
      body: "{\"to\":\"test@example.com\",\"subject\":\"Project Feedback\",\"content\":\"Your feedback for #{@project_1.project_template.name} has been submitted!\"}",
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'Content-Type'=>'application/json',
     'User-Agent'=>'Faraday v1.4.1'
      }).
    to_return(status: 200, body: json_body, headers: {})

    EmailService.send_confirmation("test@example.com", @project_1.id)
    json = JSON.parse(json_body, symbolize_names:true)
    expect(json[:data]).to eq "Email Sent Successfully"
    
  end
end