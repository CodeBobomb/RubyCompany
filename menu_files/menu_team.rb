require_relative '../lib/company/company'
require_relative '../lib/company/team'
require_relative '../lib/employees/developer'
require_relative '../lib/employees/tester'
require_relative '../lib/employees/employee'
require_relative '../lib/employees/manager'

class Menu
private	

	
	def write_team_menu
		puts "\n\nTeam #{team.team_name} project #{team.project_name} enter one of the commands: "
		puts "\"assing manager\" - assing a manager to your team"
		puts "\"add developer\" - add a developer to your team"
		puts "\"add tester \" - add a tester to your team"
		puts "\"set goal\" - set goals for the team"
		puts "\"do sprint\" - perform sprints" 
		command=gets.chomp
		command.downcase!
		execute_team_comm(command)
	end

	def execute_team_comm(command)
		case command
		when "assign manager"
			print "Enter id of the manager you want to assign: "
			emp_id=gets.chomp
			emp_id.to_i!
			manager=@comapny.find_employee(emp_id)
			@team.assign_manager(manager)
			puts "Manager #{manager.first_name} #{manager.last_name} id:#{manager.id} assigned as the manager of team #{@team.team_name}"
		when "add developer"
			print "Enter id of the developer you want to add: "
			emp_id=gets.chomp
			emp_id.to_i!
			dev=@comapny.find_employee(emp_id)
			@team.add_developer(dev)
			puts "Developer #{dev.first_name} #{dev.last_name} id:#{dev.id} assigned as the manager of team #{@team.team_name}"
		when "add tester"
			print "Enter id of the tester you want to add: "
			emp_id=gets.chomp
			emp_id.to_i!
			tester=@comapny.find_employee(emp_id)
			@team.add_developer(tester)
			puts "Tester #{tester.first_name} #{tester.last_name} id:#{tester.id} assigned as the manager of team #{@team.team_name}"
		when "set goal"
			@team.set_goal_for_project
			puts "Goal set with #{@team.goal["sprints"]} sprints, #{@team.goal["code_lines"]} code lines, #{@team.goal[tests]} tests in plan"
		when "do sprint"
			print "Enter number of sprints you want to do: "
			num_sprints=gets.chomp
			num_sprints.to_i!
			work_done=@team.do_sprint(num_sprints)
			puts "Team has done #{work_done[0]} sprints, wrote #{work_done[1]} lines of code and performed #{work_done[2]} tests. "
		when "exit"
			return
		else
			write_tester_menu
		end
	end


public

	def team_menu(team)
		write_team_menu
	end

end