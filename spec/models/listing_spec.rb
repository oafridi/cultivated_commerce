require 'rails_helper'

RSpec.describe Listing, :type => :model do

  let(:valid_listing) { build(:listing) }
  let(:invalid_listing) { build(:listing, title:nil, description: nil) }

  context "with invalid params" do
    it "should fail validation" do
      expect(invalid_listing).to_not be_valid
    end

    it "should not create a Listing in the database" do
      expect{ invalid_listing.save }.to_not change{Listing.count}
    end
  end

  context "with valid params" do
    it "should pass validation" do
      expect(valid_listing).to be_valid
    end

    it "should increase the Listing count in the db" do
      expect { valid_listing.save }.to change { Listing.count }.by(1)
    end

    it "downcases the title" do
      valid_listing.save
      expect(valid_listing.title).to eq(valid_listing.title.downcase)
    end
  end
end
