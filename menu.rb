require_relative './lib/company/company'
require_relative './lib/company/team'
require_relative './lib/employees/developer'
require_relative './lib/employees/tester'
require_relative './lib/employees/employee'
require_relative './lib/employees/manager'
require_relative './menu_files/menu_comp'
require_relative './menu_files/menu_man'
require_relative './menu_files/menu_dev'
require_relative './menu_files/menu_tester'
require_relative './menu_files/menu_team'
require_relative './menu_files/menu_emp'


class Menu

private

	
	def init
		@company=Company.new("RubyCompany")
		dev=Developer.new("John","Doe",1)
		tester=Tester.new("John","Toe",2)
		man=Manager.new("John","Moe",3)
		tmp=Team.new("Testing")
		tmp.add_developer(dev)
		tmp.add_tester(tester)
		tmp.assign_manager(man)

		@company.add_team_and_project(tmp)
		@company.add_employee(dev)
		@company.add_employee(tester)
		@company.add_employee(man)

	end


public

	def initialize
		@company=nil		
		@emp=nil
		@team=nil
		init
	end
	

end