require_relative "../../helpers/company_creator"

describe "Configuring team goals for existing team" do
	
	before :all do
		@company=CompanyCreator.create_company
		@team=@company.teams[0]
	end

	context "Setting goals to: stories:5, tasks:10, tests:30" do
		it "goals set" do
			@team.set_goal_for_sprint(5,10,30)
			expect(@team.goal).to eql({"stories" => 5, "tasks" => 10, "tests" => 30 })
		end
	end

	context "Setting goals to invalid values: stories:-1, tasks:-1, tests:-1" do
		it "goals setting failed" do
			expect(@team.set_goal_for_sprint(-1,-1,-1)).to raise_error
		end
	end
end