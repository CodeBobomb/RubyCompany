require_relative '../lib/company/company'
require_relative '../lib/company/team'
require_relative '../lib/employees/developer'
require_relative '../lib/employees/tester'
require_relative '../lib/employees/employee'
require_relative '../lib/employees/manager'

class Menu

private

	
	def write_emp_menu
		puts "\n\nEmployee ( #{@emp.first_name} #{@emp.last_name} id: #{@emp.id} ) enter one of the commands: "
		puts "\"Change name\" - if you want to change emplyoees name "
		puts "\"Set wage\" if you want to set employees wage"
		puts "\"Set worktime \" - if you want to set employee's working hours"
		puts "\"Set days\" - if you want to set number of working days in a week"
		puts "\"Exit\" - if you want to exit the menu"
		print "Enter your command: "
		command=gets.chomp
		command.downcase!
		execute_emp_menu(command)
	end

	def execute_emp_menu(command)
		case command
		when "change name"
			print "Enter new first name of the employee: "
			first_name=gets.chomp
			print "Enter new last name of the emplyoee: "
			last_name=gets.chomp
			@emp.first_name=first_name
			@emp.last_name=last_name
			puts "Name changed to: #{@emp.first_name} #{@emp.last_name}"
		when "set wage"
			print "Enter the new hourly wage: "
			wage_s=gets.chomp
			wage=wage_s.to_i
			@emp.wage=wage
			puts "Wage changed to: #{emp.wage}"
		when "set worktime"
			print "Enter the new working hours: "
			time_s=gets.chomp
			time=time_s.to_i
			@emp.worktime=worktime
			puts "Worktime changed to: #{emp.worktime}"
		when "set days"
			print "Enter number of working days: "
			days_s=gets.chomp
			days=days_s.to_i
			@emp.workdays=days
			puts "Workdays changed to: #{emp.workdays}"
		else
			@emp=nil
			return
		end

		write_dev_menu
	end

public

	
	def employee_menu(employee)
		@emp=employee
		write_emp_menu
	end
	
end