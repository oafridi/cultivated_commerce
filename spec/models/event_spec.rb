require 'rails_helper'

describe Event, :type => :model do
  let(:event) { build_stubbed(:event) }

  it "is valid with valid parameters" do
    expect(event).to be_valid
  end

  describe "validations" do
    
    describe "title" do

      it "is invalid when blank" do
        event.title = ""
        event.valid?
        expect(event.errors[:title]).to include("can't be blank")
      end

      it 'is invalid when greater than 30 characters' do
        event.title = 'x' * 31
        event.valid?
        expect(event.errors[:title]).to include('is too long (maximum is 30 characters)')
      end

      it 'is invalid when less than 3 characters' do
        event.title = 'x' * 2
        event.valid?
        expect(event.errors[:title]).to include('is too short (minimum is 3 characters)')
      end

      it "is valid when between 3 and 30 characters" do
        min = "1" * 3
        mid = "1" * 16
        max = "1" * 30

        [min, mid, max].each do |valid_title|
          event.title = valid_title
          expect(event.errors[:title]).to be_empty
        end
      end

    end
    
    describe "address_line_1" do
      
      it "is invalid when blank" do
        event.address_line_1 = ""
        event.valid?
        expect(event.errors[:address_line_1]).to include("can't be blank")
      end

      it "is invalid when greater than 70 characters" do
        event.address_line_1 = "1" * 71
        event.valid?
        expect(event.errors[:address_line_1]).to include('is too long (maximum is 70 characters)')
      end

      it "is invalid when less than 7 characters" do
        event.address_line_1 = "1" * 6
        event.valid?
        expect(event.errors[:address_line_1]).to include('is too short (minimum is 7 characters)')
      end

    end

    describe "city" do

      it "is invalid when blank" do
        event.city = ""
        event.valid?
        expect(event.errors[:city]).to include("can't be blank")
      end

      it "is invalid when greater than 50 characters" do
        event.city = "1" * 51
        event.valid?
        expect(event.errors[:city]).to include('is too long (maximum is 50 characters)')
      end

      it "is invalid when less than 3 characters" do
        event.city = "1" * 2
        event.valid?
        expect(event.errors[:city]).to include('is too short (minimum is 3 characters)')
      end

    end

    describe "zipcode" do
      
      it "is invalid when blank" do
        event.zipcode = ""
        event.valid?
        expect(event.errors[:zipcode]).to include("can't be blank")
      end

    end

    describe "state" do
      
      it "is invalid when blank" do
        event.state = ""
        event.valid?
        expect(event.errors[:state]).to include("can't be blank")
      end      
      
      it "is valid when it is a two letter abbreviation" do
        event.state = "CA"
        event.valid?
        expect(event.errors[:state]).to be_empty
      end

      it "is invalid when length of the string isn't two" do

        [1, 3, 0].each do |invalid_length|
          event.state = "a" * invalid_length
          event.valid?
          expect(event.errors[:state]).to include("must be a valid two-letter abbreviation")
        end
        
      end
      
      it "is invalid when it contains non alphabetic characters" do
        invalid_states = [12, "!CA", "35", "CA$"]
        invalid_states.each do |invalid_state|
          event.state = invalid_state
          event.valid?
          expect(event.errors[:state]).to include("must be a valid two-letter abbreviation")
        end
      end 
    end

    describe "date" do

      it "is invalid when blank" do
        event.date = ""
        event.valid?
        expect(event.errors[:date]).to include("can't be blank")
      end

    end    

    describe "description" do

      it "is invalid when blank" do
        event.description = ""
        event.valid?
        expect(event.errors[:description]).to include("can't be blank")
      end

      it "is invalid when greater than 300 characters" do
        event.description = "1" * 301
        event.valid?
        expect(event.errors[:description]).to include('is too long (maximum is 300 characters)')
      end

      it "is invalid when less than 10 characters" do
        event.description = "1" * 9
        event.valid?
        expect(event.errors[:description]).to include('is too short (minimum is 10 characters)')
      end

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

  
end