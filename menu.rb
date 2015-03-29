require_relative './lib/company/company'
require_relative './lib/company/team'
require_relative './lib/employees/developer'
require_relative './lib/employees/tester'
require_relative './lib/employees/employee'
require_relative './lib/employees/manager'


class Menu

private
	
	def add_employee
		puts "\nNew employee menu."
		print "Enter name of the employee: "
		emp_name=gets.chomp
		print "Enter lastname of the employee: "
		emp_lastname=gets.chomp
		print "Enter id of the employee: "
		emp_id=gets.chomp
		print "Enter job description of the employee (developer, tester, manager): "
		job=gets.chomp
		case job
		when "developer"
			@company.add_employee(Developer.new(emp_name,emp_lastname,emp_id))
			puts "New Developer: #{emp_name} #{emp_lastname} id: #{emp_id} added!"
		when "tester"
			@company.add_employee(Tester.new(emp_name,emp_lastname,emp_id))
			puts "New Tester: #{emp_name} #{emp_lastname} id: #{emp_id} added!"
		when "manager"
			@company.add_employee(Manager.new(emp_name,emp_lastname,emp_id))
			puts "New Menager: #{emp_name} #{emp_lastname} id: #{emp_id} added!"
		end
	end

	def add_project
		puts "\nNew team and project menu."
		print "Enter project name: "
		@company.add_project_and_team(Team.new(project_name))	
	end

	def select_employee
		puts "\nEnter employee id: "
		emp_id=gets.chomp
		emp_id=emp_id.to_i!
		employee=@company.find_employee(emp_id)
	end

	def select_team
		puts "\nEnter project name: "
		project_name=gets.chomp
		team=@company.find_team_by_project(project_name)
		
	end

	def remove_project
		puts "\nEnter project name: "
		project_name=gets.chomp
		@company.remove_project(project_name)
	end

	def remove_finished
		@company.remove_finished
		puts "\nFinished projects removed! "
	end

	def write_comp_menu
		print "\n"
		puts "#{@company.company_name} main menu. Enter one of the commands: "
		puts "\"Add employee\" - if you want to enter a new employee"
		puts "\"Add project\" - if you want to create a project and a team for that project"
		puts "\"Select employee\" - if you want to select an employee"
		puts "\"Select team\" - if you want to select a team"
		puts "\"Remove project\" - if you want to remove a project"
		puts "\"Remove finished\" - clean up and remove finished projects"
		print "\nYour command: "
		command=gets.chomp
		command.downcase!
		execute_comp_comm(command)
	end

	def execute_comp_comm(command)
		case command
			when "add employee"
				add_employee
			when "add project"
				add_project
			when "select employee"
				select_employee
			when "select team"
				select_team
			when "remove project"
				remove_project
			when "remove finished"
				remove_finished
			else 
				return
			end
		write_comp_menu
	end

	def write_dev_menu
		puts "\n\nDeveloper ( #{emp.first_name} #{emp.last_name} id: #{emp.id} ) enter one of the commands: "
		puts "\"Add language\" - if you want to add a programming language to your skills "
		puts "\"List languages\" if you want to list programming languages in your skills"
		puts "\"Write code \" - write some code"
		puts "\"Calculate pay\" - if you want to see your salary"
		print "Enter your command: "
		command=gets.chomp
		command.downcase!
		execute_dev_comm(command)
	end

	def execute_dev_comm(command)
		case command
		when "add langauge"
			print "Enter the name of the programming language: "
			lang=gets.chomp
			emp.add_language(lang)
			puts "#{lang} added to the known skills"
		when "list languages"
			emp.list_languages
		when "write code"
			print "Enter the amount of code you have to write: "
			amount=gets.chomp
			amount.to_i!
			puts "You have written #{emp.write_code(amount)} lines of code."
		when "calculate pay"
			print "You are currently earning  #{calculate_pay(@company)}$ at your comapny."
		when "exit"
			return
		else
			write_dev_menu
		end
	end


	def write_tester_menu
		puts "\n\nTester ( #{emp.first_name} #{emp.last_name} id: #{emp.id} ) enter one of the commands: "
		puts "\"Write test\" - write some tests. "
		puts "\"Calculate pay\" - if you want to see your salary"
		print "Enter your command: "
		command=gets.chomp
		command.downcase!
		execute_tester_comm(command)

	end


	def execute_tester_comm(command)
		case command
		when "write test"
			print "\nWhat kind of tests are you writing (automatic or manual): "
			type = gets.chomp
			type.downcase!
			print "How many tests are you writing:  "
			amount = gets.chomp
			amount.to_i!
			puts "You have managed to write #{emp.write_tests(amount,type) tests }"
		when "calculate pay"
			print "You are currently earning  #{calculate_pay(@company)}$ at your comapny."
		when "exit"
			return
		else
			write_tester_menu
		end
	end


	def write_man_menu
		puts "\n\nManager ( #{emp.first_name} #{emp.last_name} id: #{emp.id} ) enter one of the commands: "
		puts "\"Create sprints\" - if you want to create sprints "
		puts "\"Calculate pay\" - if you want to see your salary"
		print "Enter your command: "
		command=gets.chomp
		command.downcase!
		execute_man_comm(command)
	end


	def execute_man_comm(command)
		case command
		when "create sprints"
			print "Enter the name of the team for which you are creating sprints: "
			team_name=gets.chomp
			puts "You have created #{emp.create_sprints(@company.find_team_by_name(team_name))} sprints for team: \"#{team_name}\""
		when "calculate pay"
			print "You are currently earning  #{calculate_pay(@company)}$ at your comapny."
		when "exit"
			return
		else
			write_man_menu
		end
	end



public

	def initialize
		@company=nil
		@emp=nil
	end
	def company_menu(company=nil)

		puts "Welcome to Ruby Company!"
		if company.nil?
			puts "Create your company!"
			print "Enter your comapny name: "
			company_name=gets.chomp
			@company=Company.new(company_name)
			puts "#{@company.company_name} was created!"
		end
		write_comp_menu
	end

	def developer_menu(developer)
		write_dev_menu
	end

	def manager_menu(manager)
		write_tester_menu

	end

	def tester_menu(tester)
		write_man_menu
	end

end