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
  end
end
