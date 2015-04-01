require_relative './lib/company/company'
require_relative './lib/company/team'
require_relative './lib/company/company_creator'
require_relative './lib/employees/developer'
require_relative './lib/employees/tester'
require_relative './lib/employees/employee'
require_relative './lib/employees/manager'
require_relative './menu'

company=CompanyCreator.create_company

puts company.list_employees