require 'rails_helper'

describe Event, :type => :model do
  let(:event) { build_stubbed(:event) }

  describe "validations" do
  end

  describe "Instance methods" do
    
    it "return a events full address as a string" do
      expect(event.full_street_address).to eq("#{event.address_line_1}, #{event.city}, #{event.zipcode}")
    end

    it "returns the geocordinates associated to a event" do      
      expect(event.coords).to eq([event.latitude, event.longitude])
    end
  end

  it "is valid with valid parameters" do
    expect(build_stubbed(:event)).to be_valid
  end  
end
