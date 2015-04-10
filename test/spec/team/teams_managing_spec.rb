require_relative "../../helpers/company_creator"

describe "managing projects in company " do
before :each do
	@company=CompanyCreator.create_company
end
context "removing projects " do
it "removes project: Android " do
	@company.remove_project("Android")
	expect((@company.find_team_by_project("Android")).nil?).to be_truthy
end
end
context "removing finished projects " do
it "finishes and removes project: Android" do
	team=@company.teams[0]
	team.do_sprint(5)
	@company.remove_finished_projects
	expect((@company.find_team_by_project("Android")).nil?).to be_truthy
end
end
context "assigning new member to a project " do
	let(:emp) { Developer.new("John","Doe",123) }
before do
	@company.add_employee(emp)
end
it "assigns developer (id=123) to team Android " do
	@company.assign_to_project("Android",123)
	expect(@company.teams[0].has_member?(123)).to be_truthy
end
end
end