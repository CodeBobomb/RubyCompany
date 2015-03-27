require_relative '../employees/employee.rb'
require_relative '../employees/manager.rb'
require_relative '../employees/employee.rb'	

class Team

	attr_reader :developers
	attr_reader :manager
	attr_reader :name
	attr_reader :goal

	def initialize(team_name)
		@name=name
		@manager=nil
		@developers=[]
		@testers=[]
		@goal=nil
	end

	def set_goal_for_project(sprints,code_lines,tests)
		@goal=[sprints,code_lines,tests]
	end

	def assign_manager(manager)
		@manager=manager;
	end

	def add_developer(developer)
		@developers << developer
	end

	def add_tester(tester)
		@testers << tester
	end

	def add_member(employee_id)
		case employee.class.name		
		when "Developer"
			add_developer(employee)
		when "Tester"
			add_tester(employee)
		when "Manager"
			assign_manager(employee)
		else
			puts "nope"
		end
	end

	def is_member?(employee_id)
		@manager.id==employee_id || @developers.bsearch { |dev| dev.id==employee_i? } || @testers.bsearch { |tester| tester.id==employee_id}
	end

end