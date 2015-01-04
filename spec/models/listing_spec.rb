require 'rails_helper'

RSpec.describe Listing, :type => :model do

  let(:listing) { build(:listing) }
  let(:item) { build(:item) }

  it "is valid with a listing, description, quantity and associated Item" do
    item.listings << listing
    expect(listing).to be_valid
  end

  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:item) }
  it { should belong_to(:item) }
  it { should belong_to(:user) }

  it "#format downcases the title" do
      listing.title = "UPCASE"
      item.listings << listing
      listing.save
      expect(listing.title).to eq(listing.title.downcase)
  end
end