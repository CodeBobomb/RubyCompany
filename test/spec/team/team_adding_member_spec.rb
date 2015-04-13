require_relative "../../helpers/company_creator"

describe "Adding member to a team/project " do

	before :all do
		@company=CompanyCreator.create_company
		@team=@company.teams[0]
	end

	context "Add a new member (developer) to team: Android" do
		let(:dev) { Developer.new("John","Doe",555) }
		it "member added" do
			@team.add_member(dev)
			expect(@team.has_member?(dev.id)).to eql(true)
		end
	end

	context "Add member of the team: Android to team: Android" do
		let(:dev) { Developer.new("John","Doe",@team.developers[0].id) }
		it "adding member failed" do
			expect(@team.add_member(dev)).to raise_error
		end
	end

	context "Add non employee object to team: Android" do
		it "adding object failed" do
			expect(@team.add_member("object")).to raise_error
		end
	end
end