require 'rspec'
require './lib/carnival'
require './lib/ride'
require './lib/attendee'

RSpec.describe Carnival do
  context '#initialize' do
    jeffco_fair = Carnival.new("Jefferson County Fair")

    it 'exists' do
      expect(jeffco_fair).to be_instance_of(Carnival)
    end

    it 'has a name' do
      expect(jeffco_fair.name).to eq('Jefferson County Fair')
    end

    it 'has no rides yet' do
      expect(jeffco_fair.rides).to eq([])
    end
  end

  context '#add_ride' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})

    it 'adds rides to carnival' do
      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(scrambler)

      expected = [ferris_wheel, bumper_cars, scrambler]
      expect(jeffco_fair.rides).to eq(expected)
    end
  end
end
