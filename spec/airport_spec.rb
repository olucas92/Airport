require 'airport'
require 'plane'

describe Airport do
  
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  let(:grounded_plane) { double :plane, flying?: false }
  let(:flying_plane) { double :plane, flying?: true }

  context 'taking off and landing' do

    it "planes should be able to land" do
      plane.fly!
      plane.land!
      airport.dock(plane)
      expect(airport.plane_count).to eq(1)
    end

    it "planes should be able to take off" do
      expect(grounded_plane).to receive(:take_off)
      airport.release(grounded_plane)
      expect(airport.plane_count).to eq(0)
    end
  end

  context 'traffic control' do

    it "planes should not be able to land if the airport is full" do
      fill_airport(airport)
      
      expect{ airport.dock(plane) }.to raise_error(RuntimeError,'Sorry, the airport is full!')
    end
  end

  context 'weather control' do

    it "planes should not be able to land in a storm" do
      allow(airport).to receive(:stormy?).and_return true
      expect(lambda {airport.dock(plane)}).to raise_error(RuntimeError, "It's too stormy to land!")
    end

    it "planes should not be able to take off in a storm" do
      allow(airport).to receive(:stormy?).and_return true
      expect(lambda {airport.release(plane)}).to raise_error(RuntimeError, "It's too stormy to take off!")
    end

    it "weather should be random for every day" do
      airport.next_day
      expect(["sunny", "stormy"].include?(airport.conditions)).to eq true
    end

  end

end

def fill_airport(airport)
  airport.capacity.times { airport.dock(Plane.new) } 
end