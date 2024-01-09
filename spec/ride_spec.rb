require 'spec_helper'
require 'rspec'

describe Ride do
  carousel = "Carousel"
  ferris_wheel = "Ferris Wheel"
  coaster = "Roller Coaster"

  before :each do
    @ride1 = Ride.new({ name: carousel, min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: ferris_wheel, min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: coaster, min_height: 54, admission_fee: 2, excitement: :thrilling })

    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  it 'exists' do

    expect(@ride1).to be_instance_of(Ride)
  end

  describe '#initialize' do
    it 'has attributes' do

      expect(@ride1[name]).to eq(carousel)
      expect(@ride1[min_height]).to eq(24)
      expect(@ride1[addmission_fee]).to eq(1)
      expect(@ride1[excitement]).to eq(:gentle)
    end
  end
end
