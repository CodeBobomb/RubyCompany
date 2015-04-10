require_relative "../../helpers/company_creator"

describe "adding a team/project to existing company " do
before :all do
	@company=CompanyCreator.create_company
end
context " adding new team/project: Testing" do
	let(:team) { Team.new("Testing") }
it " adds via add_team_and_project method" do
	@company.add_team_and_project(team)
	expect( @company.teams.select { |team| team.project_name == "Testing" } ).to be_truthy
end
end	
context "adding existing team/project" do
	let(:team) { @company.teams[0] }
it "adds existing team" do
	expect(@company.add_team_and_project(team)).to raise_error
end
end
end