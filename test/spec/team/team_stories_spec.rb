require_relative "../../helpers/company_creator"

describe "Doing created stories " do
	
	before :each do
		@company=CompanyCreator.create_company
		@team=@company.teams[0]
	end

	context "Do 2 stories, 14 tasks and 20 tests with team: Android" do
		let(:workdone) { @team.do_sprint(2) }
		it "sprint done" do
		    expect(workdone).to match_array([2,14,20])
		end
	end

	context "Update manager completed-stories after doing the sprint" do
		it "manager completed-stories updated" do
			@team.do_sprint(2) 
			manager=@team.manager
			expect(manager.completed_stories).to eql(2)
		end
	end
	context "Update developer completed-tasks after doing the sprint" do
		it "manager completed-tasks updated" do
			@team.do_sprint(2) 
			dev=@team.developers[0]
			expect(dev.tasks_competed).to eql(14)
		end
	end

	context "Update tester written-tests after doing the sprint" do
		it "tester written-tests update" do
			@team.do_sprint(2)
			tester=@team.testers[0]
			expect(tester.tests_written).to eql(20)
		end
	end

	context "Complete invalid number (-1) of stories" do
		it "doing stories failed" do
			expect{ @team.do_sprint(-1) }.to raise_error
		end
	end

	context "Finish a full sprint (5 stories) for project Android" do
		it "team goal reached" do
			@team.do_sprint(5)
			expect(@team.goal_reached?).to be_truthy
		end
	end
end
