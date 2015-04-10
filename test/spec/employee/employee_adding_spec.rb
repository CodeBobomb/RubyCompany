require_relative "../../helpers/company_creator"

describe "adding employee to the company " do
before :all do
	@company=CompanyCreator.create_company
end

context "adding developer \"John Doe id: 100\"" do
let(:company) { @company }
before do
	company.add_employee(Employee.new("John","Doe",100))
	@emp_searched=company.employees.select { |emp| emp.id==100}
end
it  "search and check if first_name matches" do	
	output_array=[]
	output_array<<@emp_searched[0].first_name
	output_array<<@emp_searched[0].last_name
	output_array<<@emp_searched[0].id
	expect(output_array).to match_array(["John","Doe",100])
end
end
context "adding developer with existing id" do
let(:company) { @company }
before do
	@existing_emp=Employee.new("John","Doe",10)
end
it "raise error" do
	expect(company.add_employee(@existing_emp)).to raise_error
end
end
end


