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
  end

  describe "Class methods" do
  end

  describe "Instance methods" do
    it "return a users full address as a string" do
      expect(user.full_street_address).to eq("59 Yale Street, SF, 94134")
    end

    it "returns the geocordinates associated to a user" do      
      expect(user.coords).to eq([user.latitude, user.longitude])
    end
  end

  it "is valid with valid parameters" do
    expect(build(:user)).to be_valid
  end  
 
end