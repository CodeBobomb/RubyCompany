require_relative "../../lib/company/company_creator"


describe " finding employees/teams/projects in company object " do 
	before do
		@company=CompanyCreator.create_company
	end

	context "finding employee " do

		it  "by existing id " do
			emp=@company.find_employee(1)
			expect(emp.id).to eql(1)
		end

		it "by nonexisting id " do
			emp=@company.find_employee(123)
			expect(emp.nil?).to be_truthy
		end
	end

	context "finding team by team name " do

		it "existing team " do
			team=@company.find_team_by_name("AndroidDevTeam")
			expect(team.team_name).to eql("AndroidDevTeam")
		end

		it "nonexisting team " do
			team=@company.find_team_by_name("AtlantTeam")
			expect(team.nil?).to be_truthy
		end
	end

	context "finding team by project name " do

		it "existing team " do
			team=@company.find_team_by_project("Android")
			expect(team.project_name).to eql("Android")
		end

		it "nonexisting team " do
			team=@company.find_team_by_project(".NET")
			expect(team.nil?).to be_truthy
		end
	end

	context "finding active projects of an employee (id=1) " do

		it " member of a team" do
			teams=@company.member_of_teams(1)
			expect(teams[0].has_member?(1)).to be_truthy
		end

		it " not a member of a team" do
			teams=@company.member_of_teams(123)
			expect(teams[0].nil?).to be_truthy
		end
	end
end