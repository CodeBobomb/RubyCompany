require_relative "../../lib/company/company_creator"




describe "adding employee to the company" do

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
			expect(@emp_searched[0].first_name).to eql("John")
		end

		it "search and check if last_name matches" do
			expect(@emp_searched[0].last_name).to eql("Doe")
		end

		it "search and check if id matches" do
			expect(@emp_searched[0].id). to eql(100)
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


