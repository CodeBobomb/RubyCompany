require_relative "../../helpers/company_creator"

describe "configuring team goals for existing team " do
before :all do
	@company=CompanyCreator.create_company
	@team=@company.teams[0]
end
context "adding valid values " do
it "stories=5, tasks=10, tests=30 " do
	@team.set_goal_for_sprint(5,10,30)
	expect(@team.goal).to eql({"stories" => 5, "tasks" => 10, "tests" => 30 })
end
end
context "adding invalid values " do
it "stories=-1, tasks=-1, tests=-1" do
	expect(@team.set_goal_for_sprint(-1,-1,-1)).to raise_error
end
end
end