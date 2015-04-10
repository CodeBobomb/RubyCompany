require_relative "../../helpers/company_creator"

describe "finding employees/teams/projects in company object" do 

	let(:company) { @company=CompanyCreator.create_company }

	context "Find employee by existing id: 1" do
		it  "found employee" do
			emp=company.find_employee(1)
			expect(emp.id).to eql(1)
		end
	end

	context "Find employee by non-existing id: 123" do
		it "did not find employee" do
			emp=company.find_employee(123)
			expect(emp.nil?).to be_truthy
		end
	end

	context "Find team by existing team: AndroidDevTeam" do
		it "found team" do
			team=company.find_team_by_name("AndroidDevTeam")
			expect(team.team_name).to eql("AndroidDevTeam")
		end
	end

	context "Find team by non-existing team: AtlantTeam" do
		it "did not found team" do
			team=company.find_team_by_name("AtlantTeam")
			expect(team.nil?).to be_truthy
		end
	end

	context "Find team by existing project: Android" do
		it "found project" do
			team=company.find_team_by_project("Android")
			expect(team.project_name).to eql("Android")
		end
	end

	context "Find team by non-existing project: .NET" do
		it "did not found project" do
			team=company.find_team_by_project(".NET")
			expect(team.nil?).to be_truthy
		end
	end

	context "Find active projects for team member with id: 1" do
		it "found projects" do
			teams=company.member_of_teams(1)
			expect(teams[0].has_member?(1)).to be_truthy
		end
	end

	context "Find active projects of member that is not part of the team: (John Doe)" do
		it "did not found active projects" do
			company.add_employee(Developer.new("John","Doe",444))
			teams=company.member_of_teams(444)
			expect(teams[0].nil?).to be_truthy
		end
	end
end