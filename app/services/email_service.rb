class EmailService 
  def self.send_confirmation(email, project_id)
    project = StudentProject.find(project_id).project_template
     response = Faraday.put("https://powerful-garden-65640.herokuapp.com/api/v1/email") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = {to: "#{email}", 
                      subject: "Project Feedback", 
                      content: "Your feedback for #{project.name} has been submitted!"}.to_json

     end
    data = response.body
    JSON.parse(data, symbolize_names: true)
  end
end