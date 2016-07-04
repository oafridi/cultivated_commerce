require 'rails_helper'

RSpec.describe Item, :type => :model do

  let(:item) { build(:item) }

  it 'is valid with alphabetic kind and category' do
    expect(item).to be_valid
  end

  describe 'kind' do
    it 'is invalid when blank' do
      item.kind = ''
      item.valid?
      expect(item.errors[:kind]).to include("can't be blank")
    end

    it 'is invalid when contains non alphabetic characters' do
      invalid_kinds = %w[1234 1apple apple! @pple app_le]
      invalid_kinds.each do |invalid_kind|
        item.kind = invalid_kind
        item.valid?
        expect(item.errors[:kind]).to include('can only contain letters')
      end
    end
  end

  describe 'category' do
    it 'is invalid when blank' do
      item.category = ''
      item.valid?
      expect(item.errors[:category]).to include("can't be blank")
    end    
  end
end