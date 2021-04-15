class Carnival
  attr_reader :name,
              :rides,
              :attendees

  def initialize(name)
    @name = name
    @rides = []
    @attendees = []
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

  def admit(attendee)
    @attendees << attendee
  end

  def attendees_by_ride_interest
    by_ride_interest = {}
    @rides.each do |ride|
      @attendees.each do |attendee|
        if by_ride_interest[ride].nil?
          if attendee.interests.include?(ride.name)
            by_ride_interest[ride] = [attendee]
          elsif !by_ride_interest[ride].include?(attendee)
            by_ride_interest[ride] << attendee
          end
        else
          by_ride_interest[ride] = []
        end
      end
    end
    by_ride_interest
  end
end
