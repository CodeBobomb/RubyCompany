require_relative '../employees/employee.rb'
require_relative '../employees/manager.rb'
require_relative '../employees/employee.rb'	

class Team

private

	def set_requirements(stories,code_lines,tests)
		@goal["stories"]=stories
		@goal["tasks"]=code_lines
		@goal["tests"]=tests
	end

	def update_goal(stories,code_lines,tests)
		@goal["stories"]-=stories
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
		@goal={"stories" => 0, "tasks" => 0, "tests" => 0 }
		@goal_inc={"stories" => 0, "tasks" => 0, "tests" => 0 }
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

	def list_members
		puts "Manager: "
		puts "#{@manager.first_name} #{@manager.last_name} id: #{@manager.id}"
		puts "\nDevelopers:"
		@developers.each { |dev| puts "#{dev.first_name} #{dev.last_name} id: #{dev.id}" }
		puts "\nTesters: "
		@testers.each { |tester| puts "#{tester.first_name} #{tester.last_name} id: #{tester.id}"}
	end

	def number_of_members
		@developers.length + @testers.length
	end

	def goal_reached?
		@goal["stories"]==0 && @goal["tasks"]==0 && @goal["tests"]==0
	end

	def set_goal_for_sprint(stories,tasks,tests)
		set_requirements(stories,tasks,tests)
		@goal_inc = {"stories" => 1, "tasks" => (tasks/stories).ceil, "tests" => (tests/stories).ceil }
	end

	def do_sprint(stories=1)
		tasks_competed=0
		written_tests=0
		for i in 1..stories
			@developers.each { |dev| tasks_competed+=dev.complete_tasks(@goal_inc["tasks"]) }
			@testers.each { |tester| written_tests+=tester.write_tests(@goal_inc["tests"]) }
		end

		update_goal(stories, tasks_competed, written_tests)
		[sprints, tasks_competed, written_tests]
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
		@manager.id==employee_id || @developers.select { |dev| dev.id==employee_id }[0] || @testers.select { |tester| tester.id==employee_id }[0]
	end

end