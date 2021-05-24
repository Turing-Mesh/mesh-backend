require 'rails_helper'

RSpec.describe ProjectTemplate, type: :model do
  describe "relationships" do
    it { should belong_to :rubric_template }
    it { should have_many :student_projects }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :mod }
    it { should validate_presence_of :program }
    it { should validate_presence_of :project_number }
    it { should define_enum_for :project_type }
  end

  describe "project templates project_types" do
    it "project template project_type can be paired" do
      rubric_template = create(:rubric_template)
      data = { name: "battleship", mod: "1", program: "BE", project_number: "2", project_type: 1, rubric_template_id: rubric_template.id}
      project_template = ProjectTemplate.create!(data)
      expect(project_template).to be_valid
      expect(project_template.project_type).to eq("paired")
      expect(project_template.paired?).to be_truthy
      expect(project_template.project_type).to_not eq("solo")
      expect(project_template.project_type).to_not eq("team")
    end

    it "project template project_type can be solo" do
      rubric_template = create(:rubric_template)
      data = { name: "enigma", mod: "1", program: "BE", project_number: "4", project_type: 0, rubric_template_id: rubric_template.id}
      project_template = ProjectTemplate.create!(data)
      expect(project_template).to be_valid
      expect(project_template.project_type).to eq("solo")
      expect(project_template.solo?).to be_truthy
      expect(project_template.project_type).to_not eq("paired")
      expect(project_template.project_type).to_not eq("team")
    end

    it "project template project_type can be team" do
      rubric_template = create(:rubric_template)
      data = { name: "little etsy shop", mod: "2", program: "BE", project_number: "3", project_type: 2, rubric_template_id: rubric_template.id}
      project_template = ProjectTemplate.create!(data)
      expect(project_template).to be_valid
      expect(project_template.project_type).to eq("team")
      expect(project_template.team?).to be_truthy
      expect(project_template.project_type).to_not eq("solo")
      expect(project_template.project_type).to_not eq("paired")
    end
  end

  describe "project template can be final or not final" do
    it "project template is not final by defaut" do
      rubric_template = create(:rubric_template)
      project_template = create(:project_template, rubric_template_id: rubric_template.id)
      expect(project_template).to be_valid
      expect(project_template.is_final).to eq(false)
      expect(project_template.is_final).to_not eq(true)
    end

    it "project template can be final" do
      rubric_template = create(:rubric_template)
      project_template = create(:project_template, rubric_template_id: rubric_template.id, is_final: true)
      expect(project_template).to be_valid
      expect(project_template.is_final).to eq(true)
      expect(project_template.is_final).to_not eq(false)
    end
  end

  describe "class methods" do
    describe "::get_project" do
      it "returns a project that matches a specific program and mod" do
        student = create(:user)
        profile = create(:user_profile, current_mod: "2", user_id: student.id)
        rubric_template = create(:rubric_template)
        project_1 = create(:project_template, mod: '2', project_number: '1', program: "BE", rubric_template_id: rubric_template.id)
        project_2 = create(:project_template, mod: '2', project_number: '1', program: "BE", rubric_template_id: rubric_template.id)
        project_3 = create(:project_template, mod: '3', project_number: '1', program: "BE", rubric_template_id: rubric_template.id)
        project_4 = create(:project_template, mod: '2', project_number: '1', program: "FE", rubric_template_id: rubric_template.id)
        project_number = "1"
        mod = "2"

        results = ProjectTemplate.get_project(profile.program, mod, project_number)

        expect(results.id).to eq(project_2.id)
        expect(results.program).to eq(profile.program)
        expect(results.project_number).to eq(project_number)
        expect(results.mod).to eq(mod)
        expect(results.id).to_not eq(project_1.id)
        expect(results.id).to_not eq(project_3.id)
        expect(results.id).to_not eq(project_4.id)
      end
    end
  end
end
