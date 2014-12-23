require 'rails_helper'

describe User, :type => :model do
  describe "validations" do
    describe 'email' do
      it "is invalid if blank" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "should accept valid values" do
        user = build(:user, email: nil)
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end    
      end

      it "should not accept invalid values" do
        user1 = build(:user, email: "ooo@ooo")
        expect(user1).not_to be_valid
      end

      it { should validate_uniqueness_of(:email) }
    end

    describe "password" do
      let(:user){ build(:user) }

      it "is invalid if blank" do
        user.password = nil
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")        
      end

      it 'is invalid when longer than 128 characters' do
        user.password = 'x' * 129
        expect(user.errors_on(:password)).to include('is too long (maximum is 128 characters)')
      end

      it 'is invalid when shorter than 8 characters' do
        user.password = 'x' * 4
        expect(user.errors_on(:password)).to include('is too short (minimum is 8 characters)')
      end

      # it 'ensures the confirmation matches' do
      #   user.password = 'test1234'
      #   user.password_confirmation = 'not correct'
      #   expect(user.errors_on(:password)).to include('this must match confirmation')
      # end
    end
  end

  it "is valid with valid parameters" do
    expect(build(:user)).to be_valid
  end  
 
end