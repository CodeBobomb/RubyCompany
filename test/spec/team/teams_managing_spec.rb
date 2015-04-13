require_relative "../../helpers/company_creator"

describe "managing projects in company " do
	
	before :each do
		@company=CompanyCreator.create_company
	end

	context "Remove project: Android" do
		it "project removed" do
			@company.remove_project("Android")
			expect((@company.find_team_by_project("Android")).nil?).to be_truthy
		end
	end

	context "Complete and remove project: Android" do
		before do
			@company.teams[0].do_sprint(5)
		end
		it "project completed and removed" do
			@company.remove_finished_projects
			expect((@company.find_team_by_project("Android")).nil?).to be_truthy
		end
	end
end