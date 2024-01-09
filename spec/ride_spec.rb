require 'spec_helper'
require 'rspec'

describe Ride do

  before :each do
    @ride1 = Ride.new({ name: "Carousel", min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: "Ferris Wheel", min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: "Roller Coaster", min_height: 54, admission_fee: 2, excitement: :thrilling })

    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  it 'exists' do

    expect(@ride1).to be_instance_of(Ride)
  end

  describe '#initialize' do
    it 'has attributes' do

      expect(@ride1.name).to eq("Carousel")
      expect(@ride1.min_height).to eq(24)
      expect(@ride1.admission_fee).to eq(1)
      expect(@ride1.excitement).to eq(:gentle)
    end
  end

  describe '#total_revenue' do
    it 'calculates total revenue from admission fees' do

      expect(@ride1.total_revenue).to eq(0)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      expect(@ride1.total_revenue).to eq(3)
    end
  end

end
