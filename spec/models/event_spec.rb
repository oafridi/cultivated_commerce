require 'rails_helper'

describe Event, :type => :model do
  let(:event) { build_stubbed(:event) }

  describe "validations" do
    describe "title" do
      # it "is invalid when greater"
    end
  end

  describe "instance methods" do
    
    it "return an events full address as a string" do
      expect(event.address).to eq("#{event.address_line_1}, #{event.city}, #{event.zipcode}")
    end

    it "returns the geocordinates associated to an event" do      
      expect(event.coordinates).to eq([event.latitude, event.longitude])
    end
  end

  it "is valid with valid parameters" do
    expect(event).to be_valid
  end
end
