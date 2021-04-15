class Carnival
  attr_reader :name,
              :rides

  def initialize(name)
    @name = name
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def recommend_rides(attendee)
    capture_rides = []
    @rides.each do |ride|
      capture_rides << ride if attendee.interests.include?(ride.name)
    end
    capture_rides
  end
end
