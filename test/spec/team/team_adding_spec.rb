require_relative "../../helpers/company_creator"

describe "Adding a team/project to existing company " do
	
	before :all do
		@company=CompanyCreator.create_company
	end

	context "Add new team/project: Testing" do
		let(:team) { Team.new("Testing") }
		it "team added" do
			@company.add_team_and_project(team)
			expect( @company.teams.select { |team| team.project_name == "Testing" } ).to be_truthy
		end
	end

	context "Add existing team/project: Android" do
		let(:team) { @company.teams[0] }
		it "team adding failed" do
			expect(@company.add_team_and_project(team)).to raise_error
		end
	end
end