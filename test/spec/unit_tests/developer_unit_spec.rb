require_relative "../../../lib/employees/employee"
require_relative "../../../lib/company/company_creator"

describe "developer unit test " do
	before :all do
		@company=CompanyCreator.create_company
	end

	context "valid data " do

		before :each do
			@dev=Developer.new("John","Doe",1)
		end

		context "initialization " do
			
			it "object created " do
			 	expect(@dev.nil?).to be_falsey
			 end
		end

		context "language methods " do
			
			it "adding and finding a programming language " do
				@dev.add_language("Ruby")

				expect(@dev.find_language("Ruby")).to eql("Ruby")
			end
		end

		context "doing tasks " do

			it "completed tasks: 10 " do
				expect(@dev.complete_tasks(10)).to eql(10)
			end
		end

		context "calculating pay " do
			let(:emp) { @company.employees[5] }

			it "calculates salary for the first developer " do
				salary=360.9
				expect(emp.calculate_pay(@company)).to eql(salary)
			end
		end
	end

	context "invalid data " do

		before :each do
			@dev=Developer.new("John","Doe",1)
		end

		context "language methods " do
			it "adding a nonstring to array" do
				expect(@dev.add_language(123)).to raise_error 
			end
		end

		context "doing tasks " do

			it "completed tasks: -1" do
				expect(@dev.complete_tasks(-1)).to raise_error
			end
		end

		context "calculating pay " do

			it "calculates salary for a nonexisting "
		end
	end
end