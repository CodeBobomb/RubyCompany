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
require_relative './test/helpers/company_creator'

class Menu

private

	
	def init
		@company=CompanyCreator.create_company

	end


public

	def initialize
		@company=nil		
		@emp=nil
		@team=nil
		init
	end
	

end