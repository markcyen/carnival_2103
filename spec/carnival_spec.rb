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
end
