require_relative "../../helpers/company_creator"

describe "adding employees to the company object " do

	before :all do
		@company=CompanyCreator.create_company
	end

	context "Adding developer \"John Doe id: 100\"" do	
		before do
			@company.add_employee(Employee.new("John","Doe",100))
			@emp_searched=@company.employees.select { |emp| emp.id==100}
		end
		it  "employee added" do	
			output_array=[@emp_searched[0].first_name,@emp_searched[0].last_name,@emp_searched[0].id]
			expect(output_array).to match_array(["John","Doe",100])
		end
	end

	# @existing_emp je uvijek nil, ako koristis let onda koristis existing_emp
	# nije mi bas najjasniji test, dodajes developera sa vec postojecim id-em i provjeravas da li raisan error?
	# raise_error matcher ide sa expect { ... }. Pogledaj: https://www.relishapp.com/rspec/rspec-expectations/v/2-7/docs/built-in-matchers/raise-error-matcher
	context "Addin developer with existing id: 10" do
		let(:existing_emp) {Employee.new("John","Doe",10)}
		it "error raised" do
			expect(@company.add_employee(@existing_emp)).to raise_error
		end
	end
end


