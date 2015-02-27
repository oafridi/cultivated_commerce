require 'rails_helper'

RSpec.describe Listing, :type => :model do

  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:item) }
  it { should validate_presence_of(:user) }
  it { should belong_to(:item) }
  it { should belong_to(:user) }

  let(:listing) { create(:listing) }

  it "is valid with a title, description, quantity, item and user" do    
    expect(listing).to be_valid
  end

  describe '#format' do
    it "downcases the title" do
      listing.title = "UPCASE"      
      listing.save
      expect(listing.title).to eq(listing.title.downcase)
    end
  end
end