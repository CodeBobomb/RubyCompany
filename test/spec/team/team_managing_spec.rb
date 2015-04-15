require_relative "../../helpers/company_creator"
#
describe "Managing projects in company " do
	
	before :each do
		@company=CompanyCreator.create_company
	end

	context "Remove project: Android" do
		it "project removed" do
			@company.remove_project("Android")
			expect((@company.find_team_by_project("Android")).nil?).to be_truthy
		end
	end

	context "Complete Android project and remove finished projects" do
		it "project completed and removed" do
			team=@company.teams[0]
			team.do_sprint(5)
			@company.remove_finished_projects
			expect((@company.find_team_by_project("Android")).nil?).to be_truthy
		end
	end

	context "Assign new team member (tester id:35) to team: Android" do
		it "team member assigned" do
			@company.assign_to_project("Android",35)
			expect(@company.teams[0].has_member?(35)).to be_truthy
		end
	end

	context "Assigning new team member(tester id:35) to a nonexisting team: WindowsPhone" do
		it "team member assigning failed" do
			expect{ @company.assign_to_project("WindowsPhone",35) }.to raise_error
		end
	end

	context "Assingning a nonexisting employee (tester id:123) to team: Android" do
		it "team member assinging failed" do
			expect{ @company.assign_to_project("Android",123) }.to raise_error
		end
	end
end