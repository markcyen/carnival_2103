require './lib/ride'
require './lib/attendee'

RSpec.describe Attendee do
  context '#initialize' do
    attendee = Attendee.new('Bob', 20)

    it 'exists' do
      expect(attendee).to be_instance_of(Attendee)
    end

    it 'has a name' do
      expect(attendee.name).to eq("Bob")
    end

    it 'has spending money' do
      expect(attendee.spending_money).to eq(20)
    end

    it 'has no interests yet' do
      expect(attendee.interests).to eq([])
    end
  end

  context '#add_interest' do
    attendee = Attendee.new('Bob', 20)

    it 'adds interests' do
      attendee.add_interest('Bumper Cars')
      attendee.add_interest('Ferris Wheel')

      expect(attendee.interests).to eq(["Bumper Cars", "Ferris Wheel"])
    end
  end
end
