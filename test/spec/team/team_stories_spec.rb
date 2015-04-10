require_relative "../../helpers/company_creator"

describe "doing created stories " do
before :each	 do
	@company=CompanyCreator.create_company
	@team=@company.teams[0]
end

context "with valid values (2 stories) " do
before do
	@work_done=@team.do_sprint(2)
end
it "stories done: 2, completed tasks: 14, tests written: 20" do
    output_array=[@workdone[0],@workdone[1],@workdone[2]]
    expect(output_array).to match_array([2,14,20])
end
context "manager work updated "
it "manager completed 2 stories " do
	manager=@team.manager
	expect(manager.completed_stories).to eql(2)
end
end
context "developer work done "
it "developer completed 14 tasks " do
	dev=@team.developers[0]
	expect(dev.tasks_competed).to eql(14)
end
end
context "tester work done "
it "tester wrote 20 tests " do
	tester=@team.testers[0]
	expect(tester.tests_written).to eql(20)
end
end
context "with invalid values (-1 stories)" do
it "-1 stories,tasks,tests done" do
	expect(@team.do_sprint(-1)).to raise_error
end
end
context "full sprint run (5 stories)" do
before do
	@work_done=@team.do_sprint(5)
end
context "work done is correct "
it " work done is 5 stories, 35 tasks, and 50 tests" do
	expect(@work_done).to eql([5,35,50])
end
end
context "team goal is correct "
it " team fulfilled goal" do
	expect(@team.goal_reached?).to be_truthy
end
end
end
end
