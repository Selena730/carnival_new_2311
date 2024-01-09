require 'spec_helper'
require 'rspec'

describe Carnival do
  before :each do
    @carnival = Carnival.new(14) # 14 days duration
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Alice', 60, '$15')
  end

  it 'exists' do

    expect(@carnival). to be_instance_of(Carnival)
  end

  describe '#add_ride' do
    it 'adds rides to the carnival and lists the rides' do

      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
    end
  end

  describe '#most_popular_ride' do
    it 'tells what the most popular ride is' do

      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      @ride1.board_rider(@visitor1)
      @ride2.board_rider(@visitor1)
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor2)
      popular_ride = @carnival.most_popular_ride

      expect(popular_ride).to eq(@ride3)
    end
  end

  describe '#most_profitable_ride' do
    it 'tells what the most profitable ride is' do

      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      @ride1.board_rider(@visitor1)
      @ride2.board_rider(@visitor1)
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor2)
      profitable_ride = @carnival.most_profitable_ride

      expect(profitable_ride).to eq(@ride3)
    end
  end

  describe '#total_revenue' do
    it 'returns the total revenue from all rides' do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      @ride1.board_rider(@visitor1)
      @ride2.board_rider(@visitor1)
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor2)

      total_revenue = @ride1.total_revenue + @ride2.total_revenue + @ride3.total_revenue
      expect(@carnival.total_revenue).to eq(total_revenue)
    end
  end
end
