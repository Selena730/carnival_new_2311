require 'spec_helper'
require 'rspec'

describe Visitor do
  before :each do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  it 'exists' do

    expect(@visitor1).to be_instance_of(Visitor)
  end

  describe '#initialize' do
    it 'has a name, height, and spending money' do

      expect(@visitor1.name).to eq('Bruce')
      expect(@visitor1.height).to eq(54)
      expect(@visitor1.spending_money).to eq(10)
    end

    it 'starts with an empty preferences array' do
      expect(@visitor1.preferences).to eq([])
    end
  end

  describe '#add_preference' do
    it 'adds a preference to the visitor' do

      @visitor1.add_preference(:gentle)
      @visitor1.add_preference(:thrilling)
      expect(@visitor1.preferences).to contain_exactly(:gentle, :thrilling)
    end
  end

  describe '#tall_enough?' do
    it 'checks if the visitor is tall enough' do
      expect(@visitor1.tall_enough?(54)).to be true
      expect(@visitor2.tall_enough?(54)).to be false
      expect(@visitor3.tall_enough?(54)).to be true
      expect(@visitor1.tall_enough?(64)).to be false
    end
  end

end
