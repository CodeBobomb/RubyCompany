require_relative '../employees/employee.rb'
require_relative '../employees/manager.rb'
require_relative '../employees/employee.rb'	

class Team

private
# code_lines - in real case, number of lines of code is not objective, you can use number of stories in sprint
# number of tests makes sense
	def set_requirements(sprints,code_lines,tests)
		@goal["sprints"]=sprints
		@goal["code_lines"]=code_lines
		@goal["tests"]=tests
	end

	def update_goal(sprints,code_lines,tests)
		@goal["sprints"]-=sprints
		@goal["code_lines"]-=code_lines
		@goal["tests"]-=tests
	end

public
	attr_reader :developers
	attr_reader :manager
	attr_reader :name
	attr_reader :goal
	attr_reader :project_name
	attr_reader :team_name

	def initialize(project_name,team_name="")
		@project_name=project_name
		@team_name=project_name + " team" if team_name!="team"
		@team_name=team_name unless team_name!="team"
		@manager=nil
		@developers=[]
		@testers=[]
		@goal={"sprints" => 0, "code_lines" => 0, "tests" => 0 }
	end

	def assign_manager(manager)
		@manager=manager
	end

	def add_developer(developer)
		@developers << developer
	end

	def add_tester(tester)
		@testers << tester
	end

	def number_of_members
		@developers.length + @testers.length
	end

	def goal_reached?
		@goal["sprints"]==0 && @goal["code_lines"]==0 && @goal["tests"]==0
	end

	def set_goal_for_project
		sprint=@manager.create_sprints(self)
		code_lines=@developers.length*(1000+rand(10))
		tests=@testers.length*(100+rand(50))
		set_requirements(sprints,code_lines,tests)
	end

	def do_sprint(sprints=1)
		written_code=0
		written_tests=0
		for i in 0..1
			@developers.each { |dev| written_code+=dev.write_code(@goal[1]/@developers.length) }
			@testers.each { |tester| written_tests+=tester.write_tests(@goal[2]/@testers.length) }
		end

		update_goal(sprints, written_code,written_tests)
		[sprints,written_code,written_tests]
	end

	def add_member(employee)
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

	def has_member?(employee_id)
		@manager.id==employee_id || @developers.select { |dev| dev.id==employee_id }[0] || @testers.select { |tester| tester.id==employee_id }
	end

end