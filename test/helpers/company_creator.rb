require_relative '../../lib/company/company'
require_relative '../../lib/company/team'
require_relative '../../lib/employees/developer'
require_relative '../../lib/employees/tester'
require_relative '../../lib/employees/employee'
require_relative '../../lib/employees/manager'


class CompanyCreator 

	def self.create_company
		company=Company.new("Ruby Company")
		id_counter=1

		for i in 1..4
			company.add_employee(Manager.new("John","Moe",id_counter))
			id_counter+=1
		end

		for i in 5..28
			company.add_employee(Developer.new("John","Doe",id_counter))
			id_counter+=1
		end

		for i in 29..40
			company.add_employee(Tester.new("John","Toe",id_counter))
			id_counter+=1
		end
		company.employees.each do |emp|
			case emp.class.name
			when "Manager"
				emp.wage=15
				emp.worktime=7
				emp.workdays=5
			when "Developer"
				emp.wage=9
				emp.worktime=8
				emp.workdays=5
			when "Tester"
				emp.wage=8
				emp.worktime=8
				emp.workdays=5
			end
		end
		team_1 = Team.new("Android","AndroidDevTeam")
		team_2 = Team.new("iOS", "SwiftTeam")
		team_3 = Team.new("Web","FrontEnders")
		managers = [1,4]
		developers = [5,11,12,20,21,31]
		testers = [31,33,34,35,36,40]

		company.add_team_and_project(team_1)
		company.add_team_and_project(team_2)
		company.add_team_and_project(team_3)

		company.assign_to_project("Android",1)
		company.assign_to_project("iOS",2)
		company.assign_to_project("Web",3)

		for i in developers[0] .. developers[1]
			company.assign_to_project("Android",i)
		end

		for i in developers[2] .. developers[2]
			company.assign_to_project("iOS",i)
		end

		for i in developers[3] .. developers[4]
			company.assign_to_project("Web",i)
		end


		for i in testers[0] .. testers[1]
			company.assign_to_project("Android",i)
		end

		for i in testers[2] .. testers[3]
			company.assign_to_project("iOS",i)
		end

		for i in testers[4] .. testers[5]
			company.assign_to_project("Web",i)
		end

		team_1.set_goal_for_sprint(5,35,50)
		team_2.set_goal_for_sprint(7,28,40)
		team_3.set_goal_for_sprint(10,50,75)

		company
	end

end