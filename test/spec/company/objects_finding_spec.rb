require_relative "../../helpers/company_creator"


describe " finding employees/teams/projects in company object " do 
before do
	@company=CompanyCreator.create_company
end
context "finding employee by id " do
context "existing id "
it  "id: 1 " do
	emp=@company.find_employee(1)
	expect(emp.id).to eql(1)
end
end
context "nonexisting id: "
it "id: 123 " do
	emp=@company.find_employee(123)
	expect(emp.nil?).to be_truthy
end
end
context "finding team by team name " do
context "existing team " do
it "team name: AndroidDevTeam "
	team=@company.find_team_by_name("AndroidDevTeam")
	expect(team.team_name).to eql("AndroidDevTeam")
end
end
context "nonexisting team " do
it "team: AtlantTeam"
	team=@company.find_team_by_name("AtlantTeam")
	expect(team.nil?).to be_truthy
end
end
end
context "finding team by project name " do
context "existing project " do
it "project: Android "
	team=@company.find_team_by_project("Android")
	expect(team.project_name).to eql("Android")
end
end
context "nonexisting project " do
it "project: .NET"
	team=@company.find_team_by_project(".NET")
	expect(team.nil?).to be_truthy
end
end
context "finding active projects of a member " do
context "member of a team "
it "id: 1" do
	teams=@company.member_of_teams(1)
	expect(teams[0].has_member?(1)).to be_truthy
end
end
context "not a team member "
before :all do
	@company.add_employee(Developer.new("John","Doe",444))
end
it "id: 123" do
	teams=@company.member_of_teams(444)
	expect(teams[0].nil?).to be_truthy
end
end
end