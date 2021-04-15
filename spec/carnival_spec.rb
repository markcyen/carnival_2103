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

  context '#recommend_rides' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    bob = Attendee.new('Bob', 20)
    sally = Attendee.new('Sally', 20)
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally.add_interest('Scrambler')

    it 'recommends rides to Bob and Sally' do
      expect(jeffco_fair.recommend_rides(bob)).to eq([ferris_wheel, bumper_cars])
      expect(jeffco_fair.recommend_rides(sally)).to eq([scrambler])
    end
  end

  context '#attendees and #attendees_by_ride_interest' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)

    it 'no attendees yet' do
      expect(jeffco_fair.attendees).to eq([])
    end

    it 'captures admitted attendees at Jeff Co Fair' do
      bob = Attendee.new('Bob', 20)
      bob.add_interest('Ferris Wheel')
      bob.add_interest('Bumper Cars')
      sally = Attendee.new('Sally', 20)
      sally.add_interest('Bumper Cars')
      johnny = Attendee.new("Johnny", 5)
      johnny.add_interest('Bumper Cars')
      jeffco_fair.admit(bob)
      jeffco_fair.admit(sally)
      jeffco_fair.admit(johnny)

      expected = [bob, sally, johnny]
      expect(jeffco_fair.attendees).to eq(expected)
    end

    it 'returns has of rides with attendees based on interest' do
      bob = Attendee.new('Bob', 20)
      bob.add_interest('Ferris Wheel')
      bob.add_interest('Bumper Cars')
      sally = Attendee.new('Sally', 20)
      sally.add_interest('Bumper Cars')
      johnny = Attendee.new("Johnny", 5)
      johnny.add_interest('Bumper Cars')
      jeffco_fair.admit(bob)
      jeffco_fair.admit(sally)
      jeffco_fair.admit(johnny)

      expected = {
        ferris_wheel => [bob],
        bumper_cars => [bob, sally, johnny],
        scrambler => []
      }
      expect(jeffco_fair.attendees_by_ride_interest).to eq(expected)
    end
  end
end
