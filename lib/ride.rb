class Ride
  attr_reader :name,
              :cost

  def initialize(ride_data)
    @name = ride_data[:name]
    @cost = ride_data[:cost]
  end
end
