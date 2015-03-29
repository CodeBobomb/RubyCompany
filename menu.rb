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

	def write_menu
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
		execute_command(command)
	end

	def execute_command(command)
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
		write_menu
	end


public
	def company_menu(company=nil)

		puts "Welcome to Ruby Company!"
		if company.nil?
			puts "Create your company!"
			print "Enter your comapny name: "
			company_name=gets.chomp
			@company=Company.new(company_name)
			puts "#{@company.company_name} was created!"
		end
		write_menu
	end

	def developer_menu(developer)

	end

	def manager_menu(manager)

	end

	def tester_menu(tester)

	end

end