require_relative "../../lib/company/company"


describe Employee do
	before :all do
		@company=Company.new("ime")
	end
	describe ".initialize" do
		context "with valid data" do
			let(:company) { @company }
			it "compnay name" do
				puts company.company_name
				expect(1).to eql(1)
			end	
		end	
	end
end
