require 'rails_helper'

describe User, :type => :model do
  
  let(:user) { build_stubbed(:user) }
  
  describe "validations" do

    describe 'email' do
      it "is invalid if blank" do
        user.email = nil
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "should accept valid values" do        
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end    
      end

      it "should not accept invalid values" do        
        addresses = %w[oooo@foo 123456 abcdefgh a?/ass2e3d]
        addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).not_to be_valid
        end 
      end

      it { should validate_uniqueness_of(:email) }
    end

    describe "password" do

      it "is invalid if blank" do
        user.password = ""
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")        
      end

      it "is valid when between 8 to 20 characters" do
        min = "1" * 8
        mid = "1" * 14
        max = "1" * 20
        passwords = [min, mid, max]
        passwords.each do |valid_password|
          user.password = valid_password
          expect(user).to be_valid
        end
      end

      it 'is invalid when greater than 20 characters' do
        user.password = 'x' * 21
        user.valid?
        expect(user.errors[:password]).to include('is too long (maximum is 20 characters)')
      end

      it 'is invalid when shorter than 8 characters' do
        user.password = 'x' * 7
        user.valid?
        expect(user.errors[:password]).to include('is too short (minimum is 8 characters)')
      end


    end

    describe "first_name" do     
      it "is invalid when blank" do
        user.first_name = ""
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end

      it "is invalid when less than 2 characters" do
        user.first_name = "a"
        user.valid?
        expect(user.errors[:first_name]).to include('is too short (minimum is 2 characters)')        
      end

      it "is invalid when greater than 40 characters" do
        user.first_name = "a" * 41      
        user.valid?
        expect(user.errors[:first_name]).to include('is too long (maximum is 40 characters)')
      end

      it "is valid when between 2 to 40 characters" do
        min = "a" * 2
        mid = "a" * 21
        max = "a" * 40

        [min,mid,max].each do |valid_name|
          user.first_name = valid_name
          expect(user).to be_valid
        end
      end
    end    
  end

  describe "Instance methods" do
    it "return a users full address as a string" do
      expect(user.full_street_address).to eq("#{user.address_line_1}, #{user.city}, #{user.zipcode}")
    end

    it "returns the geocordinates associated to a user" do      
      expect(user.coords).to eq([user.latitude, user.longitude])
    end
  end

  it "is valid with valid parameters" do
    expect(build(:user)).to be_valid
  end  
 
end